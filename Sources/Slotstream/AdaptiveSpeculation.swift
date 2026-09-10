// Request-local experimentation: useful single-token target steps establish a
// baseline, then completed speculative rounds justify their cost per output.
// Wall-clock choices are observable and experimental; they are not promised
// to choose the same batching schedule across repetitions of a seeded request.
import Foundation

package struct AdaptiveSpeculationPolicy {
    package enum Action: Equatable { case calibrate, draft(Int), plain }
    private var depth: Int
    private var plainCosts: [Double] = []
    private var draftCosts: [Double] = []
    private var stopped = false
    private var baselineContext = 0
    private var roundsSinceCalibration = 0

    package init(maximumDepth: Int) { depth = min(16, max(1, maximumDepth)) }

    package mutating func action(contextTokens: Int) -> Action {
        guard !stopped, contextTokens >= baselineContext else { stopped = true; return .plain }
        if plainCosts.count == 3 && (roundsSinceCalibration >= 16
            || contextTokens >= baselineContext && contextTokens - baselineContext >= 256) {
            plainCosts.removeAll(keepingCapacity: true)
            draftCosts.removeAll(keepingCapacity: true)
            roundsSinceCalibration = 0
        }
        return plainCosts.count < 3 ? .calibrate : .draft(depth)
    }

    /// Only main verify plus sampling is the plain baseline. Keeping the head
    /// aligned during calibration costs extra, but disabled drafting does not
    /// maintain it, so that cost must not inflate the plain alternative.
    package mutating func observePlain(seconds: Double, contextTokens: Int) {
        guard seconds.isFinite, seconds > 0, contextTokens >= 0 else { stopped = true; return }
        if plainCosts.count == 3 { plainCosts.removeFirst() }
        plainCosts.append(seconds)
        baselineContext = contextTokens
    }

    package mutating func observeDraft(seconds: Double, emitted: Int, drafted: Int, accepted count: Int) {
        guard seconds.isFinite, seconds > 0, emitted > 0, drafted > 0, drafted <= 16,
            count >= 0, count <= drafted, emitted <= drafted + 1, plainCosts.count == 3
        else { stopped = true; return }
        roundsSinceCalibration += 1
        draftCosts.append(seconds / Double(emitted))
        if draftCosts.count > 3 { draftCosts.removeFirst() }
        guard draftCosts.count == 3 else { return }
        let reference = plainCosts.sorted()[1], candidate = draftCosts.sorted()[1]
        // Acceptance affects the denominator through actual emitted target
        // tokens. Acceptance alone must not overrule a measured faster path.
        if candidate > reference * 1.05 {
            if depth == 1 { stopped = true }
            else {
                depth = max(1, depth / 2)
                draftCosts.removeAll(keepingCapacity: true)
            }
        }
    }
}
