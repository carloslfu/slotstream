import Foundation

/// Diagnostic attribution on the serialized model thread. Every boundary
/// forces evaluation, changing overlap and allocation lifetimes. These times
/// describe a serialized profile, never an untraced critical-path breakdown.
/// No production environment variable enables this probe.
package final class GDNPhaseProfile {
    package struct Sample {
        package let layer: Int
        package let tokens: Int
        package let inputWait: Double
        package let preparation: Double
        package let recurrence: Double
        package let finish: Double
    }

    package private(set) var samples: [Sample] = []
    func append(layer: Int, tokens: Int, input: Double, preparation: Double,
                recurrence: Double, finish: Double) {
        samples.append(Sample(layer: layer, tokens: tokens, inputWait: input,
                              preparation: preparation, recurrence: recurrence, finish: finish))
    }
    package init() {}
}
