import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationNgramPrefetchTicket() throws -> CheckReport {
        var c = CheckBuilder("optimization-ngram-prefetch-ticket")
        let gids = (0..<97).map { Int64($0*17) }
        let ticket = NgramPrefetch(prefix:gids,missing:gids,cacheRevision:7,
            reader:{ gid,_ in [Float(gid),Float(gid+1)] })
        c.equal("joined rows retain requested order",try ticket.joinedRows(),gids.map { [Float($0),Float($0+1)] })
        c.equal("ticket preserves its cache generation",ticket.cacheRevision,7)
        ticket.cancelAndJoin()
        do { _ = try ticket.joinedRows(); c.expect("cancelled ticket cannot publish",false) }
        catch CheckpointReadError.cancelled { c.expect("cancelled ticket cannot publish",true) }
        let lock = NSLock(); var running = 0
        let fault = ReadFault(afterJobs:3)
        let failed = NgramPrefetch(prefix:gids,missing:gids,cacheRevision:0,reader:{ gid,_ in
            lock.withLock { running += 1 }
            defer { lock.withLock { running -= 1 } }
            try fault.beforeRead()
            return [Float(gid)]
        })
        do { _ = try failed.joinedRows(); c.expect("read error rejects entire result",false) }
        catch is CheckpointReadError { c.expect("read error rejects entire result",true) }
        c.expect("injected fault was used",fault.hasFired)
        c.equal("all failed ticket workers joined",lock.withLock { running },0)
        for _ in 0..<20 {
            let cancelled = NgramPrefetch(prefix:gids,missing:gids,cacheRevision:0,reader:{ gid,_ in
                lock.withLock { running += 1 }
                defer { lock.withLock { running -= 1 } }
                return [Float(gid)]
            })
            cancelled.cancelAndJoin()
            c.equal("cancellation drains every owned worker",lock.withLock { running },0)
        }
        let entered = DispatchSemaphore(value:0)
        let interrupted = NgramPrefetch(prefix:[1],missing:[1],cacheRevision:0,reader:{ _,shouldContinue in
            var byte: UInt8 = 0
            try withUnsafeMutablePointer(to:&byte) { pointer in
                try ExactRead.transfer(into:pointer,offset:0,count:1,shouldContinue:shouldContinue,read:{ _,_,_ in
                    entered.signal()
                    return .init(count:-1,error:EINTR)
                })
            }
            return [Float(byte)]
        })
        c.expect("interrupted read seam entered",entered.wait(timeout:.now()+2) == .success)
        interrupted.cancelAndJoin()
        do { _ = try interrupted.joinedRows(); c.expect("cancellation stops repeated EINTR",false) }
        catch CheckpointReadError.cancelled { c.expect("cancellation stops repeated EINTR",true) }
        return c.report()
    }

    public static func optimizationNgramLookahead(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        let model = try Qwen4ExpModel(index:CheckpointIndex(dir:modelDir),poolSlots:640)
        let index = try CheckpointIndex(dir:modelDir)
        var c = CheckBuilder("optimization-ngram-lookahead")
        let eos = Int64(model.cfg.eosTokenId)
        func history(_ n: Int,_ salt: Int = 0) -> [Int64] {
            [eos,1137] + (0..<n).map { $0 % 13 == 7 ? eos : Int64(1000+(($0*7919+salt*97)%200000)) }
        }
        func exact(_ name: String,_ a: MLXArray,_ b: MLXArray) {
            c.expect(name,a.shape == b.shape && a.dtype == b.dtype &&
                (a.reshaped([-1]).view(dtype:.uint8) .== b.reshaped([-1]).view(dtype:.uint8)).all().item(Bool.self))
        }
        for capacity in [2,17,256,400_000] { for compact in [false,true] { for ring in [false,true] {
            let reference = NgramStore(index:index,resident:model.resident,cacheCapacity:capacity)
            let candidate = NgramStore(index:index,resident:model.resident,cacheCapacity:capacity)
            reference.compactRows = compact; candidate.compactRows = compact
            reference.ringEvictionOrder = ring; candidate.ringEvictionOrder = ring
            let label = "capacity \(capacity), compact \(compact), ring \(ring)"
            for n in [0,1,17,257] {
                let ids = history(n,n)
                let a = try reference.embeddingChecked(history:ids,nNew:n)
                let ticket = try candidate.beginPrefetch(history:ids,nNew:n)
                if let ticket { c.expect("\(label): bounded row payload",ticket.missing.count <= min(capacity,16_384)) }
                let b = try candidate.embeddingChecked(history:ids,nNew:n)
                exact("\(label), \(n) tokens: exact EOS-aware embedding",a,b)
                c.equal("\(label), \(n): cache size unchanged",candidate.cachedRowCount,reference.cachedRowCount)
                c.equal("\(label), \(n): same miss accounting",candidate.rowMisses,reference.rowMisses)
                c.equal("\(label), \(n): same hit accounting",candidate.rowHits,reference.rowHits)
                c.expect("\(label), \(n): ticket consumed",!candidate.hasPendingPrefetch)
                if let ticket { candidate.discardPrefetch(ticket) }
            }
            c.expect("\(label): capacity stays bounded",candidate.cachedRowCount <= capacity)
            c.expect("\(label): expected lookahead activation",capacity < 16 ? candidate.lookaheadRowsConsumed == 0 : candidate.lookaheadRowsConsumed > 0)
        } } }
        let ids = history(17)
        let reference = NgramStore(index:index,resident:model.resident)
        let expected = try reference.embeddingChecked(history:ids,nNew:17)
        for mutation in ["mode","cache","handles","history","supersede"] {
            let candidate = NgramStore(index:index,resident:model.resident)
            let old = try candidate.beginPrefetch(history:mutation == "history" || mutation == "supersede" ? history(17,1) : ids,nNew:17)!
            switch mutation {
            case "mode": candidate.compactRows = true
            case "cache": _ = try candidate.debugRowChecked(17)
            case "handles": candidate.directReadHandles = true
            case "supersede":
                _ = try candidate.beginPrefetch(history:ids,nNew:17)
                candidate.discardPrefetch(old)
                c.expect("old cleanup cannot discard a newer ticket",candidate.hasPendingPrefetch)
            default: break
            }
            exact("\(mutation): stale result never changes embedding",try candidate.embeddingChecked(history:ids,nNew:17),expected)
            c.expect("\(mutation): stale ticket discarded",candidate.lookaheadTicketsDiscarded >= 1)
            c.expect("\(mutation): no pending ticket after consume",!candidate.hasPendingPrefetch)
            if mutation != "supersede" { c.equal("\(mutation): stale rows not consumed",candidate.lookaheadRowsConsumed,0) }
            candidate.discardPrefetch(old)
        }
        for compact in [false,true] {
            let candidate = NgramStore(index:index,resident:model.resident)
            candidate.compactRows = compact
            let fault = ReadFault(afterJobs:3); candidate.readFault = fault
            let ticket = try candidate.beginPrefetch(history:ids,nNew:17)!
            do { _ = try candidate.embeddingChecked(history:ids,nNew:17); c.expect("async row error returned",false) }
            catch is CheckpointReadError { c.expect("async row error returned",true) }
            c.expect("async row fault fired",fault.hasFired)
            c.equal("async failure publishes no partial cache",candidate.cachedRowCount,0)
            c.expect("async failure clears pending ticket",!candidate.hasPendingPrefetch)
            candidate.discardPrefetch(ticket); candidate.readFault = nil
            exact("async failure exact retry",try candidate.embeddingChecked(history:ids,nNew:17),expected)
        }
        // A tiny cache evicts rows during insertion. Its later serial fallback
        // must propagate read errors too, even after prefetch has succeeded.
        let small = NgramStore(index:index,resident:model.resident,cacheCapacity:2)
        let one = history(1)
        let count = Set(small.rowIds(history:one,nNew:1).flatMap{$0}).count
        let fault = ReadFault(afterJobs:count); small.readFault = fault
        do { _ = try small.embeddingChecked(history:one,nNew:1); c.expect("post-eviction fallback error returned",false) }
        catch is CheckpointReadError { c.expect("post-eviction fallback error returned",true) }
        c.expect("post-eviction fallback fault fired",fault.hasFired)
        c.expect("failed fallback preserves capacity",small.cachedRowCount <= 2)
        small.readFault = nil
        exact("post-eviction fallback exact retry",try small.embeddingChecked(history:one,nNew:1),try reference.embeddingChecked(history:one,nNew:1))
        // Cancel after layer zero, before PLE is allowed to publish any row.
        // The transactional scope must restore every recurrent/history field.
        var options = InferenceOptimizations(); options.ngramLookahead = true
        model.optimizations = options
        let state = model.makeState()
        let seed = (0..<17).map { 2000+$0*79 }
        eval(try model.lastLogitsChecked(seed,state:state))
        let before = state.diagnosticTensors()
        model.ngram.compactRows = true; model.ngram.compactRows = false
        let discarded = model.ngram.lookaheadTicketsDiscarded
        var calls = 0
        let result = try model.consumeReadScopeChecked((0..<17).map { 3000+$0*79 },passes:[17],state:state,
            vision:[],head:nil,final:true,shouldContinue:{ calls += 1; return calls < 2 })
        c.expect("cancel before PLE is not committed",!result.committed && result.logits == nil)
        c.expect("cancel before PLE joins pending reads",!model.ngram.hasPendingPrefetch)
        c.equal("cancel before PLE discards one ticket",model.ngram.lookaheadTicketsDiscarded-discarded,1)
        c.equal("cancel before PLE publishes no cache rows",model.ngram.cachedRowCount,0)
        let after = state.diagnosticTensors()
        c.equal("cancel before PLE preserves state fields",Set(before.keys),Set(after.keys))
        for name in before.keys.sorted() {
            if let value = after[name] { exact("cancel restores \(name)",before[name]!,value) }
        }
        return c.report()
    }
}
