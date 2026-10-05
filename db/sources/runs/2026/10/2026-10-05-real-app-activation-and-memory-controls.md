---
type: "run"
created: "2026-10-05T17:44:22.448221+00:00"
updated: "2026-10-05T17:44:22.448221+00:00"
title: "Real app activation and memory controls after correcting loaded forecast accounting"
summary: "Corrected startup evidence comparison; unchanged real activation and memory-control checks pass within their physical ceilings"
tool: "Frozen release sevra-mac-checks and bounded existing-check launcher"
command: "python3 .build/quantization-research/run-practical-checks-v4.py app-activation; python3 .build/quantization-research/run-practical-checks-v4.py app-performance"
binary: "Frozen practical-mac-v2, SHA-256 5eabc8cc5d662a9292bb42d0dcb8164da75ecb473afb301e232b208040e82823"
machines: "[[records/machines/macbook-pro-m5-pro-48gb]]"
captured_at: "2026-10-05"
discarded: false
---

The first actual activation attempt loads and answers correctly but fails the required Engine-observed startup configuration assertion. Its receipt is preserved. The verifier compared the scheduler reserve with the entire lookahead allowance, which also includes router weights owned by the model. The correction adds only the rounded correction bytes to the qualified scheduler staging reserve. It changes neither actual allocations nor arithmetic, and it preserves every acceptance assertion. The frozen app builds differ in this one source file only.

The unchanged real activation check now passes: bounded health before commit, configuration and response identity, injected partial-load failure, sequential rollback under the previous ceiling, preserved requested settings, refusal to run failed-selection work, explicit retry, new-owner recovery, cancellation during durable commit and exact preserved-record repair. Its supervised process peak is 5,816,603,376 bytes.

The unchanged actual app memory-control check also passes: lazy loading, warm follow-up, a queued 10-to-9-GB ceiling change with automatic-to-fixed live management, response-bound generations, sequential unload/reload, refusal of the seven-GB saved choice, idle release and draft preservation. Its supervised process peak is 6,624,908,304 bytes; the in-process metadata loop remains responsive. Each child exits and releases its model before the next preflight. Both checks use the original pack and a thirteen-GB external process ceiling.

These are functional and process-memory checks. Persistent unrelated CPU activity remains in the receipts, so no clean speed or comparative latency qualification follows. The smaller pack is still internal; alternative product activation, eligible repeated performance, redistribution permission and public release remain open.

### Sources/Slotstream/ModelPackLoadedSelection.swift

Original bytes: 4793. SHA-256: `975b61af431e3e77d529abc16701e3ab7476769a6b99cf538c7da3d7cc58531a`.

Normalized bytes: 4793. SHA-256: `975b61af431e3e77d529abc16701e3ab7476769a6b99cf538c7da3d7cc58531a`.

````text
import Foundation
import MLX

/// Produced only by an Engine observing its loaded controls. A caller-created
/// planner proposal cannot substitute for this observation when confirming a
/// speed profile. Complete file authentication and health remain the owner's
/// separate obligations before publication.
public struct LoadedModelPackCandidate: Sendable {
    public let candidate: ModelPackCandidate
    public let hardware: ModelPackHardware
    public let physicalRAMGB: Double
    fileprivate init(candidate: ModelPackCandidate, hardware: ModelPackHardware, physicalRAMGB: Double) {
        self.candidate = candidate; self.hardware = hardware; self.physicalRAMGB = physicalRAMGB
    }
}

extension Engine {
    /// Conservative boundary for measured product evidence. Explicit runtime
    /// experiments remain usable, but cannot inherit the default profile's
    /// measurements. Only names are inspected; secret values are never hashed,
    /// retained or exposed as evidence. These two names select test/build tools
    /// and have no effect on execution inside an already built runtime.
    package static func admitsStartupEvidence(environment: [String: String],
        build: SlotstreamBuild.PerformanceConfiguration = .current) -> Bool {
        guard build == .release else { return false }
        let tooling: Set<String> = ["SLOTSTREAM_TEST_BINARY", "SLOTSTREAM_METALLIB_MACOS"]
        return !environment.keys.contains { name in
            (name.hasPrefix("SLOTSTREAM_") && !tooling.contains(name)) || name.hasPrefix("MLX_")
        }
    }

    /// Observe a loaded runtime under the generation gate. This never opens
    /// weight files or initializes a missing correction. A proposal alone must
    /// not be treated as the actual runtime after headroom, feature or kernel
    /// fallback changed during loading. Call after the bounded startup check.
    public func startupCandidate(pack: ModelPack, liveMemory: LiveMemoryManagement,
                                 observation: ModelPackStartupObservation) throws -> LoadedModelPackCandidate? {
        try withExclusive {
            let machine = Machine.current()
            guard Self.admitsStartupEvidence(environment: ProcessInfo.processInfo.environment),
                  let plan = currentPlan,
                  !plan.simulated, plan.ramGB == machine.ramGB,
                  try startupExecutionIdentity(pack: pack, liveMemory: liveMemory) != nil,
                  observation.hardware == ModelPackHardware.current(modelDirectory: modelDir),
                  Device.defaultDevice() == .gpu,
                  (model.mtpHead != nil) == plan.mtpEnabled else { return nil }
            let expectedOptimizations = pack.startupOptimizations(plan: plan, hardware: observation.hardware)
            guard model.optimizations == expectedOptimizations,
                  expectedOptimizations.fusedPrefillAttention != true || FusedPrefillAttention.available,
                  model.decodeBarrierLayers == (plan.decodeLookahead ? DecodeLookahead.barrierLayers : 1) else { return nil }
            if plan.decodeLookahead {
                guard let scheduler = model.lookahead?.prefetch else { return nil }
                var expected = ExpertPrefetchConfiguration.qualifiedDecode
                if pack.startupDefaults.lookahead == .originalAutomatic,
                   case .automaticCorrected(let bytes) = observation.originalLookahead {
                    let pins = pack.decodeForecastFiles.filter { $0.size == bytes }
                    guard pins.count == 1, scheduler.loadedTapCorrectionIdentity == pins[0].sha256,
                          let path = scheduler.configuration.correctionPath,
                          URL(fileURLWithPath: path).standardizedFileURL.resolvingSymlinksInPath()
                            == modelDir.appendingPathComponent(pins[0].path).standardizedFileURL.resolvingSymlinksInPath() else { return nil }
                    expected.tap = .attentionCorrected; expected.windowLayers = 1
                    expected.correctionPath = path; expected.correctionBytes = bytes
                    // The scheduler owns staging and correction bytes. The
                    // plan also charges the model's separate router cache.
                    expected.reserveBytes += DecodeLookahead.roundedMiB(bytes)
                }
                guard scheduler.configuration == expected else { return nil }
            } else if model.lookahead?.prefetch != nil { return nil }
            guard let candidate = try pack.startupCandidate(plan: plan, liveMemory: liveMemory, observation: observation) else { return nil }
            return LoadedModelPackCandidate(candidate: candidate, hardware: observation.hardware, physicalRAMGB: machine.ramGB)
        }
    }
}

````

### apps/macos/Checks/ModelActivationChecks.swift

Original bytes: 44830. SHA-256: `8904b20febf62ceb4b17fe4fde217ff6c0f358eecce3b3364ad82f8fbf56ba8f`.

Normalized bytes: 44830. SHA-256: `8904b20febf62ceb4b17fe4fde217ff6c0f358eecce3b3364ad82f8fbf56ba8f`.

````zlib-base64
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
Xx/pg9LxCCixFCMxY2W8yAAfPWx3fe9/AFCL7ko=
````

### apps/macos/Checks/PerformanceChecks.swift

Original bytes: 41485. SHA-256: `51adf5f338fb18e9be541c110a0bbd3f9f3f5063a2c4b32459ab9d7862db02d2`.

Normalized bytes: 41485. SHA-256: `51adf5f338fb18e9be541c110a0bbd3f9f3f5063a2c4b32459ab9d7862db02d2`.

````zlib-base64
eNrVPWlz1Eiy3/kVRX/gdb9pi/YxDJjxEGDDLm9h8NqwGy8GByG3qt1a1FKvDhvPBP/95VGnjm61
j919RMzYlkpVWZlZeVVWVrxYZnkp3mRVGoVlnKUPYn5yKi/z8KRKy3ghzbMkK4syl+HiwYNlHl+G
pRSzKp2KS5nHs+tjmc+yfBGmUzn8Ii7DpJL74lWWJWPxRSxkUYQX8OC0zOP0YiTKeZ5dFeIPUebX
Ipf/rOJcDumjsW48Et/tQOG0zHLhjHGcZ+fQ39t0JnMJf4s/Hgj4l2ZpXGQJfBKJRJaiiBcV/3UA
Q1WSGl2GuZiGSVLAw4l9Mg/TC1nsi9+8YaQaoDiD1r+dmea5TGRYSL+PuUwaI82zJDrM0ll8UeWE
ZGgwC5PCgUW9Bcw03s3COOn3Nb19WZZysSx9qHK5COMUevc6egM9V3ltAoUsq+XL6VQuS5y+fUmU
DunF+yySySk2BELTB/vCPhsBURu9/HAgtoGcpiPECbQuAabC5xb8vA1j1MTtAhHT3UUb2lq7+FV+
K51uprAUSmSrEntZizhq7napieGsgXZuGomwuIYP9EKgLvCfzwyGk9xXPqURt6ZJhAMA5C0spcDE
f1fzOJEtaKbl+EKEV2Fcio9h8TUoEimXwzRMs0JCnxEsjx+/TCYT/G/k9BjP1iHrFzFxZon/1nyw
5c4L/xGqWDS9zvMsDwCbVSGj4eBt+g85xUWencPilyAvPFQRoaHPwcj050HeZJY/+gzWMYbTtxIp
QbhcyjRi+TZ63rneHT6q0iQLoyEzoRI09UWkXlAjJXhcQlObssrT4TwuQHpeg2Q7nIflexavZ2NR
wmJBefcRfh7JGdACZwIvpsisSUIT2xeHzl9jcV7NgMX2xUfo+RX9XmPlrV/E6/QiTiW2cBmbJK7H
rYoPEXbWBO7AwXQup1+HgC98cwOe7O7wC6CK56FJMziRYXTtMEguEXXOTIYlSIp9oRqOeTqAvLOR
ot13XyvKS5mWFTS6BlGwzGUUT+HdvhhqdAGeWFq1CAIQGABknIpJEPy8DfNy8AgMy8gwnSo2IYD9
6a/G2vbEoM3hv27OP/zz68O/iDcv3757fbQvkngmp9dTIGAUR6B4SxT7ZYKr7PsDQsHSSr5DRH0x
zLMMcPjp5N1YROeLiH5tRQACv/S0/QxY5VWcRigvuLORablA7fM3NEMQH0Bqbzj8v23LKKEvXk5L
JFhbew0f/n9ktOMyCVNSiWOhkGL1I1AsDxdIs9+eBtBg+8lY7OyNxe7OWOw9HYsn8PszeLa98/TM
oSZ+F16C7AjPAZP49QS/3h0L+GYb+4Ffd/DJj2Px0+QM1gxoEOeTnw9oXF+0oumzCKdz4F2A8D3/
FhhjaAhf/OnVPn44tl3hE/PHyOsPoVwa5UVgtqu14WgsAhQkw/MqupCAzWBagfSBcfgnDrI9GY29
7lv+re1kZ9JnqN3dOxhq72mfoZ5MRmc1MpBGzloeahohQ5GWv/bMhCyJp9cBvhxarI8FCmNF1VFr
l9hP0xrHfiztxaNHgp9kVQ60PDgQQViV2VgMeC4iLoRMwqKMweBLI8eEZvYvyvDaPhxsDIn8tiT9
eSzDr396hfzLz8swB9TCkxcvBMjxH0D2gWTaBrhmVZIIkKTZVKnaGMwebr7R8K3jwPh2MW2JY2iS
ol7gZ3ESl9enSTgFUJ1V44GXZiKMLsHtgEFnSQZLJYOxp9liEXfBBzLcEjZgpiJKKBL8seEMnM40
Q7oQql4r0HW5OEdvzzNT3H9M4x/qthepB9B55XTewc7tAD+UpEKQdEn8u4yOZDHN4yWr4ywtwQAs
fMUygLXW/VE7OrUwbgf7Qftf312d18mubLjCmtFj/ILSf1BcgTYFOThNqghMM3aM4C0uGN2SPlcM
gIsd9MriepU4RjXhSeO9if06jICdoPEJmpRKZpDXdQzMeSIvwMbLr4NzMAgT7HwhF8CP1HgIE9pX
8mtRgrOm1juwLNl3QTabWSG5CL+BLYzGzsfsq0yL/RbJNHUbjFgw0exGK7DZ7GYBIC0q5FVgfW9+
zqtHjwxoLT2E37jZ0ILQ0pluZWc5SEGUXJKfUOZZIsAGXGZxCnIlAsDhxSyHBVPOoUWVw8ICUQ1o
JvKqyQNRYNXmDn0VzKvl+Vo10oEHR42ZqY4FkPOlZph9tv5XkUD11iKCO0YFTo/iAgC/Bn7W86O2
BSMnWyzJ38IQjiyUV4TocfACqPxdpsimx2vV3Wa2A9Jkf8UqGN8CVz7UVuYCd22TQKg14AX3Lgbc
6FYOu4XG1FQSFjHIPTBnXcXlPKvQhk6ANOgZhhcgHB00ZlepjE4BjrJarl//BTdE0IaMvfcEIOOw
sWTNAP9z+uFX1Tv+egp4QSHMDlQUluEQIcVXH87RD9734Ar+UWQp2oAZSWv0j8DOyIEv/iKvi7M6
T2w+WA3pfYZrJ68z2QMHGodkoHW+ltkSBEIiL0BMM80Mx5PpVma0DBxC/leBCIH1MI2XOuDQVx56
YhXhWk9fcNvDKimL2rcrhWYxBxSBR7VY3myo5vd9hzucV+nXm49GnzsUQrpMwU/Ms6ialih54GOU
4fAE2YVok+UxuPBhQpQDHzLyaUPMCMZuH7E0WiFPMFC3UpzAGAF88jrF9mSF06MInPFIvsuyr+Fc
htHY8p2kloX4ZwVrYhajcQFqexGiXf7+4zHpokR/h25hivO9Rut4sBYSV5xpkxeMFrC0DyXYvOkF
aV4GsSHZOj5wxZ0H6XSOo7HGIGDB6IsjSX9b9VJmJVKJe3OoM81AAU91CP+WJAK/3ke4soYI2EM9
0vD8usSdgD0bIFmFUQNhYOhxIguZX8pX2A+YjITH9peAZft9gXss4mduT38YnHrtXPJ59AT+CUUx
j8HSj9Brl1PkbfUhah9w7pgcHhWKcCEFa10H88UCnK470Nc3XzUPCQRn3fD8CC7lNeWSnAhY5xEs
c+iFCOyzUHheoAl3S/5ZazI85HFq4KZ6eFZSwONRHs5KXgmpvESXDFydr0QYF/3n8cUqb+HJnvhv
sR1Mftr9aW/7KYaaPN/hyY6zhNj/O+jYi1gT+zDdJMg3+Wo06h4QizCBVeji7jxe3nuKfK5eNOQO
+kfal50CXuW3qfTEYsRKY9BjVF5pv/TiBpwHfwDjKyQoMBKEDljxuhAALBjEQC1PtcQ56ZauaFlg
7L1XRIOhQwLyOziINRbGh9lf6wYhuCsVAMJk4wSAWBxgwKAe8ry+gntbeP5PQzpQ+7+DfXYIijVL
ZUq7jreaKBqmxveAP3e8ee/urp2VD443R+zMn2MuC3SDeJoMHnrtYJU8nuo+OKDjysTwUkZ9Z71a
LhrR3g83ezfHTQvQPm4mLFexmdomPZdJdiVCtYUVqcAWxv4KChxgtAwtkCpVLdxAB21FkMLmUZoT
NGvWmyPGuZ1J7T0LftwQS509tCNGQ+phg8QMv0E/DGx8xTDLnBV3IcDyycHSxygpiwA3DJBd3mDq
2z7g2zubskf79x1xAASxOWd4rCasdKzEPQ0MN0UZTBq3eDCyeZXHmJGh2KU+fWKcN8QtN1kXP/V1
mWx3AZClBOE71H7k6xRNvByEjqTfhhamEYWH7N+uzdrK/6m8UrzP29WW+3FPxBpWrrUBBD4hq4T4
wA52Q15w13ZT9gO4cYSbgO6wNw7JTbUx72vApvWB21uevbH9I+F2hSN48753R9B2cF4V10K5h5Yj
AbnApijCrR3gOxH/orn/fNA7UNnWJU2xMQW114EKqqQdCrDdo6sQLA1amIP7WC28GHml6AXKZo8y
d4oqv4xRDGJXQA4FBS4IitnzBuE7+nUILkZaov+a74uBTL98OsUIf+vL4svhh66Xkfxy9Howqm+d
8mLF4Z4Fz57h7mqwu/fjGNaM2vugPRD6bVuicjjKKkBjcJFLDOmUb5DS8n14AT+qSJ617KMWcwzo
gCFuzdGP8lsZpNXiHNCmktZ44vvqp79N0U6een/LMC9AVeNoje6QFDxQY3tj4IhhoAhu7myVebwE
6ziclgl4MbxLgcxEXYCrVJXK8wNvEPwL0GQuN/nbJIjlOCUpQ3geDGjLq0TZSBigv8MUf8TpDH9s
beP/J4M6NjfBgxqyFRNpnLTgQQOpMAEOAkIJLCTdveuiMclVO0AdNGde05Ct4GUCd/Bs/OzZwHXk
26c8ENhQDPr3THBYDYZiQkYxCwpeqvMszXIWIOAXx6DUwdKF4cLSs2qXGBMr5I00NgIxcnINeeOT
4zU3FUEKHuXGOH06RksHFjtI1tbHaPRwpW3ozOTAoIi2Am1fC9wSlYWXPmbAd2iTLSVZk7yDRF/z
n9aCFrM8nKoQAVNP8TC/JyJiVpifeOZQUcVD16L9CCPrgz8+D5iqnwf7n63m+TwYfx5oDMErMEY+
gzUcggCRRVFv+30QVOXs6Up/k8EK/lmFwMW/q2zMAyfuRj4/N0pArzAF/SYuJpPIXc8Ct0lAMkUS
E7nQZWvEA9xNWPltCQo5Lm/otFk43OlAY3QbhyvC2nEEis3ODr6Yxd9kdB/6W0+RZYT+y7V0k8RD
mNoELbRir+l1iiAxi75SmQqm1zswaVviqe5gDb4xQ3svMDzqfVbjJMK2gwMVPVQZmpil47s3Xudo
/XMyvAijfwA7LGBansOrnb4OnmpjloH6agv/Gozc3ojA0cmaXtdzghphtNoFro12oKfDwcsqtekx
ZvHQliUHA8j8GPTxUE6xZX08/tBLklrj59Q6aLg6m+QwasLxfOIEyJpci5nE8DJR5YGX+HKnSS4D
F7MEgAoD271ik6XDbDFF9uSkYbIMzOEHJ0usMJOqpzza7wObpa48ndEaPai+czIyP8K6X0hMFw/i
4h1oJWYdipFjlHaeZQWC+hLEgR66EDV+UsIDVpje/kb95sfuaeGuTxwwYq5X/J4TasIl5oDcUVLC
bVIN9BRVVJoSWCxw6ilux5mGjdi494H31t0wReFuJRhIvyyeOtEdZWhoH9uSB0MdPXxqpcR7Ber2
6grBi0fha9L0VUq5VEqTA/AZnnnoDEqTNHp3CzuIgbh7I8gB7C7wQxFbxI8RyWpDwtsV86KyPfKB
GwlouxPr2rtOoPKiwe2jxFg6OgB8v4UON3jamLk8mbjuHwp4Sru/zTJTEIz8TNjnvaW9noFClU7a
849s3Iekrw2swDPjfn/QyATfV4GKF4RudHhFC7ZvhuHOuFaD/DYbfAMsVykuFJLvbhLtvxDdXRDg
ER2QHUnWRH7vlEUvjqdZkJIiNo75NVcbxQAL4BSZ1wJ9Vkajbid1KTJwCIFllsuiLgBv6twII+Kg
BW4B0mGX+/BRCEx2UOhXmLfr01EYS2AYy4ktnoeRXQ0ku0fqZ02Gz6oSbBsrl89EWIDMgpYvzmp2
5sYzAiAIarOUBgiWBzsbO7iN8lLriMGottCnWVHa0x7P8HzHBP73BP/nLHFc8y7ISGFwMcO6cmOG
i6NEHuFbtAcpyAML5VSf9sEhx5QkJXPc5znGwLlnnazInAfAgiDYfjqZjOzKI0hIvkV4Cojgouxy
71hAx9JuTRSrEjDr+VQb9mlg5763ULN0T80zgg19cNMO/Fpth3VigBP5l7jLg9wjaE7qiN3a2Ww+
mXudiAJbhMgtYYQBiHshyA8bEEQt8w1mgQKIJNJ13Zy5I0JMbg4855J1w65bUkQhj/GMgJ3Ov50W
m/LUmDa8j3H7G09HU9YWsRk5a+QdYGIBOXwg1DDv7IJFuM0joRN3Pef/nzN9pnPr7Je08QicgbMu
yjhJ7FFd8ChJfjiYoPn/u/i3ZcarOLhrxk2mdiZobAdP2S3zOC2Hg+OXp6dgL3E8jjPgP/P5mpE9
PPMYnimjcgSIncnkWtvKz7XtrNzQYuwFEhQnwtOlzIu4KPnAnNozzTnGh6F3xN9jM48loRjgdTZC
svPGNgg8GjrhORUJZEvbrZQxnGcL+enkHR8hVUeLEbWhk3kzHDhRlC38Am1We9oU9+sU4fYZnEYg
h0cLUCgdYSrhEExzQMBbML4H1OFYqMPK9Nrbr+VDfyrsqSilvYZa99X5Il7R90ut6wUd/cBw1Rjr
byDcNMet7UEddHsoGmx+fYoZphiochz2hPvjx+IjSA2NbDq6XWA+kpt3R0ckCs7zBqdWMPQFuDeB
eElPyizT3XHWKBpf2Hx7IsCTxi1g7guYpQJPJMQxDt9iN6nMx9ydzpDVPU2zMAFPRG/nAC6jbDZj
o9yYfO4CDGx2jLK/O6xMHV83UmJIBRlWREP7x6YCFV0YjsDufki7qOKFOXHo5kF38ZssO7wKHwj+
WYNhdOedPnNC5jLMk+tDFcs/8DmLn67wYdyPg7h4vVii6e3vEKhE3Rh3k/PKDUFhFiEK0YGNZLdM
U9dzeL5BaJokfsThYKn1h1oe9+I3q5G09VgPU7hYNbUnei9whV9MmXvhhbKerXTBa9yShktQiMDD
AQqjgIVT8dvkLOCkatxuXyf0yHLxnykDkzOzB128qom4FlwPRyzWYFATqmtxLdzvvOI4NkPebMPx
DgAWdWhltdstU4cY6yjqVDH5fhs9otU/VwMxU1Sx3ZpO2Rn0Rb9VKejaySt9RlFgG7JcqGAFYlmL
8HXEYPPeLUiioQ0otWY96nowMjR5gaegSj6brw+cRT2WSW3imPEMU67ozBPPnUL7oONmmBXTMX3Q
cC9TFDsAuqrNYTaMdJkbsQCuoXgUnQYlFanH0Pac7ixiHinn4I6WYIsVVGbGU94YydbQjAlvAlsI
jJeBvo6nX4Mey+S5994rEOUvI3x1b6vo2b9jEf0dG1MNEnMQV+OzvoJ2+3F5mzZTeGNm3yTuriom
GYbTXAQ2Fx7hcJTMvSi21kpNqCFm4dQZW7OGjJwyam3U8gpwOcjU1MJEYYTFBX10k9XL0NQqTams
IBhMqNV9leVfccHUl1J/WdleQ+6ghg46JaBgclZyzJFps38OyjSPvaSAW+j1mjjkGVvUuAerTXq+
L/Ra+N2TDbX92Xs0ete7P7t9RMe/VInsupaLPYtpljIgvVpIjxNV5qlAqTO4F8TiToUuX+Gcc8vy
CDrZfPXerfh3gdse3fMAO7de4jWkYckHySdy0bmNKiQ98tGnt2ZYk12by2UCIhRPSTj2hLUj3qbT
DFOrM2UUIFTQWEYoMfDs71eyxrCqXMkmBQfSztGa0D6uMSTYasEDlWiUgPJJs6qoCUdlygSbWNWq
bhu7gP+RRoED5dujVgMBKPCRlv8QHUWK+CnUbxTjMYMYy+IQt0uBIBjpcxQ4zLeY100L9XXnmqet
V8MTbcNubIB7tKtZ4RtION4UdvhVG7NKtyHn48bq+bXFgRKqNgd3U+vUqz267WQmqaX4ipB+woX9
+soyewDvP9XC/X8TWdqADQ3GN2PBLpncygE/gEloc7m8A4rmDD+fh5lTGBN93guZSiUZqZZbhfFx
GfEWhamWqm0pHrW/1dgd06ETQxRdVXUpbS5ZuASNIotuw2BelVF2lSqL2dtAoPK2Oa5DFZwzkdix
tkBIpBWopbTjqVTCWLTFt8Jk7MVjWOlRBEnZkzrL3oal40LtE0xlTucylMVJpXByrL4Apg+evEHJ
gXUrsToBF0W2uySBF+aW4Gr7OZ0q/MbRZzwjIKdf2e6qsPCYa/hycNwGmanN8eqdDMa5bVmL6Jlu
Tm6720G9bG2w52FhqoEiDpwy06Tmkn5jY19babZ1JeOLOZ4GaHVu3ekGjUrX9HaD8K3Z1GLQ9ZEr
8gxlGpJlfJ8uLw/rWF2qyDrWb8yoOgj1SAb7YNTDLXBYpVkknEqiYra4znTj4WmDCGtycPQcuBzP
ylhiN2SAR4NzeRGnRIL3FmtD12zLlqi1P+Cqa+ZEb8Qg0FGYtPDIRRXmqpJ8GeLWqy2+ZSShBSJY
WIZp2X9tOf4xEhIrNv+xceY6yTgQbkxFRreeh7cBuxmXm0neiNXxawWL9QXuNbCjTk453iiC6EFi
18Cd8bnXv8/bdBCZPuFkCC3NSTWs5vcOmXNbiKkAqPH/W+SCWpRlUQfXdeAbQ3X4Uy3zgpW3YhWz
C4LdvET3Tq+whtnqdbkuHPqpkA4l6hE0x21hAaDl1KCXXesgod247UEo43xMbIyeYifKsUYmdiN5
2vf1tEov0jjRLd8HbEN8320Mnxj3EoZqQxayMmFJ7fIDozJePFozi/thgS6j05/ICsuz1rsuBqFq
aDlqnQxImMtUCYMUa4X6wFh2s4knVJ5d5qtTT6jR7S0y7GWtFcbwtDKOA0WP3T2yucnMcJYdgdAr
P0QB0swQQYSoldMJnY2KbD4RHWlWE/mrXaSNiew0+crtmpO05JssP6Ui/I6nT+2Mb+8DZJbVqrVC
n6xbd9rke/RItH2w3fjA5DlQqJ2BxE4K7UMhkztiy01+uAWOf800RqwX10D27uAmtgn3e8/5Eww7
7oiyA9qeQeGh5Cr82mdvqLkKUBTCt8b8wCqKhXAI5xLG78R39W5Br9d6X8DZXm/Qa6/3Kl+nULZ7
KZS2DlcIdqbZ1LvjRHG2QSY95OyPsUNecg7GgsigDzAyIWh9mF0TdSLAk/eqXuvx+nxD1fLWYl/1
s07wu4A5Oyt4fBOXAozPd3gNYaYyRPMBKP0NL0Thq5O2n0wm222c5c9jneIwA1p2SrL0op/OqA/V
20BRgbD11omLJd+Ys5hS1+6oFWp2R6O4QBKFOa3WTCVGYx89Am/9Z6ZuUSsCqnn3IqCa5bjdYxHr
wBqnS2JetmpMYm0D2fXxVywsXScdB5lhMS27P6thc8rlkylVYknMbGZxBZy2WFAMj3FJd8s8ePz4
sTi9TsG6wjzLhSxDrBUN603mWHaj0FGI0DtarC+QwKxNhfQsp74ucjydT89zVbgBfWmM3AU2PJfw
IWd4ARBihBWPi1TnsMQF3ZxEqiIP/FuA1t5h4197Q2ENPAp+sLKquRPVPRCfPr098qIi9ijSjY6B
7a04MuoeXUP1AhM5lVyj8knj7gIQK8WpPvTmHTTiO+DUAbchHmNbhIm+HPAFDDdIswUWbaZaOFcq
NR1vS3ohzBnzyyypFtL7ahZ/w7M7W/wK1O7WLxaPf9YH6mywpfFOB41MT5x1CfiZx0vnMf4JT7Pi
VRUnkfMio3Qbulvg5cn7J3sqz96rVoScTJchspkF06TIlZ4RykL+bSwUak5LujpK/WVxgvCrSrP7
5qEb/OFNcS6AbeZ/YFHvsI09BY8MuLp+/J53Are7qC8Nf26C6C5Xq4LxH+zbIVfzx/+PDYT7DfC7
R7OxOtDmEW0dt8zoUL+j4wf7NPFaZRanhIkD/b77x43jdopR1CZ4aOvJ60P3rUE8LgdMgqNhLDhC
ZWgFw74jJMbCRa1Bzr791TLoKsR7IU3nD2dRq3JIdOUZB0aPCcuMW/wdFyqd4Izx+i+QXebB/Gq/
uSL12+a9LwhA0ZVJbzq1B15QfGjpMdK3rzkUVPjVFZ00ezjTwPt2mF1cPMcRPnew7YFq8Tm/wnY9
sFrQOPapOwn922jt2WU9DXRM+KqOFCyBBcXCFMv5UQldSBsDgQoXKw2Sh3oETcghlzDEnTSsUoXJ
iFmSYB0VHdU6z3JcJWHKR5ctzv6rADMOy5xNV5c0fNhOJKJ0F++v4OgHLi+1cXbjiNhIF8VR1oA+
n6LsAeUd95uLmYN3JgtH+HBqjkrpo0poxWBcT51GWWLha5CA5kgZ5n4Ch+GR4qZiHYDcirOqQLO/
+Raw5z63CpfBqa+8loa1HrRmHihCG33c0gY/XX8o2+AKZcT8yg39w7yd8/7ZkuieXjxWWhaZPKI0
xcLgsE6f7/b6W+e6YGSt5/ZJ0HqV8BpwzTe8Mvyr1PSqiFPAUVxqA7MGnCnEbyqvr9fPOz318zro
eViGXePbFMKy97GpedABV+/KjSabqguLwZ7V5XEVkM/dx4FjSUKT7T3XuqX1cHwDc8UZYFOUuMM2
a+8sm08fPRKN9Y0fj/yCw4qu+iyRg1PjwkgrGtUJCeVHcU69pKOateo8iOUwKTGtT7iXwxXP9WOv
PJrajOwpq1Dpql7MOqSdSDqlxF3CV7D2Fnw+Su07o17BSqo1/l4Dp1/9TZVOI5LH0ehmENeqmJnE
FFNiw6gpr5TglFIf+0HtVKnc3r0ZlKGI4hn1XNbOvtZ0AQo0d4mtAc0koCA2TY2PHoZEE0TbVZhk
qXQcfF2qUnYXq7So7b40wDAzV4E61NdYmG+fe29ctO/trIql6O/by3e6fY50XoNS7YoUNs8KtL78
JqcVsZAEik3delSabTov7MKTaMmldOom2o8J8Bgr3YUFdaHdTMeYU3GKgXstNLYeMvrZ7MVj0WQ3
+VbwWCV+1Z+a3tuc65axyZrWLf9oq4JtqsUFZrnxpIbmb9/v0mb3vsGgB5b51bdO9Jz5pzNr9cvY
yZp6o6bOKFhvT9fQShqDyjJ7RMKgWppc00FllukWXWQVq/uOWBzWRKFf0Lo2oDY/W+BwJqosyNZG
mtjtZh3V2W35ysF6P1uNZ/CwBTPaah5beuhijvouCYMsismaPHOsio03DpA9MU3CeNFwjymJ76CV
6fD2ER0oXWHpaxyqVYDl5nsU78NxLVe/1qoao8lV+jVFjQfGALVaACJgBUVH6goqsJ1fUekErmnt
Voh+qD6QZfFefXWKk/9Il+WQetCBAiV8lSzSY4hSz37QEpu1sUxcwJ67ZG0QzzUlAhnr2rWqLzDA
myraOBytArWvTWFGXS4Ao6lbKuqNUdBA4L6fW6hL15dA415ZFPPsInig5VtyXLtZ/O3sRJ97Gzav
o3cc/XjmJe2G9TvA/Y7Mreq4FBSvcZTpMFvA6NE7LKMHJKkWfKeK2Rvc8jIecaCBDhnpPomzHAaG
blAnt/Zci2/FqAOhOcf23wJWvw2zGThcW2Z3J8aKKOJnbkZbM3r47kjVcVjovGEUU8BcdCcy9Rn4
tUizDKsAfzp5N0QGgp94uwxuOO3TiL/R8GduXO7hG2j4nuzCPFDlHAP8+PU30ITFMCz5c9rDWsKv
MImhrlRoShd4ngFff/wL2lj9w3En2h7lif45W/BuNvQBXVKkP5ckYmj2zH5BQ9zgvlkXBo7zDFZM
8TadZcHS+V2ml3GepUjR3wanr/928vLL0av3R4MznMmvpwjKUYznqzKUWYDBweMAx3l8HqeP8ZfB
HYb5nauFbdrX6sKyjZDfJuVQOjccza9jf7dk1cB3cdyy5RSdM/6LIGkUtU3C380FJA4pLhecpo90
YGqzYxVcLki6gERzTFlVFfANoIREMnxFNeDU8/dqN0tV8+G35mMrqPGuUwy6nUGL385c64/E1/CL
2kdls8xsouo/2Zs/osy1E1XBoh4i9cSoXVo3OqCM/zdA0I+RV9SOsGoR2Fg6xTWI5MWnJY5lPqRg
ggpLKKi9ayu+oB01CYKfdyeTScvNHniufNMxN+E+b4KKy0yuT96e5uNcw93ODvBi2P5y3GsmYovm
3Tqay5TOOOaxvj5l6PM5SFO6ooIutByORuKx2JbP/BFA8bbx3Fg8VBQcGxT5y9Bszg/ephjrGLTc
P3/zwz9t91m01ukfPeh34X0/2aJsTZwWW9kDUjyq1gyeL1EN1BGWWpEZ959dACYo2bzERVFAyWto
a3DdkhBBVY8Y7wH4+rQR24H0FjdJf+rn5+gZkuVjnoKUAC2nP6mK5uycPT1vs+KAvkL7Np4WL/yD
VPA33/NXswk84HtX4WHEmwA/5ZG2RzW6Ub8aXZ2zYLMNk71a50A3wjpfUGwMj4euvF85jvp1BvDF
M9AkR/EFHuNa3anfuN8AfKtNeW2n+WRPs4lBO+73YKYv3e41xw+mob6lkZOsMPjoejAtxHC0psqO
Gvqg2AbNj9WlIXTqnaK7uLOYKRdvwHtdMhqIF+JZMBFoWCl9vZ74PhD+hRXD9jFYGnnVulpdeV3s
3QnEqhRowfEJkzZtUM25ODjUYHQT7m2ExT2sdfGE3weLZTbtTRlcvFrN76xjxmYqmHCXRxxj0XE7
FTt17j3BCgUzcAO0rFW59kqitiChQ4d1ppEazTbgzAFbzKs+VIu8UP76yeuX7758/HTyq/jMLDGC
j0ndH3we9tT3ZFyNBMtY+MyK9zy8+huGa0Yts53NkqqYD4syyqpy9Fy5rSsUjNXCeHgjoMTKYRqm
WaErU25P7IXaLVeN9RfKWpPgBCM8XNc48vRghW2wvm7iia4P9teXXk2w+o0abGtD8yUwExflxtX1
4S+BkwY7zZL1hWuNF9Tjkg1lMlyF+cKUVW2tj1sD85AE7SzPFmIbTw1v71DoBfdDwpSFkAM2dr+l
GLTLYbD7ZityMjeZmhsU2dTUvpVB5hRh7DjIrEpOsgFwG34w8nwd6K7eMkpyF6Wm8waMNnzsPtk+
q7fZOcOArN/GF6K8ybE1S/D4o1UKXL8X5aj9+LnO8JjyJYqNo+bOxG5Pv54EdDUHiBnSGc/UHZBU
/Y3UobkdQ9387G+sOXB7IuTOXYyfau5E/6sVimq5zHKnAE8LQ97bdUXO4HTLgAahfszhTqWcPlGs
C3LYTca2DUaBxEla6rbrLYLTmwQa1nNxml3tO/3/IHafIOc1yyjfPYIaJZgvTCpXqXOX68Wnbzah
nXuAHuhEmQzOLHSNQtBUspjzxg5lyl6Gt5zDTzv6aMLdzEEHBtWxAXNYU90mB6x6ySkQuEtj9rs3
ulngdurrp5qQ9ypdtFzqjQyjJ0NLnG+IujmU3VVamyYWVp6ql24lXxAXetGucdvPIfSzRn9ss0Y5
oEsnYtfHc+t2+vvX7z+c/C84FOHXL0WIQY7oy8U5WNz1QNrIlPfl95uE1XSw7os++PDFOgTtgUHX
ulfg/undh1cA8N/eq8pO8K061hORNjinnVAd2YaxyWHsakXoGo3WskkjzPgz7t1grWVna1AocQwi
QTXr2289WPoznZIz50P4vkJl2qA1oIJrrYaLt13K5z8w+s9HwMjynmVJkl1tVcuxLUuj7QkylsfI
15Tlpoj9mFl5rO4sV1bHuEM0kEOutV3kuSFGw7t4edG5JvRxSdL7jp/kbG4++P7g/wDITOaK
````

### .build/quantization-research/run-practical-checks-v3.py

Original bytes: 4854. SHA-256: `4a7e01c70f4fcb711f24001c675e9e8c8b39b271f1c73e95cf09268703fe5a52`.

Normalized bytes: 4854. SHA-256: `4a7e01c70f4fcb711f24001c675e9e8c8b39b271f1c73e95cf09268703fe5a52`.

````text
"""One-off bounded launch of existing acceptance checks; no timing qualification."""
from pathlib import Path
import hashlib, json, os, subprocess, sys, time

root = Path(__file__).resolve().parent
repo = root.parent.parent
sys.path.insert(0, str(repo / 'Tools'))
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree, vm_snapshot
from quantization_performance_campaign import allocated, contention, physical_bytes

name = sys.argv[1]
out = root / ('practical-' + name + '-v3')
binary = root / 'frozen-practical-v10/slotstream'
app = root / 'frozen-practical-mac-v1/sevra-mac-checks'
baseline = Path.home() / '.slotstream/models/qwen38-flash-next-mlx-4bit'
standalone = root / 'affine-standalone-pack-v1'
cases = {
    'native-safety': ([str(binary), 'affine-engine-check', '--baseline', str(baseline),
        '--control', str(standalone), '--standalone-manifest-sha256',
        '8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5',
        '--table', str(standalone / 'angles-f32le.bin'), '--generation-profile',
        str(repo / 'bench/quantization/greedy-v1.json'), '--output', str(out / 'native'),
        '--draft', '--streamed-draft', '--decode-lookahead', '--native-arithmetic'], 13, 10, 1800),
    'draft-stream': ([str(binary), 'draft-stream-check', '--model', str(baseline)], 15, 12, 900),
    'app-activation': ([str(app), '--activation-real', '--home', str(out / 'home')], 16, 13, 900),
    'app-performance': ([str(app), '--performance-real', '--home', str(out / 'home')], 16, 13, 900),
}
command, preflight_gb, cap_gb, deadline = cases[name]
assert not out.exists()
out.mkdir()
def sha(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()
receipt = {'kind': 'existing-practical-acceptance-v1', 'case': name, 'command': command,
    'complete': False, 'timing_qualification': False, 'driver_sha256': sha(__file__),
    'binary_sha256': sha(command[0]), 'metallib_sha256': sha(Path(command[0]).parent / 'mlx.metallib'),
    'required_preflight_bytes': int(preflight_gb * 1e9), 'maximum_process_bytes': int(cap_gb * 1e9),
    'maximum_seconds': deadline, 'minimum_live_headroom_bytes': 3_000_000_000,
    'maximum_staging_bytes': 430_000_000_000, 'samples': 0, 'peak_process_bytes': 0}
def save():
    pending = out / 'receipt.pending'
    pending.write_text(json.dumps(receipt, indent=2) + '\n')
    pending.replace(out / 'receipt.json')
save()
child = None
start = time.monotonic()
try:
    receipt['before'] = quiet_preflight(preflight_gb)
    receipt['contention_before'] = contention({os.getpid()})
    receipt['staging_before'] = allocated(root)
    assert receipt['staging_before'] <= receipt['maximum_staging_bytes']
    environment = {k: v for k, v in os.environ.items()
        if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VQ_', 'VQLAB_', 'MLX_'))}
    save()
    with (out / 'stdout.txt').open('xb') as stdout, (out / 'stderr.txt').open('xb') as stderr:
        child = subprocess.Popen(command, cwd=repo, env=environment,
            stdout=stdout, stderr=stderr, start_new_session=True)
        receipt['pid'] = child.pid
        while child.poll() is None:
            if time.monotonic() - start > deadline: raise TimeoutError('check wall deadline')
            try: observed = physical_bytes(child.pid)
            except RuntimeError:
                if child.poll() is not None: break
                raise
            receipt['samples'] += 1
            receipt['peak_process_bytes'] = max(receipt['peak_process_bytes'], observed)
            if observed > receipt['maximum_process_bytes']: raise MemoryError('physical process ceiling')
            if vm_snapshot()['reclaimable_bytes'] < 3_000_000_000: raise MemoryError('live headroom')
            if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True).strip() != '1':
                raise MemoryError('OS memory pressure')
            if receipt['samples'] % 20 == 0: save()
            time.sleep(.25)
        receipt['exit_code'] = child.wait()
        if receipt['exit_code'] != 0: raise RuntimeError('check returned a failing status')
    receipt['complete'] = True
except BaseException as error:
    receipt['failure'] = type(error).__name__ + ': ' + str(error)
    raise
finally:
    if child is not None and child.poll() is None: terminate_child_tree(child)
    receipt['after'] = vm_snapshot()
    receipt['seconds'] = time.monotonic() - start
    receipt['staging_after'] = allocated(root)
    if receipt['staging_after'] > receipt['maximum_staging_bytes']:
        receipt['complete'] = False; receipt['failure'] = 'staging limit exceeded'
    receipt['contention_after'] = contention({os.getpid()})
    save()
    print(json.dumps({k: receipt.get(k) for k in ['case', 'complete', 'exit_code', 'peak_process_bytes', 'seconds', 'failure']}))

````

### .build/quantization-research/run-practical-checks-v4.py

Original bytes: 4854. SHA-256: `4a609a928ab5dd948f779401222d0f97e9bba1126a460865dc53b8335e2179ba`.

Normalized bytes: 4854. SHA-256: `4a609a928ab5dd948f779401222d0f97e9bba1126a460865dc53b8335e2179ba`.

````text
"""One-off bounded launch of existing acceptance checks; no timing qualification."""
from pathlib import Path
import hashlib, json, os, subprocess, sys, time

root = Path(__file__).resolve().parent
repo = root.parent.parent
sys.path.insert(0, str(repo / 'Tools'))
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree, vm_snapshot
from quantization_performance_campaign import allocated, contention, physical_bytes

name = sys.argv[1]
out = root / ('practical-' + name + '-v4')
binary = root / 'frozen-practical-v10/slotstream'
app = root / 'frozen-practical-mac-v2/sevra-mac-checks'
baseline = Path.home() / '.slotstream/models/qwen38-flash-next-mlx-4bit'
standalone = root / 'affine-standalone-pack-v1'
cases = {
    'native-safety': ([str(binary), 'affine-engine-check', '--baseline', str(baseline),
        '--control', str(standalone), '--standalone-manifest-sha256',
        '8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5',
        '--table', str(standalone / 'angles-f32le.bin'), '--generation-profile',
        str(repo / 'bench/quantization/greedy-v1.json'), '--output', str(out / 'native'),
        '--draft', '--streamed-draft', '--decode-lookahead', '--native-arithmetic'], 13, 10, 1800),
    'draft-stream': ([str(binary), 'draft-stream-check', '--model', str(baseline)], 15, 12, 900),
    'app-activation': ([str(app), '--activation-real', '--home', str(out / 'home')], 16, 13, 900),
    'app-performance': ([str(app), '--performance-real', '--home', str(out / 'home')], 16, 13, 900),
}
command, preflight_gb, cap_gb, deadline = cases[name]
assert not out.exists()
out.mkdir()
def sha(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()
receipt = {'kind': 'existing-practical-acceptance-v1', 'case': name, 'command': command,
    'complete': False, 'timing_qualification': False, 'driver_sha256': sha(__file__),
    'binary_sha256': sha(command[0]), 'metallib_sha256': sha(Path(command[0]).parent / 'mlx.metallib'),
    'required_preflight_bytes': int(preflight_gb * 1e9), 'maximum_process_bytes': int(cap_gb * 1e9),
    'maximum_seconds': deadline, 'minimum_live_headroom_bytes': 3_000_000_000,
    'maximum_staging_bytes': 430_000_000_000, 'samples': 0, 'peak_process_bytes': 0}
def save():
    pending = out / 'receipt.pending'
    pending.write_text(json.dumps(receipt, indent=2) + '\n')
    pending.replace(out / 'receipt.json')
save()
child = None
start = time.monotonic()
try:
    receipt['before'] = quiet_preflight(preflight_gb)
    receipt['contention_before'] = contention({os.getpid()})
    receipt['staging_before'] = allocated(root)
    assert receipt['staging_before'] <= receipt['maximum_staging_bytes']
    environment = {k: v for k, v in os.environ.items()
        if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VQ_', 'VQLAB_', 'MLX_'))}
    save()
    with (out / 'stdout.txt').open('xb') as stdout, (out / 'stderr.txt').open('xb') as stderr:
        child = subprocess.Popen(command, cwd=repo, env=environment,
            stdout=stdout, stderr=stderr, start_new_session=True)
        receipt['pid'] = child.pid
        while child.poll() is None:
            if time.monotonic() - start > deadline: raise TimeoutError('check wall deadline')
            try: observed = physical_bytes(child.pid)
            except RuntimeError:
                if child.poll() is not None: break
                raise
            receipt['samples'] += 1
            receipt['peak_process_bytes'] = max(receipt['peak_process_bytes'], observed)
            if observed > receipt['maximum_process_bytes']: raise MemoryError('physical process ceiling')
            if vm_snapshot()['reclaimable_bytes'] < 3_000_000_000: raise MemoryError('live headroom')
            if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True).strip() != '1':
                raise MemoryError('OS memory pressure')
            if receipt['samples'] % 20 == 0: save()
            time.sleep(.25)
        receipt['exit_code'] = child.wait()
        if receipt['exit_code'] != 0: raise RuntimeError('check returned a failing status')
    receipt['complete'] = True
except BaseException as error:
    receipt['failure'] = type(error).__name__ + ': ' + str(error)
    raise
finally:
    if child is not None and child.poll() is None: terminate_child_tree(child)
    receipt['after'] = vm_snapshot()
    receipt['seconds'] = time.monotonic() - start
    receipt['staging_after'] = allocated(root)
    if receipt['staging_after'] > receipt['maximum_staging_bytes']:
        receipt['complete'] = False; receipt['failure'] = 'staging limit exceeded'
    receipt['contention_after'] = contention({os.getpid()})
    save()
    print(json.dumps({k: receipt.get(k) for k in ['case', 'complete', 'exit_code', 'peak_process_bytes', 'seconds', 'failure']}))

````

### .build/quantization-research/practical-app-v2-source-delta.json

Original bytes: 265. SHA-256: `0073240e0e5d21ba5dfe0cd5a9ad532ff3e53e1047223b0216b7d6d74c17555a`.

Normalized bytes: 265. SHA-256: `0073240e0e5d21ba5dfe0cd5a9ad532ff3e53e1047223b0216b7d6d74c17555a`.

````text
{
  "changed_source_files": [
    "Sources/Slotstream/ModelPackLoadedSelection.swift"
  ],
  "before_binary": "5b6c4b74863d326f81060d72cc27b1184ff935182e834a2b2df141b2898ab17b",
  "after_binary": "5eabc8cc5d662a9292bb42d0dcb8164da75ecb473afb301e232b208040e82823"
}

````

### .build/quantization-research/practical-app-build-v2-preflight.json

Original bytes: 1994. SHA-256: `be1d9da681a12e38ddeffa6c0a8442cf7e451eec70eb68e176cf1039fc4ea2bd`.

Normalized bytes: 1994. SHA-256: `be1d9da681a12e38ddeffa6c0a8442cf7e451eec70eb68e176cf1039fc4ea2bd`.

````text
{
  "page_bytes": 16384,
  "reclaimable_bytes": 34367275008,
  "swapins": 34112,
  "swapouts": 156707,
  "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   356387.\nPages active:                                 717601.\nPages inactive:                              1605513.\nPages speculative:                             25125.\nPages throttled:                                   0.\nPages wired down:                             207788.\nPages purgeable:                                9094.\n\"Translation faults\":                     3964385548.\nPages copy-on-write:                       336364829.\nPages zero filled:                       18619219792.\nPages reactivated:                         601551857.\nPages purged:                               17373848.\nFile-backed pages:                           1732131.\nAnonymous pages:                              616108.\nPages stored in compressor:                   539871.\nPages occupied by compressor:                 172636.\nDecompressions:                            160550500.\nCompressions:                              185044520.\nPageins:                                  5900178191.\nPageouts:                                    2729765.\nSwapins:                                       34112.\nSwapouts:                                     156707.\nPages tagged:                                 134101.\nPages tagged resident:                         96532.\nPages tagged compressed:                       37569.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6069.\nPages tag-storage free:                          493.\nPages tag-storage non-tag pageable:            91734.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5563520.\nTagged compressions:                         1686019.\nTagged decompressions:                       1520599.\n"
}

````

### .build/quantization-research/practical-app-build-v2.log

Original bytes: 3000. SHA-256: `69db78e358def857bae233db2d53cb92ec76512975e790f8468cecf58faff46c`.

Normalized bytes: 2965. SHA-256: `0fa028cd746b8573a32a890ce5bbf17168a80315ebef0a1903e6b30a9017d91d`.

````zlib-base64
eNrNVllv4zYQftevmKAFbLe2bFm2k6oHkBNbdBdZJD0eDKOlpZHDmiIFHvYG6f73DqWkEVSnySJG
Wz7IpjTHNzPfDDkfDaMFvBdMSi5XsHRcZMGJf/ptrjSUWmUutVzJMAyD+WgYL+AXzS2CUU6naIJ5
1Hi35bkdbFAbUhgMouOTcTSNji5Op2fnZyfnof1gg3k8nCzgVBUlF97LtVDWWI2sgOOMlZZv8LrE
1AlWea1MBt+8uXx3/t3wvVa/Y2rN0PylNLyucQwf7QzPiyVmPoQrtTW1hSQaHSbxLIEt0z7WBDQa
JyyoHFImBFgFnS23Nz9Jw3I8ubVoOsANOOkMZjD/TKqBM2yFiyAaTeEPaK6MWRY+ar9zli1FbQTu
QDlbOgtckuaspemXz3OX94FnPRKiHxOidAVqZjHr9uCO9A536PnFNowL72zOs8VB2IqAnGu19Z69
7G4LrfXbYD8pOvoHdwUWaXnbrfMSLpnB4ywjZ+YAvgQOXwDVkWfY9+Dbn1WeG7RmXi7692I98vbV
E94+Bp9InSsChfpHzVK8Jw6RJoobvNkwzX3CoXODLEPdoU8GJBLroaDCU82+hlRJQ9A0pDdMrjzN
ffIE2k71yTJpg3jSAC1Uug79o9sL4ia9MszJzF0t4GQtQnHFTSYRJqjRwLcw/17aeNwV7BZ1rw/1
zqo1StPYlj/0FsHfSNGs/v4CbZK3trWDqEuXU6QhK0uUWZeULUprLvMEPh9VAR+1AjaFJ2UdbzRb
dDWWSDPDQx/1ybuTNqmaqfrb+1Qm/FxPsYfxMUmmzemx5eS7zsUSAT/QwKJ8BNGYQAZR3IBasnRN
PUFkJXBphTx1WqNHd40i9+09aZWB5/ArN2e4dKtjY1DbUyVzvnK6mol+JFBvWqclhJkXovTs6u8X
NXyr6k8EtssaqUllMfGVzrhHBkxs2a0B3DDhmK8rsSFnwmAQTXfGeIUCfYM/E6WuxSjOaLbTzgUz
9jkjTqY3mK5pVH18JRkOk3H0AjL8BzTYV5pfUW+rHe6rTFH73HsUWku1lcGTLH8Bp6PmRCFfD4fI
a9kxS6bTF7Djf1TtPVXrFTPoXxlBz5GpRQi6qU4fbraXy4oI4Vsu1xdc4Ftu6Co78QL+lT/4DG40
GxQsHVQZMfVF2t+e7i/R0GmL+EOyKOm0xAPoHsbheGx6wZ9Yx4to
````

### .build/quantization-research/frozen-practical-mac-v1/build-identity.json

Original bytes: 46243. SHA-256: `22a454170ffc317e88896fd5b408b42582d607da767d4bd2f5ce2ac49cdb9134`.

Normalized bytes: 46243. SHA-256: `22a454170ffc317e88896fd5b408b42582d607da767d4bd2f5ce2ac49cdb9134`.

````zlib-base64
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
+d//5f8HcKMDRQ==
````

### .build/quantization-research/frozen-practical-mac-v2/build-identity.json

Original bytes: 46243. SHA-256: `89abacee1dd7be1a0939389026c953f7b6f696f61b231e37067505d3be97219d`.

Normalized bytes: 46243. SHA-256: `89abacee1dd7be1a0939389026c953f7b6f696f61b231e37067505d3be97219d`.

````zlib-base64
eNqtvVlz3ceV5fven0Lhp3ujW1LOQ98nW7bLjpJsWVLZcSNuhCNHCWUQYAOgLHdHf/f7WwekeTDw
gDpuq6wSKRo7/5l7WCtzD//rv3zyyS/6xVW7+cdfb39oLqZf/PdPfhFX66OMEWdKrlVXXe/BTTNH
LzaF2XJco4fs2+7e2OW8684UE8wqrjj/i/+mHzv7q3n0Q/0YOdkRXXJ1O2dWnCuY7P000ZUSms8l
l4LMmpZL2+Q9p53ICzMF1+9/6L64XLf8uP/FL/jl1238rX2/PrtZt9eXP64pQXO3PdsMcYRZkLlq
LquYHcLIoSfnZ+3NubBr6HmvXoZ1Pto4TF57dHsQdPSzb/9+se/0g3tLPbvCjzbZ2pRWj2GnWkZN
zXrvgi2zjxpqDd6bXUu3Ze9ugnNpjZTf/eBvr9/cjHX7+RffXl7fvUbK5xdX4/LNXJ/fvv2Nz36Q
PDbHWB9DX/zVhou+5th6n7EWa0zqK1i71wwhtN666alzbDEvVzpb1z8s759yxuG7VojTzbb9yqvq
0EevNpcdzGxdp19it7UWU9LMHKFH8I411jRjbu6xHIm5vbtZ7dXnv5zt9d3Fj+vb12u8uWx3F9dX
7/dztmKS29umYWd2Y0z0ILrebFnBjxl8aOhbDAUdCTHHyp+ojf3dce+dTsnd++Jq/ebqe/5+/6/f
izUFfTI+JmNdKKuViqbniu5mH2P3eZi91ty1Fb7eZpt3qSWkgiZx1vVlsT+9Xjd3X1xf3d1cX76X
27JhE1vdvtUZ247R+T5S4yOrwYC6r3P6yNf32vg8/vjww9W5ULfq44ty/+3m+s3rNe/F374X7Ozy
baBI2bUxbETvWy8mc7yY3vJ7xZYHx4+mBpvR5hT2QHwZfro8XhT87V27mu3y+mrJZt4Ljij9wX3s
tD1a63ZsY6WUq0029RpTYrf9ai6XaNz0dUiVU6h2GL/KKcFXdz/cXL++GL++aJdr3L0XWnKwq9iQ
Q8M8a9Y35h58TmlXl2I0FUFpuh0wndZqSRXvhs2Oisr5U0Jfv768WPOr67kuOd598f2bm0c63UyL
rmZn3cqt9JhwkblGM1dbvhrfkjd8YZxhoN1YrsFdjeVYRfHBnlSuN3c/rKu7i9Hu1vxuXd1e3/yq
3Y0f3gtfzXKuNfc4lvG1NWca28qPX32E7TjoWGzcLvkyYgoeC6w9OhPzKDXG08KvX/GtQyf89fXl
xfjHe7nJ4VKdQ5f4ILfz7mHEVkfDwuK0MczFvvueLE5/TMupsDZOybUcllkn5P7q8nr87dulI36w
zzatiJgWsF+HU15+NDR4ph3G7DtPqRj+PeaOj0GhfFs2DHSBP+LyPCXy+s3VXPOPb+5evznSq4wl
FL4hhZXYRA6z+u0HxjxSHLWNWErFM7ZgencJgys1lMb/JoeS9ikr+uLr/9Cv/nJzcbeO3aP1uS1O
hggonalmdI444xy2K9vU0NYu6HUp05lcXMeNWePKLN6HU6r0RRs/rF9dX//tb2u9vrj6/shk+Zkc
UCv8bS0TcrfLzIqnGGs6HPZyNhKN3LIAAgJpbmbYEXDIkV0+5ZO/+GGNv72+vrg62tTUkwk+JctZ
lhztCnVXvjRviyZxWtX5VNzum8BEfB6cq19xxeERWk9p7BfXky/77vr68sv25urYTGLMxDGH401m
91VCr6lsF/JCG3vOeMbtBkHIWpPzGFu7mfssqPMI6+TGXr96DUKZv+Qof3i1sJf3YjFxa7u3hJ4Q
63QeJTW2r8xx2szXueFNB0rV6kaOPkyW0i0hYlpikDsp9upu/XS0r3tgBgZ0YoL1oQCGUp629WhG
HnXssXafO81u09wYDGCv9Dz9diYQdsvLsn672u1Fv7i8uDtyBLt6W1use41IOI2deAKYy7g5mzlP
44GRLbgF3DKxuCGIwUeDL11e/iM+8av16vrmSCJxcwTn/Z6e3XLyYgmv68ayBb3duCOPkwghLqAL
tsPRbz6e8JN89e1liX+5uJrXf3/s8ub2YNSCzsQ+8DEDaMy+gqBAnTiJvQqutteQFlBNHwvESaDB
bvcw65Sd/HoNAsyXWGf7YbX5Xz8QabCKAjA0DuDcS3GrGQ4XfBuNKVhQH+DnHecuts7tiL4h2pmM
waxb7fPjV3CkwmPjgxyaRPRyYE2Xa8Yhek4cfzBsqgNgvTunD/x2Dd8EIch29jbdMqdkXv/96vK6
Tb52vLm5WVfHuz1wc26Bv2qvy85tnQVH4Ybw6KOgWACkveAqEYQRoRYFD9y3tSIsgO+PkPu77777
+r1AQjGeLVsCI7gzxbJWnmxpGjkvkIzvoKWdKwRDfMbgTxIrJAAa/kw/5ex/86qvKdf0zfXfj0Ca
5fCcA90DQY3vM7VlOLpSFogN5AKqR3cBEBHVxQvy1zLJzLIJtSmc8oT3MPgIJri4beGngAyEAZoJ
qXqcwHJ4eyD33NuEbtnONAgowN9MeNMfJ+6kU7r7m5ub65ujrwLbbQwB6uehD82NZhfROmSgJZi3
ZAM28A0oCAAzgHvgYmgjeSd8YPopUT+1cffNA/VkX+TQu4Whoad5wlRDOvAItHETZHrQQUU2jjAS
WNNcxDBQCk4ir5PSBKr/aRLf3bRjStFKyhvNRGiJYaweYtwB8yjJuBzLxP1a/vXCCvHCYH7ASw3D
+Q3DHvZFwV/frHkx7q5vjjwfNo2z3ju7CMwQOQSNiFVn6yGpAAIoYTUNgRbyDUEdwH7cQhP0Xx8j
c68H+BIHTgxcUAWoMFgdywP9RE4N+NWBd3x2hEGYTuDBU0w499ywHqARUL+8KPJbvvBoW/GwDUuD
B4k8WOvdnISVhMO3jg3H7YCaZ2mpGIwKtkZonTM5oWCb3IvyOMar271uvr651sXCkTXmvQL+mvhs
/PTNKmClCcefla2dkjrHthEGWUddpRSDgcBkOnrdTjnX3765XVN7e3F5+cu7OyH6BwTCBtiXEbjB
ISSXKju9sJeyN/41JAgp5g+RAxeCVgawXnQDxALaL6eM899+/Yevf2i368nX7hxmgSFl3wFx0YP1
+qqoEh4OAtGNNcGksgywq8JMG5ihc+ZrbxDoSYfwb1//x7+DMX95efHjkcC6C0EQgu3Y4JBaLCbV
mvlnZ/nxwtgThLaA4ZFQNnDE2xrgbfAm75P28m+wo7+3fzyhhbANAwYoawcCpYkd0tt98IA8DBXC
sItBa4mcHe7oYyrNeJv4fPxwmullkY8JwxwEP/6b+JkhHpxfgDgAsvA6IPRM9EzeJ7PwBjj9iXBv
2dJgi4NbnJK4rhZ44HhHszMg5YSBO9On9wiOPqGSaAxn2opoAyRitKKrO7uWaBCugiiXW39ZGFp6
0J6jLd0z4WtRGpY8StItVwELAS9KaUvowI7qWAekv2WMiSPfAS4UVwPunZJ5/eO6uTp2d/ogGRno
0gAgwdKuQu4CEH3BGsAEqCMMF/Guw8Eb1CHgW2H0unY4pTJftn+smy+vR7v8Mz724tXRriaIXokr
DdcgBDH7HaBapbYcWwa6xgQr8IAQcQlPdOkeP7zbbgm/P14Sentsg7rrg2FlAofpxoXe28DBxW7b
IjrC/UINHUMvc3p4UceKUC0gwqzulDv/6hjZjJ2A28Vj30QPJ76c+WFj2FoCIBoCNvF+xEpgOQi3
uEkMHXxwxCtVc1rOOzeuXx/fD8Q2F9CGg8jB7kD4AJK2NmFboAozcwkR40hoDlo6gDsVFWkuiXqd
UpSvYLIPwI0PnZ/AjwbiWvgqxlYa3hJNBVz13dxMNqVqIn4HSAWLTx5w0OEo0IhTdg73eBT38/35
4/DZHlw0Djmi86kuPwPuFGKH0+mm9VwyKBGE2pLPK0yzQOUnhemS6Sgs7Ka7JNCu1TX6qtBzFBA2
bpNuu8vuRW6ZQBWAbvx6gRQhJPBAt8Z6SZKudb4EBq/5zGVLhckli+l6i9PnyEBrrRON0Fmht0yo
zKm2BHUdG4sZeTY/oc5RLq19jPCvL9vV1YOrCAwpuLIATyhk8SkunBWsXwQKkDWmVCgAg4Pu7wdY
AWSi+9Kwkrzhx0j9Zn1/we/949jPAIB1W7+T8xhIaFZAC4PgkwV3XGFvQfkFgj2sg4V1vPdI7AB7
8VEb/e1du7l78/rXa7c3l8c3tdGgrQudAq/65EzKC2JcrNH7Qs8NgOe2bvQCiLK5ginBZWVGYnTO
/Azhzxwz1CabBJON03GqOPbhOrij5e5sMLCd5RPuJwPqMWVgWJseWrsEafs45e3+8P1Ne/W7dvvD
sVMIjh9cJ54OE8Q+oDQZ7hTiIEj0bNiJ3OeAbJkOXUg5t5QJOVCUfZLTHaQ9ha9ZnNXwQ4h/RCC2
mijfEWMCME8vNVNXM6ngTgE+eI3EiiZ/ogMC/Ivf9wi9epkpBHijuAX3AEou3oQ4UV0cBi4QImCl
X/i5upzT8xghNBDUAF6nItYf++26+fHRhQCYDC+UAeAtNiBcUbzKgdh48PjFGABXhH+Ap/S8smRY
BDP4kBN3OSXv9br65e+fYqoOrRMFaRbnc3ghytZOYxOKvFDfGFr1eAT+hd4K3SyO2NLW8qjrnC9K
fHIHe2DgDYAz4KKQy5jAih4GG22DZUQgawSteYNjj1BaGF4H4WRkw2brSYFE/ov/eY9zLtvdvr45
imC7NXhI5huHBdfprpDt3ZsAis80pQVH7AbjVLDewnE0sXY8oS8Tz7A+UvCRK0An2T2MHw8E6ogQ
nqQ3BNh03l63ZewhYXIXhzWyK7rII34BZTmFdcrnygvc36M9YQLoK6HQ77oHC+cbFicMmuQrJ34g
JwdMQENtn8Wi3uB03fIT28U9Tj4FSuq7xynAz/XxuaKQq6KIyw2fe6soCmE8j1UN1Hytg63sQywB
ind8BV4oTBCDIbKv9aJYPvQ/793d1+3iCFWWsEFcFs6WMQ+YOFzEF9hANGOvFfl+2yMBFM0FwtsO
FYMGhTwKQbamk4Jv7jCYb67vHtkpCCEDs0CVXa9BihyEbNdxAZ2A7hvwB9SzByiWE9YTB+yLUOrr
yLuc4gVfAymJZ3DKA8H86XDPf+SRHEHMg/Z997Pq0a/g4laBDhiD44jQvD1xxiEVyP2EecKBLP/Q
Pfxw/hzJ11cg+NtHn75KT6aHMqzlm/W223oZbrGmhrP3AUDP0QOgiu/sD9/stp84EW/gLuFnLOC3
2G87UrGIDTnIXgEsmAkzI7aLqoObNrCizG0w474t0EEvDjj8omfuxQIikedniH5LmI7ZCzhs7mlA
pZAV7AU6FDCkMSAuESwIurE6EpbRTAnt8EQ9J0vW6/jPOvPHN9XKfgiF2GIBqjb24N3Ek0099hMV
RkgrpW0g/BNurws5u3E+aAChg4P/GaK/WbcPQ+C0AH+PYXXgrlnwqEpoaBMVt1sKVg6ZC87BWXGf
eg+egJlSOwaR+8/57G/b8QVDdgBkjzkFv4Fntgn/HyhvgZaxD+wwtt2cNQmqViA4uBWYORYSmz9p
1xdXV2s+fvg+0nHAN/EJB739xo8kkRCMCEgH8wbX6HW4Y+ZeSt4QXONkaZyII0zVF0U/YgZ60cGQ
iAZDtze6fs+AJV0ih2xgjpx57GCKEdbYu65kWF09PFAj1L0o73BJ9vr65vh5CbcVCAOQjB0qdN7p
RogAATclSsGlJqYFiskzGEK+XIxjN4xHD2fJHy/zq3Z1sVGr4ydD0R4Hbyt7VIuRzOH02rVlTDIf
tLmiwvhsX5yfw+uKGfNahah8ClaJgxwFpXiI4D0s0ZzqZzIBKwKghbgLB4Z1EoutbXPA3WF6Pmec
SWLjQefmBUH4iC+ub+8enSbotiwgRQvD6dU+r+Rhk0CeEHze+ARUmPODIRD4fWxl8Vm71kWczN2+
LPTX68eLYw7LR4y5BdPMRjcMDjminPgGV3rttrIOHIhwG1FCb2ZAPDBOtgHWvk9d6r695dQl/WOv
tMTXqkcrqiHg45UJhk4HB2muVrcNDo/kzKwY6uZv0I4eHDDAdR/sS1Ifhz5biClYWx4bJyMaMDIf
k8YMAZjjhuissosy9C+HWOvuK4K0iI2gqnxa3u3tm5t1yBtox1xyTQd8yRs/L9db6iLuQuQ8aqWM
IgIRca9GILNZQMbiKly2VM6x2HY63t5c8zu3j59D6yrDHEjOdiCjYZVc00E1usFuq2XIal8HwN8M
6CpCdbDPPP0McKpTr0h/etOu7t7i1Mf4DeVfrq0IiqtV95m29riNT1PvMIlvAZaaaldrwJsEDcLX
gqoAFY4/f2p3v1n/4w32/ySbyoymi2ndoy5+iCsRVgX/Vh6XTZUQ7hVZMdbNLxYUhOOdLhloffIn
H/EJYxeTwHKPVf8Ijrlsr99LDoQoDNLlWeFtGSpiQcnZK4yy4RXmPOBVoKgAxUww9OTjis64HYm7
67Tk17CAdfuEauWQcKgBzDnKsr3h6BxMBJ7sbQZTNb3bz84n9spe58PzdjJtmApOPun1vuEoD08g
//n4QqDoCX2t2sAIqzs2eLmYzIj4XL4qE2I3uH3FJHcLVkyj634oYre9rfmi0GcuIXzsFiocwGIm
DmP4BSoLbMHnKZlAyY0R2Nga3wVwyrqvTFDALfDY0osyv2uvv7i+uXksF+xNaASmWYPEEsxQcpKi
s7E1EcCGMgWXriSBMeDzKhA3+BWQKUX3styHV4c4sWFrVoqGsZFA5lOozSkPzuN4uo2o1/Z5uK1k
qcKaHDzLKV0mnn4ylDy9L+N28Xh/+9Ob9eZIcADMzlgJLCsDCnqFVlQiDmgE2lFs0EMzcKmsPCIs
JMXa0DRDNAps8KmXgvvjBBw9fdYCieAGjHKZwmZfhy4mwiSiRT3GGKj0JPywl16JTGt3/iv1S70S
b05LvcFEjxMAK2CAeMVX4Auam1YJj+Ax10M1MAkCFyZsF4Ac4h4gda0SAGfuGXt5UdQvUZ0fH+S9
EP/5mJ2AWso4iNMW+GKUDwL+4vIzdGYlFBUXkZueY8G7kVAOxcnx5Ne9Swx7CE7kZUCafF+Mzu1d
fJyHN58GmwrOHXLTqpI4le2TlYKMU1Y0WEK79gWJSg5+lxlxFM90i8XfWlwcYkwB76urrGKUEC7q
3PSCXzgwMDe8jpA7MmgNXAuPLB8h9Cnec2bnQzJ4As0DdjxEai1gpvK7TcoVw/AQxVRA27ETrvkd
JYwlt9CqUxwC+M6+vqOLfzt2QgioEc2oumnJ4qsTgNVdXDBlmEL3HlOtgG4gUlnGJpao1M6e584v
yfxmDT1wHWmQybqaW2YZvsYPvsvAAEvvaXbw2K54pRKV1lWqJbgvm4JXDkewXZnmJyQ+cHjfEtlG
O7KWQ2ISPwpwbgeOJyWYU+zeuYAEgmtRIB9EW+ywwUWTx+27UIDFus87Jfj6+vKLdnn57evLCzzC
ce5CEQqpTpkIQOnhM1vdACOx6u65zqEckAZzKkT4pJdRUSmLMhFY3Skn/+c/PZd7x64uL39dC1A6
ggP7LqURUHZyA4vAhojhLhHi+jAb92BqNhiNNxz0PCnwV+3qb7+cry5ubx++mkCzYRCpjZjdgm0q
47WBpqPyycFb7HWDBePQnXL6DSTR+qKsgojndSdlPpdMWb0DN+NrasxK7p4JlmQhYAbSja/FFeHS
V09g64oKLY4Xgj5k0m6cfLr485/uc8KOkyghywVXEiPcPu9CKCFYutrhd77D+euwptcADCmHR5o0
iNAKsIDfHF4QBgi6B17HNkJo3t76AMwgQAcBAcsRpQOM74MQQkAheuEITV+JPzOTcsBHQHtzOS3y
pu27v6yL7384fpDB/tiiuAmVCW6SMG7lMOtGtsHso7BROzyTrLSxE4JqijEYIqxLK5xW1Ht8eSQs
uaD8fyy0jokY+EiYOJtqBDz42srP3rAKeJfSfAG4eoSqTvdZo3+EsH9fN1fr8jhBixhYh+JFnOIk
ONKFIY5dQ6uEL2+BkH4rbqMmWQ5OdSYcYJ1rltMfeJQ5cHPdj/OloKoYgDWjtGwhQRGonIHx/B3U
zFK2ksaVtAkyyEXPnDX0qSdw3eeclHr/jW//1XFuKtDK4LkI+g4wzgp8ni3o6rkJcw44ralA+1lr
M1AlPBROgbgeldN9Uub969rDjzShYhm+OaXyog56xjtkpROr0ZqZ5NjxA06XFhxzCgL3kEVMBU33
JwV+/eVvHuYPRjAM5BW/jWd1on8cEPgx4w5SR2UnjtvjChqcSMiTvVxzdNAIejzHaWlHd/fHbxQV
VkO493rer6qeqUAcDByrPLxcTjy3hfmBKmGg3cNKYBC1OgfM9Pm0zHeXB+P6Zh4JLaJ2duOeLQ48
dQcosD3WFCwhlH1FgYmdBOhELIH0IhftMkb3kLDsjxH6OIGBBYOkmjUh1wSbs9hL4ueaoIisG1oc
qxJdKiwIBzBDIHgAPjgPyP3po7z/wuN3w4IZ9Nk2WwogGBAcKCuOOkYDLEBKLGIM63B7oKdhn+R4
4H8u2fQRwhSxju6c7PTw9pQ3rrOAJVMYEXiOGoH7iV7LAOKSiUqHarsBoqsuvQicHsxQP0Lgo9uY
voFzMgL+51C6kMD5exLk4xadnQMItOZWmnzAelb1PekSZYkanQaS7ySK/Twqj0EEWHU1FZpBsJxK
DQ9lEyAR04xRmR5eHuYQprIk0eqmyIWdZs55faTUh0A9lgJjNziRVZUDb/VQ6PRk76Prdnfl2szt
E+QDvOxCnqXhFTj7bNcLTv3dTcV3D5L/Ay67NFDUQlXa1q23n3wjqKDi7JfN0duKbfRNTMZSnIn8
Id3tjfoS8NB71s0/vrgGW1+MC2Qfmyacv8kB7LSRp7BcAIkd2rUWZ16VQazkn1120IXGGAeKLwyG
+u6PEPxd68fvlcpAHBydZe+6Hi/YzWLxbBgDQUPpNvzz8lEJo4cyu4wfjL6PmfSW+4JEePtjVwAJ
Zrk74rUhyMO30gQagc4VTLW7yVnlXfCsCGBGodn8zXni8EI5nWj35z/dV3X99sGTrAffWLcxt6IL
HtABRqPKzDA8utVKbTHHglEajBTPsdmQJKhileN12jq/u3lz9bdHcSv4nZduW0r3EAFzqPnt/FQV
mqaqx4PhQm1e/hefrufhikviYAfR7eQprqt5fbPmIWVy/npd3rUj8/SwyC6q2E1UoW0ihBHOctkQ
gWgnDkIlyRuuBXceuInewfM2xd6Jeifl3lzsf3zdbm+/XZf7gJ2PvzcqLW2BWvGBaI63bLZYLbhE
+TD8J8mpb6WJR10U6E1eyZu4kJO3XH/WI9UxJ+ggADiBg0yKCrSwgHID8NzhrKhyIqAtNPdAOyof
jq2gxLu05n0MJ03z4qEofJ1u6JdAQNsJ3NRLn3mhNutwqT23aj4tMabggPvESbm9cMQ780fDi6Ke
ueWBLKIqZcwaUksdBNQ9gZCPxt6DxTahYH5E/qluQCDi+eUGaUbnposvykRVX70+ftVN+EhoP142
eqCWjcpsbWDHpuRiuVQDWkWN2Ag8PKALaVXPvUSWdso47rnA00sQlYvavT1gmUgRG55txqx7NOXc
bdBJtVX2x+Fuy0eF3mGbsJ4EHcz+RZGP0ogySFzlTF2XOxi6fo6+Jifl06zqhO5yqiO7rG32Q/l+
qglQCZ17+RNvj/NrVA0HWSZQxQGHxFN3o9xwHEIDrLsQgahZD8QZ536oriSMwNFXt/UUtvoL0fGZ
IkcLFAWnOkhdSlXlyQCMYm3Lhwd6mNzG4kCXduC8icJ72xADJl+jLacSa3590b6/ur69uxi396WH
36yHj5i196X33x5hVhg9znzD/atfU0mdhJa06zZG56sHzxVLzuJfRs9yIX+c6KN//q8nq+EJ1tM7
PjDCLg+PUzCHMjs+r2MyXm/yKupwRffveKCyfVy4+WJwVzGdsZzDG/aT2sFU2IimOpEl7YJNbwXX
NbOrbTn0b0aU3pauR7OOymHIMwYPCFYx2LkLeVymNFXGYYKBDeopsBB1lQUbcVWlC5DjoUfH3GJS
KUF2S70cwDawftBjO3sdz5fv+6mobonA4O01Rt74TwI6+wB8JUQE0cqx5dBczgk3jzvEKAljeCN7
7nLek+gj4uXyUpF17k53Ra6UZvLYINYA2hyl+q2yrY0LhB4Z3RIAOG2DrUUOr5+9lg90GDBeBsRW
ZF2qCdGZdcj9BXduiBmHlqzvgCYwf4UHY7m6R138D1H7s/fmWUMC7hFREzFUJTLsAhh+eEzJAA2t
9DkFb6NpwDTwaU0LeNFUpA0r9aeC0AuLeSYZJK5Rpu6Hu4FauGJsNZY4W4nOVemR/FqPhB6o4fA0
Pq+I87Xwq6jeHueu5TEYgC5WjHaC0lQrDr2EJefobLJKbNvKZli+TSUPHrxeGLUTK4Mpa7QVzljH
5cX3VwtCdPvm1fGlCKQ4hLKdriN17QynDVirGjBU3aEf3sDiWJ0wC7hrjZ0TZ1vN2h78OQu5/N3F
Hc7/wV0iqtoq3sIQLVMyRjfAk+13xLa+o6pGq643HS7OKAszZti86aowzdGes45THRTAJGqGE/Xo
ucCBMN2gJAxHZMyRICRQij/BevSAZeqhrDagM2LGp14fP7ScDzVWQB1xHns4zh+rBk+of4Wt8rMA
/C6SnqdprutxMbEGo5SKGU3cBVT+81fy4WYEYcVD06AY4YpKXLN9OAetcRhusrokiVCV6F2FsmDa
2S8YtG8ETe+LOWMtwMs27n5/NddPxw8Wfs4k5NOUgI8ZhzFWDa6ECNKdqy89FRcIBHsRwGmA3TWt
nGIGy8R+3krUSeAPD/KQ67ZdLQqAX2imEC/w2jiVKbllkpKsjAAjZ1PZhdkJUcVwXlZPLafyCE+t
43Lpmewh8naFCBN01Y/H6iNA2JYyF8G4HcQSy8pExb0JQIB+3Tz4BXMFJXYYawvnrQRC/vvbS/zs
UfBphGJiC/sdzCGFMICKCS0JAxk7wwhCUF6EgaCv2HRzOOBv2paR8MjnrOQxZIJjTT3/1eDziGls
JVtC7irQSMmMhf+ayT86c7jtMfhbKLNT+mVq/ewl6EH6gclYXfhkAKtTybMl1iV1S4KtwlWd3u/Z
pb3sOtwVT1WrA6aUkwdLTGufv5JX7fJSDPtIWU0v3ps04UNpNvRyNoxnDDivEueDE4XwuL0dwZXa
NeVDLguyA9aesZYPNi4YfUOHF+4jqySwinhCho2SVkaEgWSBFl3BG3ardBBcG3VAfcD83cdzl/Ik
eQhciEC+FyWFZ7gFVMq9GjzXdM2qI04bTk1sjErmJgsxAxjcDJjF7zPc6+Fh6/EtltXjFGcfRCic
MQQS9kDvdmk7VBJ4YAN8q3Rf9DSklinGKTE4G9xI+fnL+EDbg2ZArd41aKvFjXff0NfSPBgfNIDF
CEtXDy2TV3P+cEuZSk0d2lHs/lcW8ubq7uIYmwyihmo3e4jdcQrqG4BWTiX7F3w+3t8o73HVhZvd
3Zq1K17VqoxxuTNc2jM9DDJ2GTOwCBKmblmTqAteC8a6pSw6D+Ur8rQGz8pZNaXQp6qmVl7Pxucs
4kFrg+OrTgd+b3p/IPSVIu4QOAC7Pdi17TpNj+pVE5SsaVU5kC3oTVAtd3uGYz2ujX/Qr8LNqApc
LHSrr5USFgdIMu6A1wchcFQpb9FC0Dx+DFQZVcui5OMziLoq5R+XxkDysE7AH+wyuUOqZqtb3dyG
SYCkOL2tNe0xF0y4JT+aHyuEvVolFrhzV/EkK68WTzC3C1Ckji6CRDB0UztmTMhNRZdQGdiqCByK
OUDt0R2/b0ce84yFfKgCnGju4aCpEPJHIf4BSfBXsF81ZIGKwzWM5T+9qsHZVIuqduiKs7Gwfs7J
PC0MJ7BsNXrLys+ZFYAE0a2TuCp4VBX1pwVAFvWsqT1mFlpNKnaoDP8Mq33YKsYq/RNyC9qYK8Eo
iKZWPZAaAAlwCkpNIQePg1u2jOnAtNAaYqJRQtoZHuz3r9r367ft4vLNg3tC1RE5ULoVi1Ijv7z5
Cw8Bz06YjnLOcLAq+24ZJQ1qQBghQXrEa/PMdXyz3hxrRJxK9Ku6jzQ7T7VnGxkuU5temkaodXY4
Z1B/CxU6ZkJdB6KGtgYE+IzA8nvgx/dqhnDkudSErqypWlK4At5yWatLKkLqodWCHREdiU20RTW1
dseALYHblV0bzvBcH+4hMKNFKz2QvXFCMVg3RpWiqH4Pt662LOq7BYkg1MDsdANrumrq2KRzbOSr
775+QmByBpvb0qAlgDC+XbSeQAaz3l2l1JhwA32VGX3FdovxusHeULCuTihnrOJxZb4zO3EmxeIj
ZbQBr61WDqhgyDCWjX8HtUcb9lAWOShgFrZBr2YLlnnGEi5+0ivT1bGCsqWofqptgcEAWK3jl4BW
C8II3DIciZ7Yjdr9dbi2aivb2mbCyec+RzVOlLgbM5olnsIZMYY4ahpq+GamYa8gE9NAHMCodUFV
DNEmKhW66ebV7973v7CYD9egY48rw/PznEq5OaTEpMRuZVUsmp6GieojZCEubAzLm8qcdXlagmD/
19f0XAcCP60aHB3qi0rsCceaR1KGtFGGDWAWFH8obUxggD5ENkTSY6urn3OPdqjofpS2gOpIZwSc
UZS59ZyzVD2hRsKoDTEFuZ3wi/WAUGOoSzkgE9XKoNYzV/EMNDuUxOfVHJEmT72ex8PzhMroRWA4
KFak9HHlE2yLIuGH8MwjlESI/vkrOS5TPuZVVpdkuRNKdUtm2Wv22yBIJe/KDlRDgx5TnbV3r262
yl6ZOD9o5xlu5XFJ+PJVBTSgj1WCNSq+UN6fafhXaK7tDkNR1h5kF1qj7nVQUK+yBlYz+rkreMK8
lxphcdDDxeqByq3GBjB04C8lzjozROAM6B7ABotIamWjPFAwEyHnjK14X8d9FG04BnUg84f02VHL
zs11nK6fVV1flXwfFnGm2YDlGLYBmKbLvGBViXneKtZ8XBFk+Sy71aFqztL1H3B6BRlyCrjgIMxM
WFRtqvp3mQYEQH2IUYrWKZ6zjg/UW0NsQSVZPZ3xWR7It1cBsmGuvokz4Df0Jt2NcnXGIB6Pqnxg
Niblc65E3temPl8GHYVY9XDtkzUdbJzaHGqjsg65cnammAhHQbfe0L0EhJ5eJQy7ZT6g/Ssruk93
P7660mPuciUkNyW+i1AGC3BysHDfQIeojVPqnFc9gTVyxCUphyiG/wNreVQBCUDFwWb+gxbHrNbC
6iSz4lSVMPgNILWBB972tJWKizo1aOFSIX2u5V9f0JNen2OqOMYcajAhFrAqiJbeasTzIjvkQoVo
qIWiUS/kgI2bucdGx3DDZ6zo+vrybeHb7XHHlLziyDMm1XwqrXuMQ7pljCjxXmqovWBWI5diBtRs
OPlAuxuBK59l2/dU/I+v9XL+5uri7uJBRi3RzqhT8OIQCgAfe1p7e91/A6qMclg4Gr3sS7un7X3V
UH3XBZ+J4+z1/OlNu7zYaoT9sHRML41FDaVHObSv2lEV/XosLfCz6vUcGs1WGzE9hk6/gZ7oOIvu
Oe0z1/PTF+11Gw/qgWZwMAto125q8WLjYCljLbW5cepCjrclFBawJ6wESuTVQGz22ioh6eydeVTF
srLaW4Xuq7IXdlm+GDXBFdnQ2zBG7+wwmd3AkitoqiXLv8OecIwjnLuKb9aTxKBI2A8RZAZ6A/DP
ZkAwuVTx8ENS+8hq5dTiAC4AZPSeXhYrzFkMsp+7lCfvoKBYnyduxKu9gduD41BnOfix7KpWtdPe
MOlRgQ6lqxPHqMGpxg8yfdY6PlAdvHErGikAugdNoo5mGRCDQ2+ThWq4EVNSopEZILzEEcLkVciR
dHl9lqM7vOF8+3odc+U2onFq3mtwq6IiXpegqbVqrS65wJfqSR2ImFZsJbbR1zxcZ4S0zRnQ+us3
x7d7zoUFZo4O8LbVFahWp87pyegJFGoB9N9KlXW63WkGiAe53xNy7NpsZ3jX40rm414VKgnfMJ2S
lXYIoMyqrwdGz12Vk7yV7A6p2IDNQ0dAOI+aUal9y57/2jp+tR60KM9Gh2CS7g2UvtqrnTYkW8zK
oRQ/1OS+QQNXDHB3QByGXobufIjJ5yRUHC/mtxc/3aGytw/awgejy7ucZuAASjUWoLvUoY3oN/G6
S10CiAJbLVJBBz7OXGKZAHG//7X1fHn9/cVxIGxB778+wyGCiTBh2+Vdq1Uz+lkKHg8HvA5BxuJ6
nTKqcW+hq9e7jf/aaoALag7Vrh4MFfGuYcTZuWGGCyk7NVpMEI1IeB6cXEfLA85eXTNtyXpbmspm
bdPEcxIsjpf07XpUe8b2+20x1jw2ThQiCLp1Fh/vlwcPqNJMbxcVDNoKMXLpAbloBsrhefRfW853
7fZvx1mFKrjPw2eiTdDNU92mI6Ud+kz1onbiBhAcNPXFDQ5LXa9GGJofks9JyNGTytsL0qcvpHzp
DnoVHksZJrEp2d9bNbyzWz3Lqrcp7FCnSuRaG7q5jjMYteUM47zV/K5dzctji6oqjk0L54KSwNTB
cQAR3b/FBDHeXjeUxIW1NEFDOfQbQm2wKDQGTTpvGU8LT1teTk2/vV8JTuadyj1X0R05gC3raUkz
F1rO5VDACLAy0FgNPVI6aztnHfdFC0/eRnWRjoWisrupWLl205YzKtUiIqx9KFQEXGruhQw7R12p
ouamOVVBn7GU69frWXO2daoXlrO+2qbtycWr211Tk02jfPHSVtvqmYRbhOCPBWOcqQX1LqtnLeVD
XRh8VUWDjUblhUoJDZZDQUeUfQhaSdGp3V/wqW8Ny6oASw2i0tsHkHKdt5ajBgJHkEUd2gEjc3kY
fVR/WD/HGiGCjvwAYEO0bVb7uxFwxkvtIeGRqr6w/hwY9+SRtispKEDAYGQtFghWT3rpis63NDAq
1rC9eoMTHL0loLumbHq1H+z2X1jCr97M79dxRw5OAc5cVYI/JhFPfTon5lMgGYnf9so1lL6mNJ18
B+upfscBjMvtDPj2bVMqzs2zChtWAiqtEvVgq4cllQBit0qGCmMOpV7WsJdu4HXNYWe0WR3PzICs
9jPy2U40e1CD4qIbsA6Q90kzgMaoKqMYHI+tWa/JamekJpTVArHwuYDt3AhQ6xyf8syVMdaac9Ug
IoLg1Lw3n1pVjYdhK4oPQ8MWLLzIgp1i19ypQ5JIrGordQau/PaHdvP2+fr4gsV3TRljLeBJYpyF
X6jHcVH6ngZoLOB1ArJkpXc73Vc3VfqYrVkC5owHff2Jby8vHlS/ejeUditgBP/2IKihBPfclOqQ
bN64eRuiz3gVoyStCWpwS0/M4onnaOvzjQ6a2nLWuoHVVQ2eNSamHCAufnU2fqdXNbbFpHFtTT2G
hw3qTQ1Dmuc85n+3bl5dXLXLJ3kFWZVxXV2ISgUkqqOwP3RNVmmgmq1Utd0UbLQAGA4DBcWq4oKT
7XiOmj7fnKBGfLVGjXS9fR0uaPPhAWHjR3VCwUtPlIeiUYu21KlGcZwLh0qMOmcdDytAjYXsEWFc
qOoqjf3OblVUoxrt2DVLphzqPt2oufvNb9igi1xjlrpFnLOCJ0l0yqxIBuK34F7RWqHnvodJFqNx
0NCIi0UplDtmIe0ElbZ0IzZcBS+dtQ2H5KgjKymoI/67BxFwvZur5oRQr+7Lq8BMmwP5ZP4PDq1m
UgWWCpALGScazlrCc/n91enZr01sRVX3zWEzYeuieOpxroEbRXLiIOZadeZRFZIutWGAmFE9Zx2P
rmGDkM1yhG8PWwkgoRl7H4AQ9SUKBRhvQUmjEvHUAxuf2QRQdlb/J7vOWcLXX/7muHx+r7UVZTfk
qRAshJdZhNLB0M9k2BjTRkQZ9LSM8aKomrKk2U7tLJ38ut20y8t1+dA6cqwYJdYHHDrkdGIAmjaX
1fIsb5AQh6UGQqZsXVdlzRXMapqroWXn+E5W8iwqnUXdbQ5Vnm53tVocMAOnFAcdUcOZwXozzjMu
4o5S26U6Q8aU+lkO663XfNyO3ikdWw5I08PYBwxx1KY03KQ8PrW2HarH643oGkOCqIeccF+HyH/W
4TxT0W3tPFRQxD7NRkuxQ3W/Dpr+UDSrSL0/TbUaZ6p4qhkcXa+1ejWc5+TevCv0Pq56Dl3x1KWZ
6pyA4G40lEnDhoy69hozgryJpt4O/JiH2qgxW5My73NSK/78p2cLXzgK1QuoRZAPxSfLVodBJOc8
VlZHVX5/DlxYNxyFrtiG7tWsm4d7vbMWcvdgDEmKUVfrVi4KqgKd5Ig49bkw4QEEK1n8QW2+NLRD
VUu5Bzwtx+LqObzp+aJpsA7GqqJBLNcNgH+DTMJbe1FPDwBf9uugLt6pREhzE7uaSajYoZ/zZPO2
lvpoK8ZEB9Rj3QN/rQaTYQj8MilxYoJrsu9DNx9JUzCaHkx0czbwd9Oac0zkn1XORxGNrUUpcZFs
BZbiOz41HEZ6sRK1TLSxawxP1juadRCV3DdBb6iF0Dm3u4+v3JX7P6z3cFHlfi+jOUrGTM0fC5on
UZvLI0Y9gkffmjr6wBoWihNzPIeZfLA8GSLGIjwnrx4IRLiuNn5qE6zZmpzHxKcRyi1uIk+1hUjq
ZwapO4x8Lucu5ekDkVGHFxumDz3iAvjsFIndxnqj+mFgV04DM1KLNahDC7gOzfDRHKwe688HGsfp
oxt6qFa9eKroNR8t7vsQe7h/i7U0dQo20OuggZEmGqChhSvW3cxHnsejpOIvri9F0I7zNjG7aXWr
7H1oVh0iNMkqAPeXLEK3XIe796ESKGODF7fGYkpvBgj4kev4t+vLuY776jdd+g1luuOMVxADaGsr
GySCcAljKTtUo2ncM9xMjUmw4uGS0nlr/EgdUJjYS1MM129+wlU/ctQm5dg0qjK5bMocZqEQalva
27ZWXdrT2BhMcfoHZ9TlrfS+ia3TxxNG+d26vfv3i7v345EPlc/Hn281IIAPVAleC9Zq6A+EWMCx
onYrqUhHvfTYYpC4B2fvBMpXv990ajDoE9Hfvbm5eiw+zAhyVJPvkg7t9vVOnKKePdlnQjd2UcFy
zRM6iE/gOryy8ja2xjzEl8V/0e7a5fX3bx4N/F7K4gMJdb7Zt5hBBr4to6Jvwo/OVg3Z1OPHqmYq
98z6luC2DR8hFHT009tXk6OXLQ/fniDSnJxado441CXRt9F2AiwOC5g8NEgE5iK9q/tN4TAE+QkM
L8t9O3nsySHD4iobq8GVTu8xOUY9fHgLdyuaM2k0BgCPC4fqnLEGExo9Kx1A7kd88P1I3cdy0RqV
66uZu6YbYb7r0BIuqvWVaan7sLa6N6rSv2jQpfrhAMU8loZOviz3fizIY7nquenbDkNQMEEZrEaw
GiVAJU1esnqKbyonb1XIJMFtlgpi9VhkTj38v5P7ZLzBoxWo2koT+liEepdWpZ9pcACBVoO+t/LP
4e8tZd3rRKNJHibh3VbXxaD/+Sv4/R+f7IIlsBKvdtQrppqKHSok1jaODZ5T3YNjV++hjP/sUBbB
MXUViMbvU5WbH1rDV+uuTezt8UpS1Ei4KIbKmZRoMaesjgYe6KXHDlOXwaG05AO/kYcGYsIolvGt
uFV+/kq+Wa+uf2yXTw1B2UpuLzW4AxMb7F+dx0bSjSMnkNSQJUMss4HbBQ2WG9EDF3NlSfXlhfyz
Y/OTPdjKTi2pKZ2gd/VE0jXfVGctHXtjJWosrPeDWNRWxnrMVLUbfQEDXhb9nXks06qGS9OPrS7l
YYAJ1oWRL6fhkVmt7YKpKrGaoIqm4bWaogJZmTuebKv3T5lvW3o+0f/sJh+ozrcErEPzdpgFJzpc
WWZt74E1roWOfar8Xg5BrWY0mli5uy9LPuqN8li413N44KvWVjbbxJ9omCLnPNW0CI/r8bDCFxCx
qnZmqWrmI+Rnq1fMY+G3/xT+6TiI+vxVu3jQfeFwfNtwbpswnpzuDl3VeMVZ1HSmjWCV5O80rssq
idAVNlujiFneKXmXF++alVxN4PyDZPFq4tTcTas7QT9T0kC0DIkLJgbdCE4+XIXiEPCg9sJYnlnq
3qHhbPYlsff3cV9cv3r1sL4WgoazDh7xaEkKQ5O1Z2z8Te3NgQzzMJRQ+ZwF0MDOlCTsUEwEYccX
5D4olHwqvWxUBmaEtywLQeps1gf8zR6uI+ehbx1OIyuTteUBak9hRVs0RpCteEn6++rIp7IJxxq1
7DQb8dDGUPO9Oduo5kJ6emMPHKEnWEGMrqtDgenBLiUUq70g+wlGfizfKf9UzW/jarqa7KCCA1Su
Jmjwo152qtEsCuNYCyyhqbwa/6VMzr1fkP82iN+LPUan20Cee9JUdT6ZQILFyDnjI/QgCDsdhzoN
3U67ubDnlKxmC6jaqrwg9avvvn76pUrp0YuEatc7nDVp3jXQL4yt6S1QMKIVJu7isimqjkbAqkDk
KofxdO7UY5nvKgyefCxWpOrwSKicoH6QSV1QjNm2suUAK00FwpCkpioZuVfQMF68q1kI5OUFwcdZ
80+/ehAIk016M3Y+aDYAQjVUGe0FHXssWIWwxGwAuuYkWb2nElDLyh6lfEH4cdfOp8JXy/vQazVp
XivmrHktsW6TM0o9RwC/pHiY6j6nwbTYKHUvPjTg7falLz+awvFk03G/INGiKSZ4rRyFk1C2AgbA
jAlUGJIaYW8VVOxx30AUftSVXLrT/ijRh9raZ2wq4hRhXlALkDb+Goa7AOKra8zJHENua6u1sAce
Av/RB+iyukA5XSW+JPtBbhsBaYE8jHL5qmZr6eJeL9XouwpHQys4EjhJhd2Wja2rXyBoTKmH/ml3
q0fCjnNuntEuDQN1SsYtGnSl6dxCWzuoz+ToWw1E+XJNbjvgRZs10Acq4n1Tg4IXhBOKXz85WaQs
24h0Q3mD/DNsqiTYlgLuaPIQsLyGQqFLJjn1Eu6Q7Kje4+FpV+jHMv++1jMxYquXS/FO8XZkwrJa
o+liLWhIx4YEgQGsmv2mbjiAkewwUxPfgB7Lv+Sn317iPN1gY1VeudTtdXs8VsUtTDOH9lIPJbar
86YDboFHtqaGw7eRV4yzbb4k9iHoCEB472OOUIsat3rWyGH2JgZdCEU4J803UwUFtqvOOiXyfVZ9
OFneO2FCcLef9zcXl/Ovt+vHm/bXV218dvvDfaVE17QF5dBh5gTyEZbFDupWGplKKDSegdCA/1HL
wmg0qtdD49Qmwc6HMr5/O6T6rZiLoSuQg5zidBPYVfuRTdagDbWwBUP4NdVGM2scj3PWx1Kh5slW
O3H5mrKCH+jpoZzLi/75q8ufPjWfefeZ++wVpOSS37vP3FecGGN1C0HL8GoACrR+HSoeFsrigRJJ
M2lmVzvNNNSlRK29MMP16IPYqL/eb9zF1es3d7efvf7H/WRxjedbDVa3ldcdOW116o99aQBVKfiV
AOxD3TILgveDjQ0IHIashT0UcnMAfg/27D3NHffN8FhczCwd07JqwxZmappFqX49E0SdD7MPIJpG
o8z5xIZB138Csfb69eFjrm8//+Xr1/rvo9cdTebxSttcnDbhKWn0rzmUx2bCwK4rq8Lcaxgi7nmq
JT+MSl009dRQXhD0lwdZ6jltD2rWLUzsOESnUuE+7NItXyUibqEZDZfYKuCSehqV2y/BoPn+duaR
sAOcvbr788X6+3F/yoD/M+LeQz3q/R4QUaIKnqgs+Sh1bqui8EYdkPCT0ysPXM/RvvcPyPqqjWfi
K34GHwSUmr7rOm3oblUNplS1MfjsoGn2DXbs0KBWlcCjC1ANUw4jfUjWxdUF//9318czMjT9XQXF
Qy0nLQwQits9nwnLb0kK7fVwDzzeYUIHU9PMh2k4Pw1bGR+Q9YemboVvO+Ed02rV1jsLRVar1KCA
ZkdZfBacMyvdyzqOaMDz0P4c+XBjVD5q1C/gfUvKZ8U97GXcNaueH6hMYwHDtfQuDGnT/S2RmoMk
jtUYNXW9WbWkrsm1Q9n5TB/UjvsBuuvmq3asimqbx2FwbN3DOXzpahoEGddVBZ4WBAQ6iigj0bN7
vlH0D2QQUF0M4wPC3t0R/BrPdHG8jxsd8cnreaaJyWX2CV334A4wbgsLH8iCvGbg8O1bl6d+2Yqt
ezBR/oC8b+U7vnoQPbK66gyjvkQ9CNUK1Orqp0e7NZhM75HyRjiYru62K+oCyU4xquk/9GV/ubia
139/9AY4DhN81NmeOOiDiwXpMCdQdCkartHBvAaAi3YAtAIghMMVdzIVK1gfkoXXkDU/uHVQQRGR
o20oA3umfuWlOsQqjiXwJI6kHi57copbl84td6vG9xqa94ykL77Fivv1T59fXI3LN3N9fu+Ib+9/
97ND+MoFRubDUGEN8DDm1eHA7C2AAy2HeaM/hzZPFsgzLH7UhagKYSBOnifFPhQ37tuzq2cRKs55
wK2DfD2eXXW+tit5DOoN+snWGUFWgLImjXVNBFcr0ee88f0Nyue/nCpOfHKf0oOaESnxR2Wa6hcR
NeJ3K5MgpKym7eqoodzXWJfa1VdgXlZYq6Y+67neCbwZP8ijPBII7l2harIP30mg8RVkoKIblXgT
Jy160+uBlIFfF6CxACVhLnEGDZI+IfDNvLh7LC7jzYFH6q8eNa56Jo3GVE/gFZOqdFUJJb88NKqv
Cx+oJrKA5PhVMB8W96t2ezGeXAXuQ1ln1RAJgncAHGSEovDFQ7d0Oa0SOlBzHLqODtsZWFFYHLRL
8JMPy3t3Z/P4JlgtyNRlyzkXrS6aq0b6qNNi0my8NaKaYhYgCvhIF5W9NiUPAdHVduLDAg/x+zD/
6p50PH4AqCZ0Z/bqh5buPXRCz9J9p+Z+69Fjg+mgeGNpglIKbcLyNK0p4l/fd/z6gODDA/fbsr+n
OtRVie/U0V8XZGOr8z3+Ic2S4OzFJg2DwIbUQJyjKCni11UNjqdN9sOij1JxHguNwHh1VwNtawpU
VTkO1EevHb2rvHBrCCH6gwETL0KsrVdOPqkdnXs/e/UZoTfXr66f+06NpS/4L6IqTk8pz0rIJwK7
sKqazUU1wZvu0IIJ5JY0yVsjQlkJ7vyEcX6z2uXzCow1qOf5hpBPpXdAFsHO0AxRkDhnA+oudb1G
cM26N4KQWd/4cNQ7ztMy7+8IHh9nVUgAgmECDhanCyZ5AJiBRnsl67ZQnEYnlWQ0AZLoFflDNirS
vSTy8Tli4fxgHMq2Iwpq7DhmVmoZaqtBDSmqkt9gq3lU/ixUS61bjA/bvM8EfV7aV+vu5rldXXrw
BD77qEb3Q9NREoYQQRUmaxxFzkYxv+YBuZOnI6zwPwBS7qO30OeF3pPKxzInJrBL9jpHFBOHO3G2
Q2PIt29dje5tjl2jjVhNVoEfOsUGAHfKdi/JVGXhE28LXEsa4TcJ+FGV21HMoquJ1yp86jj0vAdn
RaB2a7ow6Id2Whr51dwpkdCjcXF58axDkLarq56twQy1khG3MFlo+DCOY6vVStHYwaTxvZqVp0uR
DYtS79d9Su4DPPfkXENzO6uaESYoTxvAdT0bNV1KuucDC2vq6YAzA1zAIePQzyQNDYjtJ5Tp/kz/
0H68+P7ZTz4UgmcNmWZ31ftKU0GjgEgTc1Q6Hps9CeZF96gAWpPqMmPNw+DAE0bz3Q8XV3+7uPr+
iTcaCz9bhVtT3hrdpul7JRsHTFBv7gog1xggggxUJAYiHFGvHu43ba0flvgfv3/yng7c99055SlB
qexBrjLJLSgdvfUxEUH5E5ziCoV9zgS3ZWxxWRWUJ1zfoSn9rxYf+UR9rTqpGmRoNPvQMFJAJIQb
K4wZRF1hCtkl3yPQ04KaC1gCjKvq0ZnHieD98H7Hqmet6E2UkpjslWEM051bzyoAoCle55XUqe2F
fBevmfZ6Y582Phezf/PT3U0bd48FAZBnVRVAgLdrkCAsV4lyYBC1N66phOrsDlUt/tFLvB5S0y5V
dQLPuYDfX+3rz15fXty+Lfcb6sai+mm4Xrdrw5gcP0DXfCYA3+BKXumae+lhuthZD61A4uIr+3PH
pJvs9v367GbdXl/+uObBzPDPamOKw89KBM5VxR6xWfgt3N5DDupKPahR8oJuGz8OmW8hHNKqwwkx
7015oknqluY1CSRP3U7Dn6ApcoiQzuA1FwVMr3Z82j+UReNJQu5q9fqcDL5hXd33KPlcLW2vbzUH
91H9piZBqoPf/YRNMVFVwCU2ji+aUOKqqmnOB8I2NlAY1AxrVGqr1TPoS4J/x1ld3/zj6wdfyzFp
SGEBCWuog9ROLTbAET7hl/EqvYAq8y6aYwi/GgvOaopaeqP28yWhItvQxatfX483r9bx5EJwcIOl
sXwDLN0T+ZroB6zQ7ZWm3+RQNP8xNABqBogE1QXC8sACLcQXJV/PN8fpofNQmxR3AqDCcDpcGIhq
xH6RJs0iDLH30Hob5U3V80oJlPFwT/icsREU3l7j/hZQLpu4Wzef/vG3X35299P97vbqQaC4/jII
f0qG8aDFpCFYarcAu7I2xFRVYx4NkBwN0xkIAgBKPlbmZ3d3+6C71R7a6mxVsqq9jGo3srUOimoK
TJ/fyQ0/2dQHSfm5liDpgHTotfH2I+R9ff369cXV7adfrXnx5tU7wfyPibvYtdebMKRfbd6V0Bkd
yzCYuHVLC6oVZMDRWzV8MF254nua+DMEH20vGMKEUvG54lq4bA4uENSbktJFMvLBH8ntAE41VaiL
4K2o/sfx/ViWE1JfvZtN+5+311f3VqoIM53GCWtExgRm962SFBVkJKAF34abG0oza6NJs6teYIye
MPM6KfPLi6HOdcol/LL1T3/5WjD5U/eZeffFmusrVKhhM+rUo1E6INc4cA9d43mLVXX8UkWthXgd
iEKAFuDS/fTm50j/wx+/+/0Xv3knGUvF7xl1bZ6Ai5gNW1yBb2kQwXJLajkKjJzQEJXAd69eg1Hj
GNRRYn6c5IO1fjpe4TU+/eKPX/+/v//Dvx0+m5hVikiXJmJ3ZfQGMDFcLsSl2ZsJFCSmGYxyzNVp
UXV/SkSBnbT6c4S/euuxPv2Sr//Dt//cAJtyX90nDRvrGj8ODBgJqw5RfUsIoiFBUIAoB0RWti7v
7FTjlZR982et4eEZsM8EMTkOPSMeavvxycEaXTX5NUS/S9BdV9ZkbRVkOrUmikUdgqI7uYTDDeJn
F+Pq9nAf5JQsitcXkN6D7a9bRxpV4EukiECtAtwmVoUa1eXczxkwdeV/5eeP+76mFijUrr4/rlOE
w4sORV23K2HHdQ92BMWpcyuhQTMJUoiHxJdUQfjZzMPYclwp5nhS1lEvrifFZ4W4rVxb9XXSUJAW
MSbQs19eg4eAuUoHsMQHr241vqSQIGQYQlWTynxCLjCM80TocXaYxwXC0qFe02ZdmgSNVYtDxROE
1XpI0MQdEnPhE/wLCJSH/Jo24DPptDihvoftIPoweLk21QYp6OmO8AKQtmNvJQfp2QhGVNWKtGv6
IRid4I+b6kv9eU6I+931q/X2Wu+4/5H3OalaSkMaeqoW76gWmwQfCPVWFd1aW9Vj0/RKjErAJY5Z
aTsA0hfkPZqQZfQcoHx9uNZcduu9XQX6IHVNrVQdcFcb2KarPIIwSMOoIZ+GPTYc6AvSvluvXl8+
uOFe8DnTCKUawt6E/qIKPNSJxHd+MLGlNKI3mEnhdOh9C/JJKBxNxOwFgQc2cnOco2KbLuf1NpmI
2dEVazWXSi3SRtDQMRj1mMp/qq5FYQwYbSLw1+GNPyEO5H6fpX7c1avpKQciI26VYDrAXtUJbbYV
+mqC1xvVgawk1XXsSowx4KKa4A79Y6Q96qsZSkPXOXfr1VZH95bqHw66tEQ1N9UtX4fmR1frbaNx
YFVJKBXEnbI5IfLQkvf3X39xhOnh2xBRO40eMXWBkwqIIeK2g695G0gOKjJVKq1KnQwULY5Ig2PA
/NcJYY9uR4/hvDQFEMA5uUMrsGrUom0rSOttNskKGru34S9Bfd2jGnpjPsFb+6LMb9fdm9fH5qdO
LhAjvhUM6HZbQe9uYan38AFo6ypGHWZrxKMjywWNe7SqFsr+JXHH97BHH6maaJxWhSwpBRFTUF09
BEq9azGCQ43T1kAXNhLH57xKwbMGEvU2xktSj93nwi0VjfVu5tADVnd/VaP3nKzOV/VSIWQAY2sr
anymBlbAsOT5t/uUP3u28BLPoWpCx1/E0gWo4rv09gQfIETEacRCTZYRwG+t7CZ42V6Bm6d2Qt67
y6S3l4RHdjjh96KVoU/1aVia4XFoVVD1DlSLV0mOLgm7JnzlkoZwra15+YAJn5L5uKmGKXinnXe1
ENett8+mdlO9KZ/XRY2Qz/hNJUysMNUxTINuupl56KnavyzruSDIRxFU4XwapakOsUQdz9elsJVo
ZpRRUUrVG3mamjnX1NoWNXVqDWntCamPb8qO3kYcBzl3dK00wSRj1AGIyMiHAlDrMOCcYnrRAMVI
NFlxmeThm7p69utFoQ8e0mI5zG0NytL0bCpfZHUvRWyClR1SD3MwRckiGqq4DGG+61UtavLeCVnv
LuSOhC1i64BValCCaqPjluMqUIKgfK/eceNb7a8Crm4IGoe2Dh2Y1uLzTgm7fvD8r5EYUWV9brKV
SY0UUUgX9IrXp+JgDupaEIT/0OKC3+ErUTAXZ3z2ZvUecP6kTODXN9f/+fnr+z44n73uP+kf73N5
nAtO877VI0rNd6z6w6XMieWtESlifqpYHzI+NUDWF5rWF4DAjF8g9H9L8i/eZQj99faHpsGJ/6cS
hX5xO65fL/243/x0casOOp/crHb56St5r0++auOT+3Ty//bJpaLSJ9f3yaFrfjLXj+vy+rUuRT45
ZBj9P59cXd99AsXVSvkDN+tytdv1yf940PnyrdT5t0NcS5/Ft79x0MO/tntUdvSVyqjUNgF2p1FT
ehuJQGs2XWIWlUwL9IKRlKaW8Gjsh/L4awVWGe/e/vh3evDL168v1yff6pef/Hg/6faT9Jn/zH/y
fx3+zCXY/tPDb3xm+c1x+DUuzPBL/jL2//7/rr5rN9+vu//+Sbt5lcKnTT/x04NK/MT3mF/8l//9
X/5/jY4FuQ==
````

### .build/quantization-research/practical-app-activation-v3/receipt.json

Original bytes: 5438. SHA-256: `1de985ce29b94f5675fd2d76c5e32a862720af08fbf7a461f669fb2cf00c14e8`.

Normalized bytes: 5424. SHA-256: `3fef250cb35a90fcb5a807c27a8ecea17eeb1a39421245380f6c96738c7122f6`.

````text
{
  "kind": "existing-practical-acceptance-v1",
  "case": "app-activation",
  "command": [
    "<HOME>/Projects/slotstream/.build/quantization-research/frozen-practical-mac-v1/sevra-mac-checks",
    "--activation-real",
    "--home",
    "<HOME>/Projects/slotstream/.build/quantization-research/practical-app-activation-v3/home"
  ],
  "complete": false,
  "timing_qualification": false,
  "driver_sha256": "4a7e01c70f4fcb711f24001c675e9e8c8b39b271f1c73e95cf09268703fe5a52",
  "binary_sha256": "5b6c4b74863d326f81060d72cc27b1184ff935182e834a2b2df141b2898ab17b",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "required_preflight_bytes": 16000000000,
  "maximum_process_bytes": 13000000000,
  "maximum_seconds": 900,
  "minimum_live_headroom_bytes": 3000000000,
  "maximum_staging_bytes": 430000000000,
  "samples": 44,
  "peak_process_bytes": 5776102056,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34083799040,
    "swapins": 34112,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   324246.\nPages active:                                 748738.\nPages inactive:                              1590518.\nPages speculative:                             32117.\nPages throttled:                                   0.\nPages wired down:                             214386.\nPages purgeable:                               12102.\n\"Translation faults\":                     3962261253.\nPages copy-on-write:                       336116898.\nPages zero filled:                       18610127734.\nPages reactivated:                         601523104.\nPages purged:                               17357535.\nFile-backed pages:                           1743962.\nAnonymous pages:                              627411.\nPages stored in compressor:                   545181.\nPages occupied by compressor:                 174709.\nDecompressions:                            160545360.\nCompressions:                              185044520.\nPageins:                                  5893781277.\nPageouts:                                    2729724.\nSwapins:                                       34112.\nSwapouts:                                     156707.\nPages tagged:                                 133561.\nPages tagged resident:                         95417.\nPages tagged compressed:                       38144.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6069.\nPages tag-storage free:                         1134.\nPages tag-storage non-tag pageable:            91093.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5677888.\nTagged compressions:                         1686019.\nTagged decompressions:                       1520024.\n"
  },
  "contention_before": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 98.4
      }
    ],
    "known_jobs": []
  },
  "staging_before": 415618961408,
  "pid": 28906,
  "exit_code": 1,
  "failure": "RuntimeError: check returned a failing status",
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34057601024,
    "swapins": 34112,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   361699.\nPages active:                                 726463.\nPages inactive:                              1591382.\nPages speculative:                             14585.\nPages throttled:                                   0.\nPages wired down:                             215454.\nPages purgeable:                                6196.\n\"Translation faults\":                     3962669921.\nPages copy-on-write:                       336135457.\nPages zero filled:                       18610847631.\nPages reactivated:                         601549727.\nPages purged:                               17370071.\nFile-backed pages:                           1710816.\nAnonymous pages:                              621614.\nPages stored in compressor:                   545145.\nPages occupied by compressor:                 174688.\nDecompressions:                            160545396.\nCompressions:                              185044520.\nPageins:                                  5900163418.\nPageouts:                                    2729765.\nSwapins:                                       34112.\nSwapouts:                                     156707.\nPages tagged:                                 133673.\nPages tagged resident:                         95529.\nPages tagged compressed:                       38144.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6069.\nPages tag-storage free:                          997.\nPages tag-storage non-tag pageable:            91230.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5677888.\nTagged compressions:                         1686019.\nTagged decompressions:                       1520024.\n"
  },
  "seconds": 11.721246500000001,
  "staging_after": 415618969600,
  "contention_after": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 98.6
      }
    ],
    "known_jobs": []
  }
}

````

### .build/quantization-research/practical-app-activation-v3/stdout.txt

Original bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

Normalized bytes: 0. SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

### .build/quantization-research/practical-app-activation-v3/stderr.txt

Original bytes: 516. SHA-256: `565bebd95177e95efd35e60dab3b50ac1a665b3ab434a5445e99350957e092d4`.

Normalized bytes: 516. SHA-256: `565bebd95177e95efd35e60dab3b50ac1a665b3ab434a5445e99350957e092d4`.

````text
[expert-lookahead] corrected attention forecast: measured correction 37b00d3a32d1e188 at lookahead/tap-correction-attention-rank128-v1.safetensors
engine ready in 0.8s: expert cache ~17/512 per layer (821 global slots = 2.3 GB), eos [248044, 248046]
elastic: on — cache auto-resizes with memory availability between requests (--no-elastic to pin)
CHECK FAILED: default execution exposes an Engine-observed complete configuration after healthy activation; run this acceptance check without runtime tuning overrides

````

### .build/quantization-research/practical-app-activation-v4/receipt.json

Original bytes: 5501. SHA-256: `fe3fb134249825d08c5f1f426e052b7e2de0d22b13c13249445cfc04571a19bd`.

Normalized bytes: 5487. SHA-256: `b2bdc13ed1d27c9185756f3e3342cdbf7f5125d3440e693d94b56c5cff86b67d`.

````text
{
  "kind": "existing-practical-acceptance-v1",
  "case": "app-activation",
  "command": [
    "<HOME>/Projects/slotstream/.build/quantization-research/frozen-practical-mac-v2/sevra-mac-checks",
    "--activation-real",
    "--home",
    "<HOME>/Projects/slotstream/.build/quantization-research/practical-app-activation-v4/home"
  ],
  "complete": true,
  "timing_qualification": false,
  "driver_sha256": "4a609a928ab5dd948f779401222d0f97e9bba1126a460865dc53b8335e2179ba",
  "binary_sha256": "5eabc8cc5d662a9292bb42d0dcb8164da75ecb473afb301e232b208040e82823",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "required_preflight_bytes": 16000000000,
  "maximum_process_bytes": 13000000000,
  "maximum_seconds": 900,
  "minimum_live_headroom_bytes": 3000000000,
  "maximum_staging_bytes": 430000000000,
  "samples": 179,
  "peak_process_bytes": 5816603376,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33860222976,
    "swapins": 34112,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   220505.\nPages active:                                 780897.\nPages inactive:                              1650365.\nPages speculative:                             55582.\nPages throttled:                                   0.\nPages wired down:                             205912.\nPages purgeable:                                9769.\n\"Translation faults\":                     3965549362.\nPages copy-on-write:                       336450887.\nPages zero filled:                       18621422789.\nPages reactivated:                         601552337.\nPages purged:                               17374377.\nFile-backed pages:                           1836390.\nAnonymous pages:                              650454.\nPages stored in compressor:                   536577.\nPages occupied by compressor:                 171791.\nDecompressions:                            160553706.\nCompressions:                              185044520.\nPageins:                                  5900235316.\nPageouts:                                    2729765.\nSwapins:                                       34112.\nSwapouts:                                     156707.\nPages tagged:                                 137830.\nPages tagged resident:                        100573.\nPages tagged compressed:                       37257.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6069.\nPages tag-storage free:                          496.\nPages tag-storage non-tag pageable:            91731.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5502656.\nTagged compressions:                         1686019.\nTagged decompressions:                       1520911.\n"
  },
  "contention_before": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 99.8
      }
    ],
    "known_jobs": []
  },
  "staging_before": 415914541056,
  "pid": 32304,
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33768980480,
    "swapins": 34116,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   319890.\nPages active:                                 760667.\nPages inactive:                              1600872.\nPages speculative:                             25877.\nPages throttled:                                   0.\nPages wired down:                             207125.\nPages purgeable:                                2327.\n\"Translation faults\":                     3968140352.\nPages copy-on-write:                       336530220.\nPages zero filled:                       18624957926.\nPages reactivated:                         601568296.\nPages purged:                               17401478.\nFile-backed pages:                           1738878.\nAnonymous pages:                              648538.\nPages stored in compressor:                   534049.\nPages occupied by compressor:                 170867.\nDecompressions:                            160556227.\nCompressions:                              185044520.\nPageins:                                  5919673464.\nPageouts:                                    2730076.\nSwapins:                                       34116.\nSwapouts:                                     156707.\nPages tagged:                                 134574.\nPages tagged resident:                         97370.\nPages tagged compressed:                       37204.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6069.\nPages tag-storage free:                          271.\nPages tag-storage non-tag pageable:            91956.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5491520.\nTagged compressions:                         1686019.\nTagged decompressions:                       1520964.\n"
  },
  "seconds": 47.67473,
  "staging_after": 415914561536,
  "contention_after": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 100.0
      },
      {
        "pid": 1049,
        "cpu_percent": 167.6
      },
      {
        "pid": 26842,
        "cpu_percent": 65.0
      }
    ],
    "known_jobs": []
  }
}

````

### .build/quantization-research/practical-app-activation-v4/stdout.txt

Original bytes: 212. SHA-256: `596778ab6f02928b4c46a8f59a61d3952859330eeeff6bc37cdd678ef4ca463c`.

Normalized bytes: 212. SHA-256: `596778ab6f02928b4c46a8f59a61d3952859330eeeff6bc37cdd678ef4ca463c`.

````text
PASS: real bounded health, durable activation, partial-load failure, sequential rollback, blocked failed-selection work, explicit retry, new-owner recovery, cancellation during commit and preserved-record repair

````

### .build/quantization-research/practical-app-activation-v4/stderr.txt

Original bytes: 1668. SHA-256: `85392e899081a72852dbdb28c1e9c9f2977cce3bdcabfbf85259268b343359ed`.

Normalized bytes: 1668. SHA-256: `85392e899081a72852dbdb28c1e9c9f2977cce3bdcabfbf85259268b343359ed`.

````text
[expert-lookahead] corrected attention forecast: measured correction 37b00d3a32d1e188 at lookahead/tap-correction-attention-rank128-v1.safetensors
engine ready in 0.8s: expert cache ~17/512 per layer (821 global slots = 2.3 GB), eos [248044, 248046]
elastic: on — cache auto-resizes with memory availability between requests (--no-elastic to pin)
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
[expert-lookahead] corrected attention forecast: measured correction 37b00d3a32d1e188 at lookahead/tap-correction-attention-rank128-v1.safetensors
engine ready in 0.7s: expert cache ~17/512 per layer (821 global slots = 2.3 GB), eos [248044, 248046]
elastic: on — cache auto-resizes with memory availability between requests (--no-elastic to pin)
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
elastic: fixed cache capacity; pressure cancellation and admission checks remain active
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
elastic: fixed cache capacity; pressure cancellation and admission checks remain active
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
elastic: fixed cache capacity; pressure cancellation and admission checks remain active
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
elastic: fixed cache capacity; pressure cancellation and admission checks remain active

````

### .build/quantization-research/practical-app-performance-v4/receipt.json

Original bytes: 5507. SHA-256: `8934964b14002c9cd56606547e227ddcb9f990b11c1818eb127591fb9df8d8e1`.

Normalized bytes: 5493. SHA-256: `d8df7d621883cd25d6c92da3a432ab3a8849ae91bbbe142cbdee379928bebe5c`.

````text
{
  "kind": "existing-practical-acceptance-v1",
  "case": "app-performance",
  "command": [
    "<HOME>/Projects/slotstream/.build/quantization-research/frozen-practical-mac-v2/sevra-mac-checks",
    "--performance-real",
    "--home",
    "<HOME>/Projects/slotstream/.build/quantization-research/practical-app-performance-v4/home"
  ],
  "complete": true,
  "timing_qualification": false,
  "driver_sha256": "4a609a928ab5dd948f779401222d0f97e9bba1126a460865dc53b8335e2179ba",
  "binary_sha256": "5eabc8cc5d662a9292bb42d0dcb8164da75ecb473afb301e232b208040e82823",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "required_preflight_bytes": 16000000000,
  "maximum_process_bytes": 13000000000,
  "maximum_seconds": 900,
  "minimum_live_headroom_bytes": 3000000000,
  "maximum_staging_bytes": 430000000000,
  "samples": 121,
  "peak_process_bytes": 6624908304,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33708277760,
    "swapins": 34116,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   271097.\nPages active:                                 766845.\nPages inactive:                              1631313.\nPages speculative:                             40571.\nPages throttled:                                   0.\nPages wired down:                             204661.\nPages purgeable:                                4120.\n\"Translation faults\":                     3968323016.\nPages copy-on-write:                       336548874.\nPages zero filled:                       18626133195.\nPages reactivated:                         601568428.\nPages purged:                               17401478.\nFile-backed pages:                           1782173.\nAnonymous pages:                              656556.\nPages stored in compressor:                   533904.\nPages occupied by compressor:                 170804.\nDecompressions:                            160556372.\nCompressions:                              185044520.\nPageins:                                  5919687710.\nPageouts:                                    2730076.\nSwapins:                                       34116.\nSwapouts:                                     156707.\nPages tagged:                                 134352.\nPages tagged resident:                         97150.\nPages tagged compressed:                       37202.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6069.\nPages tag-storage free:                          202.\nPages tag-storage non-tag pageable:            92025.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5491136.\nTagged compressions:                         1686019.\nTagged decompressions:                       1520966.\n"
  },
  "contention_before": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 100.0
      },
      {
        "pid": 1049,
        "cpu_percent": 97.2
      }
    ],
    "known_jobs": []
  },
  "staging_before": 415914573824,
  "pid": 33063,
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36092919808,
    "swapins": 34116,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   356232.\nPages active:                                1139449.\nPages inactive:                              1077421.\nPages speculative:                             60796.\nPages throttled:                                   0.\nPages wired down:                             210501.\nPages purgeable:                                 578.\n\"Translation faults\":                     3969223005.\nPages copy-on-write:                       336593886.\nPages zero filled:                       18627817116.\nPages reactivated:                         602375014.\nPages purged:                               17408023.\nFile-backed pages:                           1846127.\nAnonymous pages:                              431539.\nPages stored in compressor:                   668047.\nPages occupied by compressor:                 240247.\nDecompressions:                            160745636.\nCompressions:                              185381274.\nPageins:                                  5926966807.\nPageouts:                                    2730420.\nSwapins:                                       34116.\nSwapouts:                                     156707.\nPages tagged:                                 130134.\nPages tagged resident:                         91930.\nPages tagged compressed:                       38204.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6040.\nPages tag-storage free:                          766.\nPages tag-storage non-tag pageable:            91490.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5601920.\nTagged compressions:                         1687744.\nTagged decompressions:                       1521050.\n"
  },
  "seconds": 32.095663208,
  "staging_after": 415914684416,
  "contention_after": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 100.0
      },
      {
        "pid": 1049,
        "cpu_percent": 73.1
      }
    ],
    "known_jobs": []
  }
}

````

### .build/quantization-research/practical-app-performance-v4/stdout.txt

Original bytes: 685. SHA-256: `ef7e2e4069429b7907bd7f6b7c7d2b0ee4fd287604db3410dc7d198973280831`.

Normalized bytes: 685. SHA-256: `ef7e2e4069429b7907bd7f6b7c7d2b0ee4fd287604db3410dc7d198973280831`.

````text
REAL_TURN cold seconds=13.47415500000352 status=completed
REAL_TURN warm-change seconds=9.503972083330154 status=completed
REAL_TURN reloaded seconds=7.693242374982219 status=completed
REAL_MEMORY peak_sampled_gb=6.624826384 released_gb=0.637241456 maximum_metadata_seconds=0.0034918750170618296
GLOBAL_VM before=Optional(Slotstream.ProcessMemory.VMActivity(swapins: 34116, swapouts: 156707, reclaimableBytes: 34314928128)) after=Optional(Slotstream.ProcessMemory.VMActivity(swapins: 34116, swapouts: 156707, reclaimableBytes: 36522065920))
PASS: real lazy load, warm follow-up, deferred custom change, drained release/reload, lower ceiling, automatic idle release and preserved draft

````

### .build/quantization-research/practical-app-performance-v4/stderr.txt

Original bytes: 540. SHA-256: `e261cd2ba9ef21042889ecedd4cb4c405c90080c36ecf6d9ec693af14c7fdc07`.

Normalized bytes: 540. SHA-256: `e261cd2ba9ef21042889ecedd4cb4c405c90080c36ecf6d9ec693af14c7fdc07`.

````text
[expert-lookahead] corrected attention forecast: measured correction 37b00d3a32d1e188 at lookahead/tap-correction-attention-rank128-v1.safetensors
engine ready in 0.8s: expert cache ~17/512 per layer (821 global slots = 2.3 GB), eos [248044, 248046]
elastic: on — cache auto-resizes with memory availability between requests (--no-elastic to pin)
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
elastic: fixed cache capacity; pressure cancellation and admission checks remain active

````

### .build/quantization-research/practical-app-activation-v4/home/state.json

Original bytes: 1082. SHA-256: `d4564c84b42bc7322eeb5c94c3069926ceba22de248b2545542ded9b668e572c`.

Normalized bytes: 1082. SHA-256: `d4564c84b42bc7322eeb5c94c3069926ceba22de248b2545542ded9b668e572c`.

````text
{"attempt":{"id":"B8C7E205-4C28-4CEF-96F0-3E265E52E33E","phase":"committed","selection":{"manifest":"8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082","packID":"qwen3.8-flash-next:4bit","preferences":{"budget":"custom","customGB":9,"hasCustomLimit":true,"liveMemory":"fixed","quantization":{"automatic":{}},"readiness":"automatic"},"startupPolicyID":"original-desktop-startup-v1","startupRecipeIdentity":"85bf53207e62ea89d8e527c4c381f792c0cd525ba90b9dcb8ada00146a144278"}},"lastGood":{"arithmeticIdentity":"7ff4b5b53fdbf734c4ddb632879680d51460415c71a1dea3a1f7103e8a6a7ae4","generation":"E54F3D4C-023B-4600-A420-A265EE3FC620","healthTokens":4,"selection":{"manifest":"8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082","packID":"qwen3.8-flash-next:4bit","preferences":{"budget":"custom","customGB":9,"hasCustomLimit":true,"liveMemory":"fixed","quantization":{"automatic":{}},"readiness":"automatic"},"startupPolicyID":"original-desktop-startup-v1","startupRecipeIdentity":"85bf53207e62ea89d8e527c4c381f792c0cd525ba90b9dcb8ada00146a144278"}},"schema":1}
````

### .build/quantization-research/practical-app-activation-v4/home/healthy-before-repair-fixture.json

Original bytes: 1664. SHA-256: `38e840ec320ca61a177ff1bf24b33ec83ee14fed9ac8ca10a279a4030bed83d3`.

Normalized bytes: 1664. SHA-256: `38e840ec320ca61a177ff1bf24b33ec83ee14fed9ac8ca10a279a4030bed83d3`.

````text
{"attempt":{"id":"E9933748-5477-4581-B341-4A85B504942B","phase":"committed","previous":{"arithmeticIdentity":"1b9d58715f5135bd8496e5933b71d5b4061380eb647e4e12765fb65e77fb1a08","generation":"B745828B-6EC7-4D92-B7E5-A47F70EB4ABA","healthTokens":4,"selection":{"manifest":"8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082","packID":"qwen3.8-flash-next:4bit","preferences":{"budget":"custom","customGB":9,"hasCustomLimit":true,"liveMemory":"fixed","quantization":{"automatic":{}},"readiness":"automatic"},"startupPolicyID":"original-desktop-startup-v1","startupRecipeIdentity":"85bf53207e62ea89d8e527c4c381f792c0cd525ba90b9dcb8ada00146a144278"}},"selection":{"manifest":"8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082","packID":"qwen3.8-flash-next:4bit","preferences":{"budget":"custom","customGB":9,"hasCustomLimit":true,"liveMemory":"fixed","quantization":{"automatic":{}},"readiness":"automatic"},"startupPolicyID":"original-desktop-startup-v1","startupRecipeIdentity":"85bf53207e62ea89d8e527c4c381f792c0cd525ba90b9dcb8ada00146a144278"}},"lastGood":{"arithmeticIdentity":"1522a9f2a1a3953baa84f79e6195cc2495e8bf256e2247d949294cef9788915a","generation":"5971CA35-64BE-4138-BA65-190A4404DBC8","healthTokens":4,"selection":{"manifest":"8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082","packID":"qwen3.8-flash-next:4bit","preferences":{"budget":"custom","customGB":9,"hasCustomLimit":true,"liveMemory":"fixed","quantization":{"automatic":{}},"readiness":"automatic"},"startupPolicyID":"original-desktop-startup-v1","startupRecipeIdentity":"85bf53207e62ea89d8e527c4c381f792c0cd525ba90b9dcb8ada00146a144278"}},"schema":1}
````
