import CryptoKit
import Darwin
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Real HTTP parser/handlers and real model, over bounded socket pairs.
    /// This covers response framing, not TCP admission or network timing.
    public static func optimizationReadFailureServing(modelDir: URL) async throws -> CheckReport {
        let engine = try await Engine(modelDir: modelDir,poolSlots: 640)
        engine.generator.speculationEnabled = false
        engine.generator.prefillChunk = 256
        engine.generator.prefillCacheLimit = 64 << 20
        let server = Server(engine: engine,port: 0)
        signal(SIGPIPE,SIG_IGN)
        var c = CheckBuilder("optimization-read-failure-serving")

        func exchange(_ path: String,_ object: [String:Any]?) throws -> (head: String,body: String) {
            let payload = try object.map { try JSONSerialization.data(withJSONObject: $0) } ?? Data()
            var fds: [Int32] = [-1,-1]
            guard socketpair(AF_UNIX,SOCK_STREAM,0,&fds)==0 else { throw ModelError("socketpair failed") }
            let client = fds[0], peer = fds[1]
            var timeout = timeval(tv_sec: 30,tv_usec: 0), one: Int32 = 1
            for fd in fds {
                setsockopt(fd,SOL_SOCKET,SO_RCVTIMEO,&timeout,socklen_t(MemoryLayout<timeval>.size))
                setsockopt(fd,SOL_SOCKET,SO_SNDTIMEO,&timeout,socklen_t(MemoryLayout<timeval>.size))
                setsockopt(fd,SOL_SOCKET,SO_NOSIGPIPE,&one,socklen_t(MemoryLayout<Int32>.size))
            }
            let finished = DispatchSemaphore(value: 0)
            Thread.detachNewThread { server.handle(peer); finished.signal() }
            defer { shutdown(client,SHUT_RDWR); close(client) }
            let method = object == nil ? "GET" : "POST"
            let head = "\(method) \(path) HTTP/1.1\r\nHost: localhost\r\nContent-Type: application/json\r\nContent-Length: \(payload.count)\r\nConnection: close\r\n\r\n"
            let request = Data(head.utf8)+payload
            var wire = Data()
            do {
                try request.withUnsafeBytes { buffer in
                    var sent = 0
                    while sent < buffer.count {
                        let n = Darwin.send(client,buffer.baseAddress!+sent,buffer.count-sent,0)
                        if n<0 && errno==EINTR { continue }
                        guard n>0 else { throw ModelError("request write failed") }
                        sent += n
                    }
                }
                var buffer = [UInt8](repeating: 0,count: 8192)
                while true {
                    let n = recv(client,&buffer,buffer.count,0)
                    if n<0 && errno==EINTR { continue }
                    guard n>=0 else { throw ModelError("response read failed or timed out") }
                    if n==0 { break }
                    wire.append(contentsOf: buffer.prefix(n))
                    guard wire.count <= 1<<20 else { throw ModelError("response exceeds diagnostic bound") }
                }
            } catch {
                shutdown(client,SHUT_RDWR)
                guard finished.wait(timeout: .now()+30) == .success else { throw ModelError("handler did not finish after disconnect") }
                throw error
            }
            guard finished.wait(timeout: .now()+30) == .success else { throw ModelError("handler did not finish") }
            guard let separator = wire.range(of: Data("\r\n\r\n".utf8)) else { throw ModelError("missing HTTP head") }
            let responseHead = String(decoding: wire[..<separator.lowerBound],as: UTF8.self)
            let raw = Data(wire[separator.upperBound...])
            if !responseHead.lowercased().contains("transfer-encoding: chunked") {
                return (responseHead,String(decoding: raw,as: UTF8.self))
            }
            var body = Data(), cursor = 0
            while cursor<raw.count {
                guard let end = raw[cursor...].range(of: Data("\r\n".utf8)),
                    let n = Int(String(decoding: raw[cursor..<end.lowerBound],as: UTF8.self),radix: 16)
                else { throw ModelError("malformed chunk length") }
                cursor = end.upperBound
                guard n>=0,n<=raw.count-cursor,raw.count-cursor-n>=2,
                    raw[cursor+n]==13,raw[cursor+n+1]==10 else { throw ModelError("incomplete HTTP chunk") }
                if n==0 {
                    guard cursor+2==raw.count else { throw ModelError("unexpected trailing HTTP bytes") }
                    return (responseHead,String(decoding: body,as: UTF8.self))
                }
                body.append(raw[cursor..<cursor+n]); cursor += n+2
            }
            throw ModelError("missing terminating HTTP chunk")
        }
        let text = "Print exactly: one two three four five six seven eight."
        let rawIds = engine.tokenizer.encode(text: text)
        let chatIds = try engine.encodeChatOpenAI(messages: [["role":"user","content":text]], tools: nil)
        let gatewayIds = try engine.encodeChat([ChatMessage(role: "user", content: text)], thinking: false)

        func objects(_ body: String, stream: Bool) throws -> [[String:Any]] {
            let lines = stream ? body.split(separator: "\n").map(String.init) : [body]
            return try lines.compactMap { line -> [String:Any]? in
                var value = line.trimmingCharacters(in: .whitespacesAndNewlines)
                if value.hasPrefix("data:") { value = String(value.dropFirst(5)).trimmingCharacters(in: .whitespaces) }
                if value.isEmpty || value=="[DONE]" { return nil }
                return try JSONSerialization.jsonObject(with: Data(value.utf8)) as? [String:Any]
            }
        }
        func hasError(_ values: [[String:Any]]) -> Bool {
            values.contains { $0["error"] != nil || $0["type"] as? String == "error" }
        }
        func hasCompletion(_ values: [[String:Any]]) -> Bool {
            values.contains { object in
                if object["done"] as? Bool == true || object["type"] as? String == "finish" { return true }
                let choices = object["choices"] as? [[String:Any]] ?? []
                return choices.contains { $0["finish_reason"] != nil && !($0["finish_reason"] is NSNull) }
            }
        }
        func outputText(_ values: [[String:Any]]) -> String {
            values.map { object in
                let message = object["message"] as? [String:Any] ?? [:]
                let choices = object["choices"] as? [[String:Any]] ?? []
                let choiceMessage = choices.first?["message"] as? [String:Any] ?? [:]
                let delta = choices.first?["delta"] as? [String:Any] ?? [:]
                let parts: [String?] = [object["response"] as? String, message["content"] as? String,
                    choiceMessage["content"] as? String, delta["content"] as? String,
                    object["type"] as? String == "text-delta" ? object["delta"] as? String : nil]
                return parts.compactMap { $0 }.joined()
            }.joined()
        }
        func checkpointFields(_ ids: [Int]) throws -> [String:String] {
            let key = PromptCheckpointKey(model: engine.model.promptCheckpointIdentity,
                optimizations: engine.model.optimizations, prefillChunk: engine.generator.prefillChunk, mtp: false)
            guard let hit = engine.prefixCache.takeForGeneration(matching: ids, completePromptKey: key),
                  hit.reused == ids.count, hit.state.tokenCount == ids.count, let logits = hit.logits else {
                throw ModelError("read-failure diagnostic lost the complete prompt checkpoint")
            }
            try hit.state.validatePrefixFork()
            func hash(_ a: MLXArray) -> String {
                "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
            }
            var fields = hit.state.prefixForkDiagnosticTensors().mapValues(hash)
            fields["rawLogits"] = hash(logits)
            // Return only digests: the borrowed active branch must be released
            // before the next HTTP request reserves its own state.
            return fields
        }
        let variants: [(String,String,Bool,[String:Any])] = [
            ("generate JSON","/api/generate",false,["model":engine.modelName,"prompt":text,"raw":true,"stream":false,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("generate NDJSON","/api/generate",true,["model":engine.modelName,"prompt":text,"raw":true,"stream":true,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("chat JSON","/api/chat",false,["model":engine.modelName,"messages":[["role":"user","content":text]],"think":false,"stream":false,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("chat NDJSON","/api/chat",true,["model":engine.modelName,"messages":[["role":"user","content":text]],"think":false,"stream":true,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("OpenAI JSON","/v1/chat/completions",false,["model":engine.modelName,"messages":[["role":"user","content":text]],"stream":false,"max_tokens":8,"temperature":0,"seed":7]),
            ("OpenAI SSE","/v1/chat/completions",true,["model":engine.modelName,"messages":[["role":"user","content":text]],"stream":true,"max_tokens":8,"temperature":0,"seed":7]),
            ("Gateway SSE","/v3/ai/language-model",true,["prompt":[["role":"user","content":[["type":"text","text":text]]]],"toolChoice":["type":"auto"],"maxOutputTokens":8,"temperature":0,"seed":7]),
        ]
        for checkpointed in [false,true] {
            engine.model.optimizations.completePromptCheckpoint = checkpointed
            for queued in [false,true] {
                engine.model.optimizations.boundedOutputQueue = queued
                for (name,path,stream,body) in variants {
                    let label = "\(name), queued=\(queued), checkpointed=\(checkpointed)"
                    let ids = path == "/api/generate" ? rawIds : path == "/v3/ai/language-model" ? gatewayIds : chatIds
                    FileHandle.standardError.write(Data("read failure \(label)\n".utf8))
                    // Run an independent cold request before injecting the fault.
                    // Its committed prompt state, logits and delivered output are
                    // the oracle; no state from the failed request defines it.
                    engine.prefixCache.enabled = false; engine.prefixCache.enabled = true
                    let reference = try exchange(path,body)
                    let referenceObjects = try objects(reference.body, stream: stream)
                    c.expect("\(label): independent cold request succeeds",reference.head.hasPrefix("HTTP/1.1 200")
                        && hasCompletion(referenceObjects) && !hasError(referenceObjects),reference.body)
                    let expectedText = outputText(referenceObjects)
                    c.expect("\(label): independent output is nonempty",!expectedText.isEmpty,reference.body)
                    let expectedFields = checkpointed ? try checkpointFields(ids) : [:]
                    engine.prefixCache.enabled = false; engine.prefixCache.enabled = true
                    Stream.gpu.synchronize()
                    try engine.model.pool.diagnosticDiscardResidency()
                    let fault = ReadFault(afterJobs: 0)
                    var passes = 0
                    // Fail the main decode pass after prefill emitted a token.
                    // No test-only network endpoint or environment bypass exists.
                    engine.model.routerObserver = { layer,_ in
                        if layer==0 {
                            passes += 1
                            if passes==2 { engine.model.pool.readFault = fault }
                        }
                    }
                    let response: (head: String,body: String)
                    do { response = try exchange(path,body) }
                    catch {
                        engine.model.routerObserver = nil; engine.model.pool.readFault = nil
                        throw error
                    }
                    engine.model.routerObserver = nil; engine.model.pool.readFault = nil
                    c.expect("\(label): real read fault fired",fault.hasFired)
                    c.expect("\(label): correct HTTP status",response.head.hasPrefix(stream ? "HTTP/1.1 200" : "HTTP/1.1 500"),response.head)
                    let responseObjects = try objects(response.body, stream: stream)
                    c.expect("\(label): explicit inference error frame",hasError(responseObjects),response.body)
                    c.expect("\(label): no false successful completion",!hasCompletion(responseObjects))
                    if stream {
                        let emitted = outputText(responseObjects)
                        c.expect("\(label): error follows delivered text",!emitted.isEmpty,response.body)
                        c.expect("\(label): delivered prefix matches cold output",expectedText.hasPrefix(emitted),response.body)
                    }
                    // A failed active state is never retained. An independently
                    // forked, complete prefill checkpoint predates the decode
                    // failure and must remain usable without recomputing prefill.
                    c.equal("\(label): only committed prompt tokens retained",engine.prefixCache.heldTokens,checkpointed ? ids.count : 0)
                    c.equal("\(label): checkpoint retention follows option",engine.prefixCache.heldCheckpoints,checkpointed ? 1 : 0)
                    c.equal("\(label): failed active state absent",engine.prefixCache.json()["conversations"] as? Int,checkpointed ? 1 : 0)
                    c.equal("\(label): request pins released",engine.model.pool.pinnedSlotCount,0)
                    if checkpointed {
                        c.equal("\(label): retained state and raw logits exactly match independent prefill",try checkpointFields(ids),expectedFields)
                    }
                    let health = try exchange("/api/version",nil)
                    c.expect("\(label): server remains responsive",health.head.hasPrefix("HTTP/1.1 200"))
                    // checkpointFields itself borrows the checkpoint, so measure
                    // reuse only after that inspection has returned its branch.
                    let hitsBeforeRetry = engine.prefixCache.checkpointHits
                    let sameRetry = try exchange(path,body)
                    let sameObjects = try objects(sameRetry.body, stream: stream)
                    c.expect("\(label): same HTTP request recovers",sameRetry.head.hasPrefix("HTTP/1.1 200")
                        && hasCompletion(sameObjects) && !hasError(sameObjects),sameRetry.body)
                    c.equal("\(label): same HTTP retry reproduces independent output",outputText(sameObjects),expectedText)
                    c.equal("\(label): same HTTP retry reuses only enabled checkpoint",engine.prefixCache.checkpointHits-hitsBeforeRetry,checkpointed ? 1 : 0)
                    c.equal("\(label): same HTTP retry releases request pins",engine.model.pool.pinnedSlotCount,0)
                    let retry = try exchange("/api/generate",["model":engine.modelName,"prompt":"Say only: ok","stream":false,"think":false,
                        "options":["num_predict":8,"temperature":0,"seed":7]])
                    let retryObject = try JSONSerialization.jsonObject(with: Data(retry.body.utf8)) as? [String:Any]
                    c.expect("\(label): next request succeeds",retry.head.hasPrefix("HTTP/1.1 200") && retryObject?["done"] as? Bool == true && retryObject?["error"] == nil,retry.body)
                    c.equal("\(label): successful HTTP retry releases request pins", engine.model.pool.pinnedSlotCount, 0)
                }
            }
        }
        return c.report()
    }
}
