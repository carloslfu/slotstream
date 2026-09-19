import Foundation
import Slotstream

extension Diagnostics {
    /// Deterministic routing checks: no weights, disk timing or sleeps.
    public static func checkpointMirror() -> CheckReport {
        var c = CheckBuilder("checkpoint-mirror")
        var time: UInt64 = 1
        let single = MirrorRouter(replicaCount: 1, now: { time })
        c.equal("single-copy route", single.claim(byteCount: 100), 0)
        time += 10
        single.release(0, byteCount: 100, completed: false)
        c.equal("failed read contributes no delivered bytes", single.servedBytes(), [0])
        c.equal("failed read releases its reservation", single.claim(byteCount: 20), 0)
        time += 10
        single.release(0, byteCount: 20, completed: true)
        c.equal("single-copy successful bytes", single.servedBytes(), [20])

        let router = MirrorRouter(replicaCount: 2, now: { time })
        c.equal("first probe uses primary", router.claim(byteCount: 100), 0)
        time += 100
        router.release(0, byteCount: 100, completed: true)
        c.equal("unmeasured mirror gets a probe", router.claim(byteCount: 100), 1)
        time += 200
        router.release(1, byteCount: 100, completed: true)
        c.equal("idle reads prefer measured fast copy", router.claim(byteCount: 1000), 0)
        c.equal("backlog spills to slower copy", router.claim(byteCount: 100), 1)
        time += 200
        router.release(1, byteCount: 100, completed: true)
        time += 800
        router.release(0, byteCount: 1000, completed: true)
        c.equal("both copies account only their own bytes", router.servedBytes(), [1100, 200])

        // Keep the fast copy busy while the slower copy's measurement expires.
        c.equal("fast copy remains preferred without backlog", router.claim(byteCount: 10), 0)
        time += 1_000_000_001
        c.equal("stale idle copy is reprobed", router.claim(byteCount: 10), 1)
        time += 100
        router.release(1, byteCount: 10, completed: false)
        router.release(0, byteCount: 10, completed: true)
        c.equal("cancelled reprobe is not reported as throughput", router.servedBytes(), [1110, 200])

        // Many callers exercise the production clock-under-lock and accounting.
        let concurrent = MirrorRouter(replicaCount: 3)
        DispatchQueue.concurrentPerform(iterations: 1000) { i in
            let replica = concurrent.claim(byteCount: 16)
            concurrent.release(replica, byteCount: 16, completed: i % 4 != 0)
        }
        c.equal("concurrent success/failure accounting", concurrent.servedBytes().reduce(0, +), 12000)
        c.equal("all configured replicas are reported", concurrent.servedBytes().count, 3)
        return c.report()
    }
}
