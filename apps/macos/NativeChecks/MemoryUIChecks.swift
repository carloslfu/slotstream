import AppKit
import SwiftUI
import Vision
@testable import SevraMac
@testable import SevraRuntime

/// Render the production settings with simulated telemetry, without a model,
/// user Home, preference writes, or a visible window.
@main struct MemoryUIChecks {
    @MainActor static func main() async throws {
        NSApplication.shared.setActivationPolicy(.prohibited)
        let out = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_UI_OUT"]!)
        let model = AppModel()
        let window = NSWindow(contentRect: NSRect(x: -30000, y: -30000, width: 620, height: 700),
            styleMask: [.borderless], backing: .buffered, defer: false)
        window.setFrameOrigin(NSPoint(x: -30000, y: -30000))
        defer { window.orderOut(nil) }
        for dark in [false, true] {
            for mode in ["automatic", "custom", "saved-above-range"] {
                let custom = mode != "automatic"
                let overRange = mode == "saved-above-range"
                let preferences = custom ? PerformancePreferences(budget: .custom, customGB: 48) : .init()
                model.performancePreferences = preferences
                model.snapshot = RuntimeSnapshot(home: .init(), modelStatus: "Ready", error: nil, simulated: true)
                model.performanceState.snapshot = PerformanceSnapshot(preferences: preferences,
                    pending: custom, state: "In use", loaded: true, busy: true, usedGB: 13,
                    budgetGB: 14.5, recommendationGB: 14.5, maximumGB: overRange ? 37 : 49.5,
                    detail: "Responding on your Mac.", idleMinutes: 10)
                window.appearance = NSAppearance(named: dark ? .darkAqua : .aqua)
                let host = NSHostingView(rootView: Form { PerformanceSettings(model: model, performance: model.performanceState) }
                    .formStyle(.grouped).frame(width: 620, height: 700))
                window.contentView = host
                window.orderFront(nil)
                guard !NSScreen.screens.contains(where: { $0.frame.intersects(window.frame) }) else {
                    throw NSError(domain: "MemoryUI", code: 1, userInfo: [NSLocalizedDescriptionKey: "check must remain offscreen"])
                }
                for _ in 0..<30 { host.layoutSubtreeIfNeeded(); try await Task.sleep(nanoseconds: 20_000_000) }
                let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: 1240, pixelsHigh: 1400,
                    bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false,
                    colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
                rep.size = host.bounds.size
                host.cacheDisplay(in: host.bounds, to: rep)
                let name = "\(dark ? "dark" : "light")-\(mode)"
                try rep.representation(using: .png, properties: [:])!.write(to: out.appendingPathComponent(name + ".png"))
                let request = VNRecognizeTextRequest(); request.recognitionLevel = .accurate
                try VNImageRequestHandler(cgImage: rep.cgImage!, options: [:]).perform([request])
                let text = (request.results ?? []).compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
                let labels = ["Memory budget", "Budget available now", "14.5 GB", "Keep model ready"]
                    + (custom ? ["Custom limit", "48", overRange ? "37 GB" : "49.5 GB", "Your limit stays saved", "Applies after"] : ["Automatic", "Recommended now"])
                    + (overRange ? ["Choose between"] : [])
                for label in labels where !text.localizedCaseInsensitiveContains(label) {
                    throw NSError(domain: "MemoryUI", code: 2, userInfo: [NSLocalizedDescriptionKey: "\(name) missing rendered label: \(label)\n\(text)"])
                }
                print("PASS: \(name), rendered controls, current budget, supported range and pending state")
            }
            // Render the production response-details view at its actual width:
            // the saved ceiling must remain readable beside a smaller budget.
            var metrics = ResponseMetrics()
            metrics.budgetGB = 14.5; metrics.memoryLimitGB = 48; metrics.customBudget = true
            var run = Run(id: "memory-receipt", nonce: "ui", inputDigest: "ui", state: .completed, status: "Done")
            run.metrics = metrics
            model.snapshot?.home.threads[0].run = run
            // The real popover supplies a material background. Supply its
            // window color here so transparent pixels do not hide dark text
            // from the screenshot or OCR.
            let details = NSHostingView(rootView: ResponseDetailsView(model: model, threadID: "home", runID: run.id)
                .background(Color(nsColor: .windowBackgroundColor)))
            window.contentView = details
            for _ in 0..<30 { details.layoutSubtreeIfNeeded(); try await Task.sleep(nanoseconds: 20_000_000) }
            let rep = details.bitmapImageRepForCachingDisplay(in: details.bounds)!
            details.cacheDisplay(in: details.bounds, to: rep)
            let name = "\(dark ? "dark" : "light")-response-budget"
            try rep.representation(using: .png, properties: [:])!.write(to: out.appendingPathComponent(name + ".png"))
            let request = VNRecognizeTextRequest(); request.recognitionLevel = .accurate
            try VNImageRequestHandler(cgImage: rep.cgImage!, options: [:]).perform([request])
            let text = (request.results ?? []).compactMap { $0.topCandidates(1).first?.string }.joined(separator: " ")
            for label in ["Memory budget", "14.5 GB", "48.0 GB limit"] where !text.contains(label) {
                throw NSError(domain: "MemoryUI", code: 3, userInfo: [NSLocalizedDescriptionKey: "\(name) missing \(label): \(text)"])
            }
            print("PASS: \(name), reduced budget and saved ceiling remain readable")
        }
    }
}
