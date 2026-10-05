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
        let window = NSWindow(contentRect: NSRect(x: -30000, y: -30000, width: 620, height: 1050),
            styleMask: [.borderless], backing: .buffered, defer: false)
        window.setFrameOrigin(NSPoint(x: -30000, y: -30000))
        defer { window.orderOut(nil) }
        for appearance in ["light", "dark", "system"] {
            for mode in ["automatic", "custom", "saved-above-range", "saved-below-range", "unavailable-range", "failed-settings", "failed-activation", "corrupt-activation", "corrupt-pending-settings", "fixed", "unavailable-pack"] {
                let custom = mode != "automatic"
                let overRange = mode == "saved-above-range"
                let belowRange = mode == "saved-below-range"
                let rangeAvailable = mode != "unavailable-range"
                let corrupt = ["corrupt-activation", "corrupt-pending-settings"].contains(mode)
                let failedPending = mode == "corrupt-pending-settings"
                let activationFailed = mode == "failed-activation" || corrupt
                var preferences = custom ? PerformancePreferences(budget: .custom, customGB: belowRange ? 10 : 48) : .init()
                if mode == "fixed" { preferences.liveMemory = .fixed }
                if mode == "unavailable-pack" { preferences.quantization = .pack("removed-pack") }
                model.performancePreferences = preferences
                model.snapshot = RuntimeSnapshot(home: .init(), modelStatus: "Ready", error: nil, simulated: true)
                model.performanceState.snapshot = PerformanceSnapshot(preferences: preferences,
                    pending: failedPending || (custom && !activationFailed), state: activationFailed ? "Model change failed" : "In use", loaded: !corrupt,
                    busy: !activationFailed, usedGB: 13,
                    budgetGB: corrupt ? nil : 14.5, recommendationGB: 14.5, maximumGB: overRange ? 37 : 49.5,
                    detail: corrupt ? "Model setup needs repair."
                        : mode == "failed-activation" ? "The previous configuration is loaded." : "Responding on your Mac.", idleMinutes: 10,
                    physicalGB: 64 * 1.073741824, ceilingGB: custom ? 48 : 33, appliedCeilingGB: 33,
                    failure: failedPending ? "The retained model setup record is unreadable."
                        : mode == "failed-settings" ? "Choose a supported memory limit." : nil,
                    activationFailure: activationFailed ? "Your requested settings are preserved." : nil,
                    activationRecoveryAvailable: corrupt,
                    selectionReason: "Uses the original pack while alternative quantizations are being qualified.",
                    minimumGB: belowRange ? 12 : PerformancePolicy.minimumGB,
                    memoryRangeAvailable: rangeAvailable)
                window.appearance = appearance == "system" ? nil : NSAppearance(named: appearance == "dark" ? .darkAqua : .aqua)
                let host = NSHostingView(rootView: Form { PerformanceSettings(model: model, performance: model.performanceState) }
                    .formStyle(.grouped).frame(width: 620, height: 1050))
                window.contentView = host
                window.orderFront(nil)
                guard !NSScreen.screens.contains(where: { $0.frame.intersects(window.frame) }) else {
                    throw NSError(domain: "MemoryUI", code: 1, userInfo: [NSLocalizedDescriptionKey: "check must remain offscreen"])
                }
                for _ in 0..<30 { host.layoutSubtreeIfNeeded(); try await Task.sleep(nanoseconds: 20_000_000) }
                let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: 1240, pixelsHigh: 2100,
                    bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false,
                    colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
                rep.size = host.bounds.size
                host.cacheDisplay(in: host.bounds, to: rep)
                let name = "\(appearance)-\(mode)"
                try rep.representation(using: .png, properties: [:])!.write(to: out.appendingPathComponent(name + ".png"))
                let request = VNRecognizeTextRequest(); request.recognitionLevel = .accurate
                try VNImageRequestHandler(cgImage: rep.cgImage!, options: [:]).perform([request])
                let text = (request.results ?? []).compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
                let labels = ["Quantization", "While running", "Memory budget", "Keep model ready"]
                    + (corrupt ? [] : ["Budget available now", "14.5 GB"])
                    + (custom ? ["Custom limit", belowRange ? "10" : "48", "Your limit stays saved"]
                        + (rangeAvailable ? [overRange ? "37 GB" : "49.5 GB"] : []) : ["Automatic", "Recommended now"])
                    + (mode == "failed-settings" || activationFailed ? ["Settings could not be applied", "Queued work waits", "Retry settings"] : custom ? ["Applies after"] : [])
                    + (corrupt ? ["Repair model setup"] : [])
                    + (overRange || belowRange ? ["Choose between"] : [])
                    + (belowRange ? ["12 GB"] : [])
                    + (rangeAvailable ? [] : ["A supported memory range is unavailable"])
                    + (mode == "fixed" ? ["Fixed cache capacity", "Memory pressure can still stop"] : ["Automatic adjustment"])
                    + (mode == "unavailable-pack" ? ["Unavailable saved pack"] : [])
                for label in labels where !text.localizedCaseInsensitiveContains(label) {
                    throw NSError(domain: "MemoryUI", code: 2, userInfo: [NSLocalizedDescriptionKey: "\(name) missing rendered label: \(label)\n\(text)"])
                }
                if corrupt && model.performanceState.snapshot?.canRepairActivation != true {
                    throw NSError(domain: "MemoryUI", code: 5, userInfo: [NSLocalizedDescriptionKey: "\(name) must offer enabled repair after the settings failure"])
                }
                if !rangeAvailable && text.localizedCaseInsensitiveContains("Supported on this Mac: up to") {
                    throw NSError(domain: "MemoryUI", code: 4, userInfo: [NSLocalizedDescriptionKey: "unavailable range must not display a supported maximum"])
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
            let name = "\(appearance)-response-budget"
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
