import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationRouterProjection() -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-router-projection")
        let h = 2560, experts = 512
        var values = [Float](repeating: 0, count: h * experts)
        for i in values.indices { values[i] = Float((i * 31 + 7) % 257 - 128) / Float(251) }
        let weight = MLXArray(values, [experts, h]).asType(.bfloat16)
        eval(weight)
        let router = RouterProjection(weight)
        c.equal("default holds no promoted copy", router.cachedBytes, 0)
        router.configure(cached: true)
        c.equal("full FP32 copy is charged", router.cachedBytes, h * experts * 4)
        c.equal("one materialized promotion", router.materializations, 1)
        for rows in [1, 2, 8, 16, 32, 256, 257, 1024] {
            var input = [Float](repeating: 0, count: rows * h)
            for i in input.indices { input[i] = Float((i * 43 + 13) % 263 - 131) / Float(239) }
            let x = MLXArray(input, [1, rows, h]).asType(.bfloat16)
            let reference = matmul(x.asType(.float32), weight.transposed())
            let cached = router(x)
            c.expect("rows \(rows): exact logits", (reference .== cached).all().item(Bool.self))
            c.expect("rows \(rows): exact ordered routes", (RouterSelection.indices(reference, k: 10, enabled: false)
                .== RouterSelection.indices(cached, k: 10, enabled: false)).all().item(Bool.self))
            router.configure(cached: true)
            c.equal("rows \(rows): no repeated weight conversion", router.materializations, 1)
        }
        router.configure(cached: false)
        c.equal("disable releases cache", router.cachedBytes, 0)
        router.configure(cached: true)
        c.equal("reenable rebuilds exactly once", router.materializations, 2)
        let alreadyFP32 = RouterProjection(weight.asType(.float32))
        alreadyFP32.configure(cached: true)
        c.equal("native FP32 does not allocate a duplicate", alreadyFP32.cachedBytes, 0)
        return c.report()
    }
}
