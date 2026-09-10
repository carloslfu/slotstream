import Foundation

/// Weak registrations do not keep snapshots or their tensors alive. A snapshot
/// keeps only its own ticket; truncating a branch permanently invalidates later
/// tickets even if new tokens subsequently reach the same numeric offset.
final class StateCheckpointLifetime {
    let owner: UUID
    let tokens: Int
    let mtpOffset: Int
    var valid = true
    init(owner: UUID, tokens: Int, mtpOffset: Int) {
        self.owner = owner; self.tokens = tokens; self.mtpOffset = mtpOffset
    }
}

struct WeakStateCheckpointLifetime {
    weak var value: StateCheckpointLifetime?
    init(_ value: StateCheckpointLifetime) { self.value = value }
}

extension Qwen4ExpModel.State {
    func validateCheckpoint(_ c: StateCheckpoint) throws {
        guard c.lifetime.owner == checkpointIdentity, c.lifetime.valid,
              c.committedBoundaryValid, c.mtpBoundaryValid, c.tokenCount >= 0, c.tokenCount <= tokenCount,
              Set(c.kvOffsets.keys) == Set(kv.keys),
              Set(c.indexerOffsets.keys) == Set(indexer.keys),
              c.kvOffsets.allSatisfy({ layer, offset in
                  offset == c.tokenCount && offset <= kv[layer]!.offset
              }),
              c.indexerOffsets.allSatisfy({ layer, offset in
                  offset == c.tokenCount && offset <= indexer[layer]!.offset
              }),
              c.mtpOffset >= 0, c.mtpOffset <= (mtp?.offset ?? 0),
              c.mtpOffset <= (mtp?.kv.offset ?? 0),
              c.mtpOffset <= (mtp?.indexer.offset ?? 0) else {
            throw ModelError("checkpoint is foreign, incomplete or belongs to a discarded future branch")
        }
    }

    func validateRollback(keeping n: Int, ids: [Int], checkpoint c: StateCheckpoint,
                          ngramWindow: Int) throws {
        try validateCheckpoint(c)
        guard n >= 1, n <= ids.count, ngramWindow >= 0, ngramWindow == c.ngramCtx.count,
              committedBoundaryValid, recordingEnabled, recordedTokenIds == ids,
              recordingBaseTokenCount == c.tokenCount,
              ids.count <= Int.max - c.tokenCount, tokenCount == c.tokenCount + ids.count,
              kv.values.allSatisfy({ $0.offset == tokenCount }),
              indexer.values.allSatisfy({ $0.offset == tokenCount }),
              linear.values.allSatisfy({ cache in
                  n == ids.count ||
                      ((cache.ssmState == nil || cache.ssmStates.count == ids.count)
                       && (cache.convState == nil || cache.convStates.count == ids.count)
                       && (cache.pleConvState == nil || cache.pleConvStates.count == ids.count))
              }) else {
            throw ModelError("rollback requires the exact completed recording pass and a valid kept prefix")
        }
    }

    func invalidateCheckpoints(after tokens: Int, mtpOffset: Int?) {
        checkpointLifetimes.removeAll { entry in
            guard let value = entry.value else { return true }
            if value.tokens > tokens || (mtpOffset.map { value.mtpOffset > $0 } ?? false) {
                value.valid = false
            }
            return !value.valid
        }
    }

    package var liveCheckpointTicketCount: Int {
        checkpointLifetimes.reduce(0) { $0 + ($1.value == nil ? 0 : 1) }
    }
}
