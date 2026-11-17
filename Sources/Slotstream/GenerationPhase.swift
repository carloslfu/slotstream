import Foundation

/// Private ownership transfer inside one engine-held generation session.
/// This is never a conversation cache entry: generated rows may continue a
/// phase of this turn, but cannot masquerade as a cold-prefilled next turn.
package final class GenerationPhaseState {
    /// `aliased`: the state's sequence buffers still share storage with a
    /// checkpoint the cache retains, so the next phase's first write copies them.
    package var held: (state: Qwen4ExpModel.State, tokens: [Int], key: PromptCheckpointKey, aliased: Bool)?
    package init() {}
}
