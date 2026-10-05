---
type: "run"
created: "2026-10-05T16:26:52.168654+00:00"
updated: "2026-10-05T16:26:52.168654+00:00"
title: "Native affine shared-loader preparation and focused quality launch"
summary: "Internal native loader and planning checks pass; unchanged 25-case quality comparison starts without promotion or speed claims"
tool: "make; slotstream-checks; slotstream quantization-session; Python frozen pilot owner; gh run view"
command: "make build SLOTSTREAM_BUILD_JOBS=2; checks and plan-only command arrays below; python3 .build/quantization-research/run-practical-quality-v1.py"
binary: "Frozen practical-v7 release build, identity below"
machines: "[[records/machines/macbook-pro-m5-pro-48gb]]"
captured_at: "2026-10-05"
discarded: false
---

The exact standalone bundle now has an internal descriptor and uses the shared maintained-pack Engine loader for the native arithmetic trial. The deployed expert kernels, normal bounded sweep and allocator cache are reused, with checked small-row verification. Separate resource and arithmetic identities preserve the unchanged reference path and prevent borrowing its quality evidence. The internal recipe includes two streamed drafts, explicitly priced uncorrected lookahead and the existing short-prompt policy. It is absent from the supported registry, public downloads and Auto.

Five native catalogue groups pass across allocation, startup, performance protocol and session framing. A missing standalone trust anchor is refused before allocation; the explicit native plan-only path succeeds without loading. An initially mistyped catalogue filter selected no group and was corrected to quantization-session-framing. Fifteen Python campaign tests pass. The complete prior Engine and Mac CI workflows at 7624ad0 are retained below and do not qualify the new source.

A focused fresh comparison uses all 25 previously selected pilot tasks, unchanged, in both original and native three-bit arms. It reuses the existing isolated graders and owner with explicit native standalone selection, bounded sessions, actual headroom and physical process supervision. The existing authenticated Python 3.12 worker resolves a grader ABI mismatch detected during preflight; synthetic strict-pass and strict-fail outcomes pass before launch. This is a descriptive product check with fifty new outcomes, not the deferred broad statistical study, a final noninferiority verdict or speed qualification. Results are pending at capture.

### frozen-practical-v7/build-identity.json

SHA-256: `779367311eb7ab55f7c3e903311c570f85928bf27090163d02a428e7a999986b`.

```json
{
  "source": {
    "Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
    "Makefile": "692cb361f9920d914aa394e6be98a05517e25df25556d5aa2f8da1976ee7874a",
    "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
    "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/AffineEngineSource.swift": "08d64035601248ea89cc5790e87355b37c0feedf9a8ab21717f8984686e98c99",
    "Sources/Slotstream/AffineExpertControl.swift": "a70199a9f3a9d5af5523bc6a4a8902b2b39dd35a18b9aff6701c3c29de071935",
    "Sources/Slotstream/AffineGroupedExperts.swift": "21e3ac35472acc1594bab80740d052e3fe5a7caf304241796a64fc7018c3d27c",
    "Sources/Slotstream/AffineStandalonePack.swift": "5c67a9292f6f3d592f5ace66791616b956637c3ea278502d39c44ab6491c03e8",
    "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
    "Sources/Slotstream/AppliedModelConfiguration.swift": "a0a5297212e7a8b56afb7950deae3903a630ab65d4c34a4440dface298683419",
    "Sources/Slotstream/AuthenticatedTensorBatch.swift": "ea1b8097b5ce039aa20a02dce2ebc4f2fe55815f2638c5643da89b52057c8955",
    "Sources/Slotstream/AutomaticPackPolicy.swift": "62d9b2252e4442f7fb4c5a9ca0125d154de6553b61e5dcd1f97aa21e82a74e0e",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
    "Sources/Slotstream/Checkpoint.swift": "6b6043661fb48751e49f96597f1442052923682fbfe9507ecd913e5e5c31c495",
    "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
    "Sources/Slotstream/ContextFeasibility.swift": "f9319a59fec5e875b2416e27440174200342da42e5150582cf40d30b2bb27e32",
    "Sources/Slotstream/ContextMemory.swift": "2b2c4233fd3770289556b562ce180d9f42f3a4e445ed7117a76dfefb16b6393a",
    "Sources/Slotstream/ContextWindowPolicy.swift": "df326f847e5bc7b0ccb89cf3e7c4db66fe8581b946e10050581d76ffbb1fc0e6",
    "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
    "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "403d6b86ac897100ac533ff61fa5eb1bc314767abeb16f8784ff5d00ae14c631",
    "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
    "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
    "Sources/Slotstream/ExpertPrefetch.swift": "200801ecafba69c4842a9c59aae3cbb6145554170bf60f0cdf44df0195886638",
    "Sources/Slotstream/ExpertStore.swift": "26fa3bf01cd5921132dde876423127f939f683d8a680bedab2354dd62b809162",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
    "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
    "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
    "Sources/Slotstream/Generate.swift": "97203686b8b20bd33c68536dde461495a87affb65ca8cb471eef27d713a717ab",
    "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
    "Sources/Slotstream/Governor.swift": "3c688805a59042e8612957b4107ee49df13ef2feb002ba52a292462c4332f5a1",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "f701352a87f480b024bbac9f65b1ae294cbe494b2f28dd3923b9f8859188d92e",
    "Sources/Slotstream/MTP.swift": "cf6b2b83e9e04426f4c7923cc1984d3749fd17f1fb0b26f882d746ca755f0c90",
    "Sources/Slotstream/MTPExpertStream.swift": "625adebb5f5a741f4ba6df2aadb77dce0d78454816a98ffbcf979ea7a2633493",
    "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "afa56af0c81c761e91fe70de2116fdad8fb8adfc15144b1d8fea51cf34cd2ece",
    "Sources/Slotstream/ModelPackLoadedSelection.swift": "997d1959f34db216f066945521489a283cb32d94efb287c641b0c3901bcc54f3",
    "Sources/Slotstream/ModelPackPlanning.swift": "397428e8d5d178365e13a1c41fc054ccddf2a419e41235c6faecac29d4e67203",
    "Sources/Slotstream/ModelPackRegistry.swift": "3ca81ec67f6234424a1f250f1f9ab2a9c288fe0c68cd0c122f8bf5bc6676e3ae",
    "Sources/Slotstream/ModelPackStartupDefaults.swift": "508d8e6d8a5c362067eb27810a133b7a3c32f02dc4d56a281f4efbadb7a9bd20",
    "Sources/Slotstream/ModelPackStartupSelection.swift": "77e706ccb5d23abd3bc2bc8fa7b214079de36f287eaf5f5642ad31d7e1ab6bcc",
    "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
    "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
    "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
    "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
    "Sources/Slotstream/PackMemoryProfile.swift": "9664fb3f9fc8d6c15e739d336addfa7762198c4b1bd811e94edca01ebb0a86a2",
    "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
    "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
    "Sources/Slotstream/PersistentPrefixFormat.swift": "5f452e1181230d682442302afb8f3a18df008abf1720682fe038e41fe2f3577a",
    "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
    "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
    "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
    "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
    "Sources/Slotstream/PinnedAffineStandalone.swift": "e1d8bdc7e3f3fd506a80f114a5c8cb6b79721b23a3983baca695deefdd32fb29",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "c556538b4e701e93d604611ec445f8efd45287f11adc0131053778f363b456a0",
    "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
    "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
    "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
    "Sources/Slotstream/RequestControl.swift": "0ca2b018337e329285cda3ae90e81696823f50ec44f968e5986d2d26062363e9",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
    "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "879d0f17f7c6e81a2d14babe3f2b49030b478db31ed0aa424bcea993cd7b7c09",
    "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "e558ae55a5e4f7564833dad78075ec6a53a9aa9811df51c2e98bc7de2fb23118",
    "Sources/Slotstream/SlotpackManifest.swift": "20f7f07fd6de4ee83dfdeed6e5c4d0679b82358368fd55b7139b8fbfe62eff4f",
    "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
    "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
    "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
    "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
    "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
    "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
    "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
    "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
    "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
    "Sources/Slotstream/VQDraftWeights.swift": "bb67155fe74609f67df1e5da3f4a06a5e9a4abc2bce6ff03e6e65540ad526e46",
    "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
    "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
    "Sources/Slotstream/VQGenerationProbe.swift": "ae7bd4f10c8a71daa548d73298d74485d8f54de45ed0ff78e21194bdbe49fbf5",
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "049e193a2534d526810a91614835a4ad6bc538d42ffa0db864d9c8fcc4161023",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillRecords.swift": "868231f09718a46b24ee1b596418524ad3ea064b3365d21ae1b348d003092e4a",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "bffd65a4a1ce6ee46d96fd85f5f3176dc33cedf459d4534e93b6ccc3e3e57118",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryCoefficients.swift": "8aeda16d1f6f79296cd872dbb49eebff9dcef4ba6f8f4462acc5c001f62ce63f",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "356912fdc283dbd1de1ce40da4c388ca89a57584900de68d7fca06f67d1e9e09",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "6375ebfb23b05b7286c9d22b78fa8051dd85c5d6f160a52c6dcbb98a165bb2be",
    "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
    "Sources/Slotstream/Version.swift": "ba915652d538a22a4e84fcf81bb8ffac646bede25303898faa6f2aaf8aa33542",
    "Sources/Slotstream/Vision.swift": "dd71478eef37af69fbb8bd7e4c3e4713fdfcaf31730846dbde0d2fe96ff7bb84",
    "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
    "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
    "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
    "Sources/Slotstream/WeightStore.swift": "794a2ce1b685a758386728ee76b2d8e926b5d769c7271f443c2ece258a144229",
    "Sources/Slotstream/Weights.swift": "7be84b0827425c7406f8b0d843ec7ac8a245c8f7f0417cd857b061bf836eb19a",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineContext.swift": "68c3fabcfaee92673cfe9bfed729ae2386d5eeb18bcbc1bf44e7fd54387c764e",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineEngine.swift": "f24901073df626d74c5b01c8a7d4c7dee70509ebac236a2bdc1b8be187149b79",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineExpertControl.swift": "3d5da21bd1333ecc7ffca7ab18b6d9cc64a220cfc3cf2776565e857276c9eaa1",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineGeneration.swift": "027efb4c7b255c5288a07cf05a48c8c893f10f8f82024e00cd0db71a2095d5eb",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineGroupedExperts.swift": "035331b18788a4001f0ec58533d7f64155d613b52fa4a910a87e007be03553d1",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineSpeculation.swift": "6e3cf86253c894f8f19ec358d01811673c643150a65dd8796ea80a7486214325",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineStandalone.swift": "5ec8d18e0b0e6028019010d29dd79654a1908d863aa520eb37e5274191a511fe",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineVision.swift": "5c995eed5848d20d7b3ea7521618250fefd4e3adf7806f9f04c9b6bf408ecae4",
    "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+AutomaticPackPolicy.swift": "a99e4075ab05efac3e343a3e2f2375f00331d5e84a9030b098282745203b6c52",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
    "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift": "00ca131f6484b45c96cb1bc0d00f6a94d08b4cc09edc609f95fb5ba8bcb3fbbf",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupDefaults.swift": "5cb7e7b857dd4bdb09b3a665e47e6ba0b6c05b8bc16abef0cc0dd7b727d175db",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupSelection.swift": "93d1397328d6e85b6ec57c692f303a2546c59d37ab36226bc794d4cce5a9ebfe",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "ec59a38bc259395da95a063202d11a620c313f0a35c2227165a5998d4c331416",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackMemory.swift": "d82754ce363aa8c98f7a2bb813d9638c4f744ed70a1403a0ee97532bdb41bab2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "fcd96e9809ef09a2d0e0a062b2f61df42c566ff390cd2c60cea7b504d631cb98",
    "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d17c70f66587d22b83e735a8f0fdf96dc3f20984ccfc836c2ac727bea8744bfd",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationPerformance.swift": "032a09a722c0c24672cf6b6c395355c618be4b4fd91fd6187c0d8d5d6fad05e4",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationSession.swift": "5333f11357cfe27f37b05219693e3fa91413f9749cd3a8bf0e532e80e87097c4",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationTasks.swift": "7363e7c3721c425ec9f0b97ca3f9fcb8d1ac09964e43c2c8a87824c4c5c67725",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "71694629e815cda657810d25f802569e831673585a66d280b0be393f5ca7b7a8",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "95c27157cb514ff744e70366bf4ac7a5b435279d7c8e232189dfb292e22c1f21",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQContext.swift": "75d660486eb83511b6c3bfc0614e1257d5578d68f42619c6312ae7e5cc296f31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "a2b432e22cfcdb2aee7ec9a3b5e613296ba6c3a21ba109546b40476e23f8843b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "84b3a4d26d69ddc38b08fc5fbb40c58300c4df479f22c25731930ac0aed5bf76",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "fcd2f234c893483618844cbd2296e74b27934dca28b06e24860c2b1212da135a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQState.swift": "655571a17a6e25833211de23de8b8c4f387ad2c7043e49da07c7b447babd2992",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "10aadb91c0f742cb1cab0a3f0b89f7309473e4b474324f8f7910b46b2b795bf0",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
    "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
    "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
    "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
    "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
    "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
    "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
    "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
    "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
    "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
    "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
    "Sources/SlotstreamTestKit/T0Checks.swift": "1de77b5621dcece636404143e28ffc7b3ad4093a69d3a7ad8c274d4fc5df5bf5",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
    "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "33ccd4a69ef6ff0d9930d084e3dcad46a33ef7eef2c4d957e069485fc2bfea4d",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "7b4c8543905f5b64c180dd5a0ddd8641e6d2f28d32d98236baf8636eb8059b45",
    "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
    "Sources/slotstream-cli/DraftStreamCommands.swift": "f31bd912c1981f708f3e7ac45aa82b668a0d28134108d6b8780d45fc5b66ea4a",
    "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "2367ed0855ea38e8baaca149e9045918b4cd90f8ef028a0a42a19b83b1df70ff",
    "Sources/slotstream-cli/LaunchCommand.swift": "f0f0adbb633fd8f3fa0e064e035bfdbacd10c06514ac7a2de643661a78b79998",
    "Sources/slotstream-cli/MTPCommands.swift": "bf78dcef794ab37b697e26464cff51a9d2c9f4a625e16566759d1d8e4e95aaa2",
    "Sources/slotstream-cli/ModelPackCommand.swift": "d6644d25f4fd4dae699ec8bdafe380ffda03c546dabcdde77bf60bdcb6214402",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
    "Sources/slotstream-cli/PrefixExactCommands.swift": "2551055600f0fa5d850ce1e8eb2ee4dccb805f8b553ecdb719ec2ba0ebd21091",
    "Sources/slotstream-cli/Pull.swift": "ef6e293042c5940fd6e08523abf7f3ac4a882bba493d28fed05f2703fb28b37e",
    "Sources/slotstream-cli/QuantizationCommands.swift": "70f40e5af97022bed99136900eceba3c3a6959dadca200a14cc528f389e9b8af",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "c01724aed447f397e9cb6d0dcff17003d1b273d269d0d0f0d83118e3a8021ada",
    "Sources/slotstream-cli/main.swift": "437d335750a795f6600dcefba68d0868ade72e114a1ec4238f58596c192967f3",
    "THIRD_PARTY_NOTICES.md": "dd7f676c763a2265aec700373a9a3bc2f6a203b4b55c7647e865534c855dbe5e",
    "Tools/build_identity.py": "436782b73e7c7454ef013b6375a568bdc503f40b7f3afedc68d35cefc9914078",
    "Tools/fetch_metallib.sh": "7df9293bbef54ff4fdd395adae9942f96ad6cec3f204e90dd334e4b0d779cc2a"
  },
  "source_archive_sha256": "e347973533dd83d6adac40b9ab7c368ab2c733065b063e76c8a0b3f5003bb6e5",
  "binary_sha256": "133c7611b973022c509bd022826a963396ddf22f82ccb9eeffb9f68a2f7c7e2b",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed"
}
```

### practical-native-session-checks-v1.json

SHA-256: `a7dd7770bf2fec4bfbb644774845039e29144b8f2d2c32354cefdaaf5e62408d`.

```json
[
  {
    "command": [
      "/Users/carlos/Projects/slotstream/.build/quantization-research/frozen-practical-v7/slotstream",
      "quantization-session",
      "--baseline",
      "/Users/carlos/Projects/slotstream/.build/quantization-research/affine-standalone-pack-v1",
      "--protocol-file",
      "/Users/carlos/Projects/slotstream/.build/quantization-research/practical-quality-v1-protocol/facts-session.json",
      "--protocol-sha256",
      "0b2d850cd1e1f0161d0cfd11407b0e35ede519c84c09c53a489208616d60dae8",
      "--plan-only",
      "--native-arithmetic",
      "--output",
      "/Users/carlos/Projects/slotstream/.build/quantization-research/practical-session-missing-pin-v1"
    ],
    "exit_code": 1,
    "stdout": "",
    "stderr": "Error: native affine session requires an explicit standalone text pilot\n"
  },
  {
    "command": [
      "/Users/carlos/Projects/slotstream/.build/quantization-research/frozen-practical-v7/slotstream",
      "quantization-session",
      "--baseline",
      "/Users/carlos/Projects/slotstream/.build/quantization-research/affine-standalone-pack-v1",
      "--protocol-file",
      "/Users/carlos/Projects/slotstream/.build/quantization-research/practical-quality-v1-protocol/facts-session.json",
      "--protocol-sha256",
      "0b2d850cd1e1f0161d0cfd11407b0e35ede519c84c09c53a489208616d60dae8",
      "--plan-only",
      "--native-arithmetic",
      "--output",
      "/Users/carlos/Projects/slotstream/.build/quantization-research/practical-session-native-plan-v1",
      "--standalone-manifest-sha256",
      "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5"
    ],
    "exit_code": 0,
    "stdout": "{\"admission_refusals\":0,\"baseline_revision\":\"aa7c790e804bbf9d491ddb109c3d61bc4a555f7c\",\"complete\":true,\"control_manifest_sha256\":\"af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182\",\"control_policy\":\"pinned-affine4-to-affine3-group64-experts-only-v1\",\"draft_depth\":2,\"loaded\":false,\"maximum_requests\":128,\"maximum_seconds\":1800,\"native_arithmetic\":true,\"output_limit\":128,\"plan\":{\"availability_clamped\":false,\"context_qualification\":false,\"decode_estimate_cache_in_measured_range\":false,\"decode_lookahead\":false,\"device_available_gb\":34.299999999999997,\"device_ram_gb\":51.5,\"device_working_set_gb\":40.200000000000003,\"est_prefill_s_at_max_context\":null,\"est_prefill_tok_s\":null,\"est_warm_tok_s\":null,\"expected_peak_gb\":13,\"expected_peak_semantics\":\"planned_full_workload_envelope_not_measured_usage\",\"experts_per_layer_cached\":44,\"fully_resident\":false,\"implementation_context_limit\":32768,\"lookahead_reserve_bytes\":0,\"max_context_tokens\":32768,\"max_prefill_wait_minutes\":30,\"max_ram_percent\":70,\"memory_ledger\":{\"active_capacity_bytes\":981467136,\"additional_active_bytes\":0,\"expected_peak_bytes\":12999866624,\"expert_workspace_bytes\":0,\"fixed_bytes\":5300000000,\"long_context_reserve_bytes\":0,\"lookahead_reserve_bytes\":0,\"mtp_resident_bytes\":389017600,\"pack_resident_reserve_bytes\":424689664,\"planning_margin_bytes\":1000000000,\"pool_bytes\":4526592000,\"prefill_bytes\":1331200000,\"resource_identity\":\"affine3-native-memory-v1\",\"retained_capacity_bytes\":688628736,\"retained_recurrent_bytes\":339738624,\"version\":2,\"vision_resident_bytes\":0},\"memory_target_semantics\":\"process_budget_not_allocation_goal\",\"model_context_limit\":262144,\"mtp\":true,\"mtp_context_limit\":32768,\"mtp_streamed_experts\":true,\"non_cache_allowance_bytes\":8473274624,\"planned_headroom_gb\":1,\"pool_gb\":4.5,\"pool_slots\":2105,\"prefill_chunk\":1024,\"prefill_wait_scope\":\"accepted_request_to_first_model_token\",\"prefix_cache_max_tokens\":24907,\"resource_profile\":\"affine3-native-memory-v1\",\"runtime_prefix_cache_enabled\":true,\"source\":\"--memory-gb\",\"speed_evidence\":\"unknown\",\"target_gb\":14,\"vision\":false,\"vision_charged_gb\":0,\"vision_context_limit\":0,\"vision_resident_gb\":0,\"vision_resident_reserved\":false},\"prefix_cache\":true,\"protocol_kind\":\"quantization-tool-session-v1\",\"protocol_sha256\":\"0b2d850cd1e1f0161d0cfd11407b0e35ede519c84c09c53a489208616d60dae8\",\"qualification\":false,\"requests\":0,\"required_preflight_bytes\":17000000000,\"resets\":0,\"resource_identity\":\"affine3-native-memory-v1\",\"schema\":1,\"scope\":\"instrument-check\",\"seed\":7,\"standalone_manifest_sha256\":\"8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5\",\"vision\":false}\n",
    "stderr": ""
  }
]
```

### practical-performance-pilot-tests-v4.log

SHA-256: `27d457f8ae841ea57e059663a0bf0161801efbd287a518678ff0d440052dd38c`.

```text
{"completed_cells": 1, "of": 12, "timing_eligible": true}
{"completed_cells": 2, "of": 12, "timing_eligible": true}
{"completed_cells": 3, "of": 12, "timing_eligible": true}
{"completed_cells": 4, "of": 12, "timing_eligible": true}
{"completed_cells": 5, "of": 12, "timing_eligible": true}
{"completed_cells": 6, "of": 12, "timing_eligible": true}
{"completed_cells": 7, "of": 12, "timing_eligible": true}
{"completed_cells": 8, "of": 12, "timing_eligible": true}
{"completed_cells": 9, "of": 12, "timing_eligible": true}
{"completed_cells": 10, "of": 12, "timing_eligible": true}
{"completed_cells": 11, "of": 12, "timing_eligible": true}
{"completed_cells": 12, "of": 12, "timing_eligible": true}
{"completed_cells": 1, "of": 32, "timing_eligible": true}
{"completed_cells": 2, "of": 32, "timing_eligible": true}
{"completed_cells": 3, "of": 32, "timing_eligible": true}
{"completed_cells": 4, "of": 32, "timing_eligible": true}
{"completed_cells": 5, "of": 32, "timing_eligible": true}
{"completed_cells": 6, "of": 32, "timing_eligible": true}
{"completed_cells": 7, "of": 32, "timing_eligible": true}
{"completed_cells": 8, "of": 32, "timing_eligible": true}
{"completed_cells": 9, "of": 32, "timing_eligible": true}
{"completed_cells": 10, "of": 32, "timing_eligible": true}
{"completed_cells": 11, "of": 32, "timing_eligible": true}
{"completed_cells": 12, "of": 32, "timing_eligible": true}
{"completed_cells": 13, "of": 32, "timing_eligible": true}
{"completed_cells": 14, "of": 32, "timing_eligible": true}
{"completed_cells": 15, "of": 32, "timing_eligible": true}
{"completed_cells": 16, "of": 32, "timing_eligible": true}
{"completed_cells": 17, "of": 32, "timing_eligible": true}
{"completed_cells": 18, "of": 32, "timing_eligible": true}
{"completed_cells": 19, "of": 32, "timing_eligible": true}
{"completed_cells": 20, "of": 32, "timing_eligible": true}
{"completed_cells": 21, "of": 32, "timing_eligible": true}
{"completed_cells": 22, "of": 32, "timing_eligible": true}
{"completed_cells": 23, "of": 32, "timing_eligible": true}
{"completed_cells": 24, "of": 32, "timing_eligible": true}
{"completed_cells": 25, "of": 32, "timing_eligible": true}
{"completed_cells": 26, "of": 32, "timing_eligible": true}
{"completed_cells": 27, "of": 32, "timing_eligible": true}
{"completed_cells": 28, "of": 32, "timing_eligible": true}
{"completed_cells": 29, "of": 32, "timing_eligible": true}
{"completed_cells": 30, "of": 32, "timing_eligible": true}
{"completed_cells": 31, "of": 32, "timing_eligible": true}
{"completed_cells": 32, "of": 32, "timing_eligible": true}
.{"completed_cells": 1, "of": 6, "timing_eligible": true}
{"completed_cells": 2, "of": 6, "timing_eligible": true}
{"completed_cells": 3, "of": 6, "timing_eligible": true}
{"completed_cells": 4, "of": 6, "timing_eligible": true}
{"completed_cells": 5, "of": 6, "timing_eligible": true}
{"completed_cells": 6, "of": 6, "timing_eligible": true}
{"completed_cells": 1, "of": 6, "timing_eligible": true}
{"completed_cells": 2, "of": 6, "timing_eligible": true}
{"completed_cells": 3, "of": 6, "timing_eligible": true}
{"completed_cells": 4, "of": 6, "timing_eligible": true}
{"completed_cells": 5, "of": 6, "timing_eligible": true}
{"completed_cells": 6, "of": 6, "timing_eligible": true}
.{"completed_cells": 1, "of": 6, "timing_eligible": true}
{"completed_cells": 2, "of": 6, "timing_eligible": false}
{"completed_cells": 3, "of": 6, "timing_eligible": true}
{"completed_cells": 4, "of": 6, "timing_eligible": true}
{"completed_cells": 5, "of": 6, "timing_eligible": true}
{"completed_cells": 6, "of": 6, "timing_eligible": true}
{"completed_cells": 1, "of": 6, "timing_eligible": true}
{"completed_cells": 2, "of": 6, "timing_eligible": false}
{"completed_cells": 3, "of": 6, "timing_eligible": true}
{"completed_cells": 4, "of": 6, "timing_eligible": true}
{"completed_cells": 5, "of": 6, "timing_eligible": true}
{"completed_cells": 6, "of": 6, "timing_eligible": true}
{"completed_cells": 1, "of": 6, "timing_eligible": true}
{"completed_cells": 2, "of": 6, "timing_eligible": false}
{"completed_cells": 3, "of": 6, "timing_eligible": true}
{"completed_cells": 4, "of": 6, "timing_eligible": true}
{"completed_cells": 5, "of": 6, "timing_eligible": true}
{"completed_cells": 6, "of": 6, "timing_eligible": true}
{"completed_cells": 1, "of": 6, "timing_eligible": true}
{"completed_cells": 2, "of": 6, "timing_eligible": false}
{"completed_cells": 3, "of": 6, "timing_eligible": true}
{"completed_cells": 4, "of": 6, "timing_eligible": true}
{"completed_cells": 5, "of": 6, "timing_eligible": true}
{"completed_cells": 6, "of": 6, "timing_eligible": true}
.{"completed_cells": 1, "of": 16, "timing_eligible": true}
{"completed_cells": 2, "of": 16, "timing_eligible": true}
{"completed_cells": 3, "of": 16, "timing_eligible": true}
{"completed_cells": 4, "of": 16, "timing_eligible": true}
{"completed_cells": 5, "of": 16, "timing_eligible": true}
{"completed_cells": 6, "of": 16, "timing_eligible": true}
{"completed_cells": 7, "of": 16, "timing_eligible": true}
{"completed_cells": 8, "of": 16, "timing_eligible": true}
{"completed_cells": 9, "of": 16, "timing_eligible": true}
{"completed_cells": 10, "of": 16, "timing_eligible": true}
{"completed_cells": 11, "of": 16, "timing_eligible": true}
{"completed_cells": 12, "of": 16, "timing_eligible": true}
{"completed_cells": 13, "of": 16, "timing_eligible": true}
{"completed_cells": 14, "of": 16, "timing_eligible": true}
{"completed_cells": 15, "of": 16, "timing_eligible": true}
{"completed_cells": 16, "of": 16, "timing_eligible": true}
{"completed_cells": 1, "of": 16, "timing_eligible": true}
{"completed_cells": 2, "of": 16, "timing_eligible": true}
{"completed_cells": 3, "of": 16, "timing_eligible": true}
{"completed_cells": 4, "of": 16, "timing_eligible": true}
{"completed_cells": 5, "of": 16, "timing_eligible": true}
{"completed_cells": 6, "of": 16, "timing_eligible": true}
{"completed_cells": 7, "of": 16, "timing_eligible": true}
{"completed_cells": 8, "of": 16, "timing_eligible": true}
{"completed_cells": 9, "of": 16, "timing_eligible": true}
{"completed_cells": 10, "of": 16, "timing_eligible": true}
{"completed_cells": 11, "of": 16, "timing_eligible": true}
{"completed_cells": 12, "of": 16, "timing_eligible": true}
{"completed_cells": 13, "of": 16, "timing_eligible": true}
{"completed_cells": 14, "of": 16, "timing_eligible": true}
{"completed_cells": 15, "of": 16, "timing_eligible": true}
{"completed_cells": 16, "of": 16, "timing_eligible": true}
{"completed_cells": 1, "of": 16, "timing_eligible": true}
{"completed_cells": 2, "of": 16, "timing_eligible": true}
{"completed_cells": 3, "of": 16, "timing_eligible": true}
{"completed_cells": 4, "of": 16, "timing_eligible": true}
{"completed_cells": 5, "of": 16, "timing_eligible": true}
{"completed_cells": 6, "of": 16, "timing_eligible": true}
{"completed_cells": 7, "of": 16, "timing_eligible": true}
{"completed_cells": 8, "of": 16, "timing_eligible": true}
{"completed_cells": 9, "of": 16, "timing_eligible": true}
{"completed_cells": 10, "of": 16, "timing_eligible": true}
{"completed_cells": 11, "of": 16, "timing_eligible": true}
{"completed_cells": 12, "of": 16, "timing_eligible": true}
{"completed_cells": 13, "of": 16, "timing_eligible": true}
{"completed_cells": 14, "of": 16, "timing_eligible": true}
{"completed_cells": 15, "of": 16, "timing_eligible": true}
{"completed_cells": 16, "of": 16, "timing_eligible": true}
.......{"completed_cells": 1, "of": 6, "timing_eligible": true}
{"completed_cells": 2, "of": 6, "timing_eligible": true}
{"completed_cells": 3, "of": 6, "timing_eligible": true}
{"completed_cells": 4, "of": 6, "timing_eligible": true}
{"completed_cells": 5, "of": 6, "timing_eligible": true}
{"completed_cells": 6, "of": 6, "timing_eligible": true}
..{"completed_cells": 1, "of": 6, "timing_eligible": true}
{"completed_cells": 2, "of": 6, "timing_eligible": true}
{"completed_cells": 3, "of": 6, "timing_eligible": true}
{"completed_cells": 4, "of": 6, "timing_eligible": true}
{"completed_cells": 5, "of": 6, "timing_eligible": true}
{"completed_cells": 6, "of": 6, "timing_eligible": true}
{"completed_cells": 1, "of": 16, "timing_eligible": true}
{"completed_cells": 2, "of": 16, "timing_eligible": true}
{"completed_cells": 3, "of": 16, "timing_eligible": true}
{"completed_cells": 4, "of": 16, "timing_eligible": true}
{"completed_cells": 5, "of": 16, "timing_eligible": true}
{"completed_cells": 6, "of": 16, "timing_eligible": true}
{"completed_cells": 7, "of": 16, "timing_eligible": true}
{"completed_cells": 8, "of": 16, "timing_eligible": true}
{"completed_cells": 9, "of": 16, "timing_eligible": true}
{"completed_cells": 10, "of": 16, "timing_eligible": true}
{"completed_cells": 11, "of": 16, "timing_eligible": true}
{"completed_cells": 12, "of": 16, "timing_eligible": true}
{"completed_cells": 13, "of": 16, "timing_eligible": true}
{"completed_cells": 14, "of": 16, "timing_eligible": true}
{"completed_cells": 15, "of": 16, "timing_eligible": true}
{"completed_cells": 16, "of": 16, "timing_eligible": true}
{"completed_cells": 1, "of": 6, "timing_eligible": true}
{"completed_cells": 2, "of": 6, "timing_eligible": true}
{"completed_cells": 3, "of": 6, "timing_eligible": true}
{"completed_cells": 4, "of": 6, "timing_eligible": true}
{"completed_cells": 5, "of": 6, "timing_eligible": true}
{"completed_cells": 6, "of": 6, "timing_eligible": true}
{"completed_cells": 1, "of": 16, "timing_eligible": true}
{"completed_cells": 2, "of": 16, "timing_eligible": true}
{"completed_cells": 3, "of": 16, "timing_eligible": true}
{"completed_cells": 4, "of": 16, "timing_eligible": true}
{"completed_cells": 5, "of": 16, "timing_eligible": true}
{"completed_cells": 6, "of": 16, "timing_eligible": true}
{"completed_cells": 7, "of": 16, "timing_eligible": true}
{"completed_cells": 8, "of": 16, "timing_eligible": true}
{"completed_cells": 9, "of": 16, "timing_eligible": true}
{"completed_cells": 10, "of": 16, "timing_eligible": true}
{"completed_cells": 11, "of": 16, "timing_eligible": true}
{"completed_cells": 12, "of": 16, "timing_eligible": true}
{"completed_cells": 13, "of": 16, "timing_eligible": true}
{"completed_cells": 14, "of": 16, "timing_eligible": true}
{"completed_cells": 15, "of": 16, "timing_eligible": true}
{"completed_cells": 16, "of": 16, "timing_eligible": true}
...
----------------------------------------------------------------------
Ran 15 tests in 6.824s

OK
```

### practical-parent-engine-ci.json

SHA-256: `939111479d57da63df06093657c331dedcf5c07856b25563826a1ca3da8d961d`.

```json
{"conclusion":"success","headSha":"7624ad0e77825029508f0f58b3dc25f1d1ae8e4c","jobs":[{"completedAt":"2026-10-05T15:24:53Z","conclusion":"success","databaseId":111831511265,"name":"coverage","startedAt":"2026-10-05T15:08:26Z","status":"completed","steps":[{"completedAt":"2026-10-05T15:08:28Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T15:08:27Z","status":"completed"},{"completedAt":"2026-10-05T15:08:53Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T15:08:28Z","status":"completed"},{"completedAt":"2026-10-05T15:08:53Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T15:08:53Z","status":"completed"},{"completedAt":"2026-10-05T15:08:55Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T15:08:53Z","status":"completed"},{"completedAt":"2026-10-05T15:24:45Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T15:08:55Z","status":"completed"},{"completedAt":"2026-10-05T15:24:45Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T15:24:45Z","status":"completed"},{"completedAt":"2026-10-05T15:24:48Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T15:24:45Z","status":"completed"},{"completedAt":"2026-10-05T15:24:48Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T15:24:48Z","status":"completed"},{"completedAt":"2026-10-05T15:24:51Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T15:24:48Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37330337439/job/111831511265"},{"completedAt":"2026-10-05T15:15:39Z","conclusion":"success","databaseId":111831512197,"name":"public-library","startedAt":"2026-10-05T15:08:28Z","status":"completed","steps":[{"completedAt":"2026-10-05T15:08:30Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T15:08:29Z","status":"completed"},{"completedAt":"2026-10-05T15:08:58Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T15:08:30Z","status":"completed"},{"completedAt":"2026-10-05T15:08:58Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T15:08:58Z","status":"completed"},{"completedAt":"2026-10-05T15:15:33Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T15:08:58Z","status":"completed"},{"completedAt":"2026-10-05T15:15:34Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T15:15:33Z","status":"completed"},{"completedAt":"2026-10-05T15:15:36Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T15:15:34Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37330337439/job/111831512197"},{"completedAt":"2026-10-05T15:43:39Z","conclusion":"success","databaseId":111831512366,"name":"weights-free","startedAt":"2026-10-05T15:08:28Z","status":"completed","steps":[{"completedAt":"2026-10-05T15:08:31Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T15:08:29Z","status":"completed"},{"completedAt":"2026-10-05T15:08:56Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T15:08:31Z","status":"completed"},{"completedAt":"2026-10-05T15:10:05Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T15:08:56Z","status":"completed"},{"completedAt":"2026-10-05T15:10:05Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-05T15:10:05Z","status":"completed"},{"completedAt":"2026-10-05T15:10:08Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T15:10:05Z","status":"completed"},{"completedAt":"2026-10-05T15:24:15Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-05T15:10:08Z","status":"completed"},{"completedAt":"2026-10-05T15:24:19Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T15:24:15Z","status":"completed"},{"completedAt":"2026-10-05T15:24:31Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T15:24:19Z","status":"completed"},{"completedAt":"2026-10-05T15:25:54Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T15:24:31Z","status":"completed"},{"completedAt":"2026-10-05T15:25:54Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T15:25:54Z","status":"completed"},{"completedAt":"2026-10-05T15:42:29Z","conclusion":"success","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T15:25:54Z","status":"completed"},{"completedAt":"2026-10-05T15:42:42Z","conclusion":"success","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-05T15:42:29Z","status":"completed"},{"completedAt":"2026-10-05T15:43:33Z","conclusion":"success","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-05T15:42:42Z","status":"completed"},{"completedAt":"2026-10-05T15:43:34Z","conclusion":"success","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-05T15:43:33Z","status":"completed"},{"completedAt":"2026-10-05T15:43:35Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-05T15:43:34Z","status":"completed"},{"completedAt":"2026-10-05T15:43:37Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-05T15:43:35Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37330337439/job/111831512366"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37330337439"}
```

### practical-parent-mac-ci.json

SHA-256: `e1fa196c02cf01795b779781399a6e13c36cc52715bb33eaf88e4f831c4af8b6`.

```json
{"conclusion":"success","headSha":"7624ad0e77825029508f0f58b3dc25f1d1ae8e4c","jobs":[{"completedAt":"2026-10-05T15:22:48Z","conclusion":"success","databaseId":111831512218,"name":"xcode","startedAt":"2026-10-05T15:08:27Z","status":"completed","steps":[{"completedAt":"2026-10-05T15:08:28Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T15:08:28Z","status":"completed"},{"completedAt":"2026-10-05T15:08:54Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T15:08:28Z","status":"completed"},{"completedAt":"2026-10-05T15:08:54Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T15:08:54Z","status":"completed"},{"completedAt":"2026-10-05T15:08:58Z","conclusion":"success","name":"pinned dbmd and Metal library, which the app bundle carries","number":4,"startedAt":"2026-10-05T15:08:54Z","status":"completed"},{"completedAt":"2026-10-05T15:22:39Z","conclusion":"success","name":"Xcode project build, ad hoc signed","number":5,"startedAt":"2026-10-05T15:08:58Z","status":"completed"},{"completedAt":"2026-10-05T15:22:41Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T15:22:39Z","status":"completed"},{"completedAt":"2026-10-05T15:22:45Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T15:22:41Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37330336996/job/111831512218"},{"completedAt":"2026-10-05T15:37:17Z","conclusion":"success","databaseId":111831512658,"name":"checks","startedAt":"2026-10-05T15:08:26Z","status":"completed","steps":[{"completedAt":"2026-10-05T15:08:29Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T15:08:27Z","status":"completed"},{"completedAt":"2026-10-05T15:08:51Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T15:08:29Z","status":"completed"},{"completedAt":"2026-10-05T15:08:51Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T15:08:51Z","status":"completed"},{"completedAt":"2026-10-05T15:08:52Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T15:08:51Z","status":"completed"},{"completedAt":"2026-10-05T15:37:08Z","conclusion":"success","name":"scripted checks, no model weights","number":5,"startedAt":"2026-10-05T15:08:52Z","status":"completed"},{"completedAt":"2026-10-05T15:37:11Z","conclusion":"success","name":"offscreen view snapshots, light and dark","number":6,"startedAt":"2026-10-05T15:37:08Z","status":"completed"},{"completedAt":"2026-10-05T15:37:12Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":12,"startedAt":"2026-10-05T15:37:11Z","status":"completed"},{"completedAt":"2026-10-05T15:37:16Z","conclusion":"success","name":"Complete job","number":13,"startedAt":"2026-10-05T15:37:12Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37330336996/job/111831512658"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37330336996"}
```

### practical-v7-pack-memory.json

SHA-256: `f092e5a41f50597c227aef6b72dbc21934f782f10653d41c73bc399a8c525e06`.

```json
{
  "checks" : [
    {
      "items" : [
        {
          "name" : "legacy planner retains exact original decisions",
          "passed" : true
        },
        {
          "name" : "native affine ledger charges the exact expert size\/10.0",
          "passed" : true
        },
        {
          "name" : "native affine full plan stays inside the target\/10.0",
          "passed" : true
        },
        {
          "name" : "native affine does not inherit an original speed estimate\/10.0",
          "passed" : true
        },
        {
          "name" : "native affine ledger charges the exact expert size\/14.0",
          "passed" : true
        },
        {
          "name" : "native affine full plan stays inside the target\/14.0",
          "passed" : true
        },
        {
          "name" : "native affine does not inherit an original speed estimate\/14.0",
          "passed" : true
        },
        {
          "name" : "native affine ledger charges the exact expert size\/22.0",
          "passed" : true
        },
        {
          "name" : "native affine full plan stays inside the target\/22.0",
          "passed" : true
        },
        {
          "name" : "native affine does not inherit an original speed estimate\/22.0",
          "passed" : true
        },
        {
          "name" : "three-bit complete-record byte cost 640",
          "passed" : true
        },
        {
          "name" : "original complete-record byte cost 640",
          "passed" : true
        },
        {
          "name" : "byte conversion never overallocates 640",
          "passed" : true
        },
        {
          "name" : "three-bit complete-record byte cost 1000",
          "passed" : true
        },
        {
          "name" : "original complete-record byte cost 1000",
          "passed" : true
        },
        {
          "name" : "byte conversion never overallocates 1000",
          "passed" : true
        },
        {
          "name" : "three-bit complete-record byte cost 7000",
          "passed" : true
        },
        {
          "name" : "original complete-record byte cost 7000",
          "passed" : true
        },
        {
          "name" : "byte conversion never overallocates 7000",
          "passed" : true
        },
        {
          "name" : "three-bit complete-record byte cost 24576",
          "passed" : true
        },
        {
          "name" : "original complete-record byte cost 24576",
          "passed" : true
        },
        {
          "name" : "byte conversion never overallocates 24576",
          "passed" : true
        },
        {
          "name" : "invalid negative count saturates",
          "passed" : true
        },
        {
          "name" : "overflow count saturates",
          "passed" : true
        },
        {
          "name" : "huge finite pool capped before integer conversion",
          "passed" : true
        },
        {
          "name" : "ledger uses the authenticated expert recipe",
          "passed" : true
        },
        {
          "name" : "eager embedding and rotary component reserved independently",
          "passed" : true
        },
        {
          "name" : "floor layer, admission replacement and retained routes reserved",
          "passed" : true
        },
        {
          "name" : "larger arena includes a replacement alongside the layer",
          "passed" : true
        },
        {
          "name" : "sequential pieces retain full source and bounded replacement",
          "passed" : true
        },
        {
          "name" : "sequential floor matches independently priced allowance",
          "passed" : true
        },
        {
          "name" : "sequential admission still owns its largest replacement\/640",
          "passed" : true
        },
        {
          "name" : "sequential copies do not grow the conservative allowance\/640",
          "passed" : true
        },
        {
          "name" : "sequential admission still owns its largest replacement\/1000",
          "passed" : true
        },
        {
          "name" : "sequential copies do not grow the conservative allowance\/1000",
          "passed" : true
        },
        {
          "name" : "sequential admission still owns its largest replacement\/7000",
          "passed" : true
        },
        {
          "name" : "sequential copies do not grow the conservative allowance\/7000",
          "passed" : true
        },
        {
          "name" : "sequential admission still owns its largest replacement\/24576",
          "passed" : true
        },
        {
          "name" : "sequential copies do not grow the conservative allowance\/24576",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential capacity pays for live replacement storage",
          "passed" : true
        },
        {
          "name" : "sequential next record cannot fit",
          "passed" : true
        },
        {
          "name" : "sequential allocation admits more records at an equal ceiling",
          "passed" : true
        },
        {
          "name" : "sequential allocation keeps unknown speed and conservative features",
          "passed" : true
        },
        {
          "name" : "sequential allocation ledger respects its saved ceiling",
          "passed" : true
        },
        {
          "name" : "experimental lookahead is a separate explicit capability",
          "passed" : true
        },
        {
          "name" : "explicit candidate lookahead pays for its complete reservation",
          "passed" : true
        },
        {
          "name" : "candidate lookahead cannot claim the original speed curve",
          "passed" : true
        },
        {
          "name" : "candidate lane scratch and every staged record fit the charged original envelope",
          "passed" : true
        },
        {
          "name" : "runtime policy retains the exact experimental reserve",
          "passed" : true
        },
        {
          "name" : "experimental lookahead cannot inherit or change its reserve",
          "passed" : true
        },
        {
          "name" : "experimental lookahead cannot inherit or change its reserve",
          "passed" : true
        },
        {
          "name" : "experimental lookahead cannot inherit or change its reserve",
          "passed" : true
        },
        {
          "name" : "experimental lookahead cannot inherit or change its reserve",
          "passed" : true
        },
        {
          "name" : "experimental lookahead cannot inherit or change its reserve",
          "passed" : true
        },
        {
          "name" : "prior grouped profile cannot silently acquire lookahead",
          "passed" : true
        },
        {
          "name" : "owned vision is an independent explicit capability identity",
          "passed" : true
        },
        {
          "name" : "vision profile preserves the checked text horizon",
          "passed" : true
        },
        {
          "name" : "owned vision reserves tower residency before loading",
          "passed" : true
        },
        {
          "name" : "owned vision keeps its resource identity",
          "passed" : true
        },
        {
          "name" : "owned image reservation keeps the saved ceiling and cannot grow cache",
          "passed" : true
        },
        {
          "name" : "owned image plan prices all memory",
          "passed" : true
        },
        {
          "name" : "owned image plan reports the bounded horizon",
          "passed" : true
        },
        {
          "name" : "vision profile preserves resident text allowance",
          "passed" : true
        },
        {
          "name" : "vision profile shares grouped workspace at 640",
          "passed" : true
        },
        {
          "name" : "vision profile shares grouped capacity cost at 640",
          "passed" : true
        },
        {
          "name" : "vision profile shares grouped workspace at 1000",
          "passed" : true
        },
        {
          "name" : "vision profile shares grouped capacity cost at 1000",
          "passed" : true
        },
        {
          "name" : "vision profile shares grouped workspace at 7000",
          "passed" : true
        },
        {
          "name" : "vision profile shares grouped capacity cost at 7000",
          "passed" : true
        },
        {
          "name" : "vision profile shares grouped workspace at 24576",
          "passed" : true
        },
        {
          "name" : "vision profile shares grouped capacity cost at 24576",
          "passed" : true
        },
        {
          "name" : "grouped floor includes its independent allocation witness",
          "passed" : true
        },
        {
          "name" : "grouped floor is charged exactly once",
          "passed" : true
        },
        {
          "name" : "grouped larger arena includes a larger live replacement",
          "passed" : true
        },
        {
          "name" : "grouped hot rows and destination overlap remain charged\/640",
          "passed" : true
        },
        {
          "name" : "grouped weights release the unneeded full expert domain\/640",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped hot rows and destination overlap remain charged\/1000",
          "passed" : true
        },
        {
          "name" : "grouped weights release the unneeded full expert domain\/1000",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped hot rows and destination overlap remain charged\/2000",
          "passed" : true
        },
        {
          "name" : "grouped weights release the unneeded full expert domain\/2000",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped hot rows and destination overlap remain charged\/7000",
          "passed" : true
        },
        {
          "name" : "grouped weights release the unneeded full expert domain\/7000",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped hot rows and destination overlap remain charged\/24576",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "grouped query reservation is monotonic",
          "passed" : true
        },
        {
          "name" : "grouped no-admission cannot exceed admission",
          "passed" : true
        },
        {
          "name" : "invalid grouped geometry refuses before arithmetic\/0\/640",
          "passed" : true
        },
        {
          "name" : "invalid grouped geometry refuses before arithmetic\/-1\/640",
          "passed" : true
        },
        {
          "name" : "invalid grouped geometry refuses before arithmetic\/513\/640",
          "passed" : true
        },
        {
          "name" : "invalid grouped geometry refuses before arithmetic\/9223372036854775807\/640",
          "passed" : true
        },
        {
          "name" : "invalid grouped geometry refuses before arithmetic\/512\/639",
          "passed" : true
        },
        {
          "name" : "invalid grouped geometry refuses before arithmetic\/512\/-1",
          "passed" : true
        },
        {
          "name" : "invalid grouped geometry refuses before arithmetic\/512\/9223372036854775807",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped capacity pays for its larger admission overlap",
          "passed" : true
        },
        {
          "name" : "grouped capacity does not leave an unpriced record",
          "passed" : true
        },
        {
          "name" : "grouped allocation returns released workspace to cache",
          "passed" : true
        },
        {
          "name" : "grouped ledger remains within the saved ceiling",
          "passed" : true
        },
        {
          "name" : "grouped accounting does not inherit baseline speed or features",
          "passed" : true
        },
        {
          "name" : "invalid replacement bound refuses before allocation\/-1",
          "passed" : true
        },
        {
          "name" : "invalid replacement bound refuses before allocation\/0",
          "passed" : true
        },
        {
          "name" : "invalid replacement bound refuses before allocation\/1376256001",
          "passed" : true
        },
        {
          "name" : "invalid replacement bound refuses before allocation\/9223372036854775807",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "capacity solve includes its own scratch",
          "passed" : true
        },
        {
          "name" : "next record cannot fit the same capacity budget",
          "passed" : true
        },
        {
          "name" : "research defaults do not inherit feature timing thresholds",
          "passed" : true
        },
        {
          "name" : "candidate carries unknown speed through serialization",
          "passed" : true
        },
        {
          "name" : "candidate prefill estimate is also unknown",
          "passed" : true
        },
        {
          "name" : "draft metadata respects the candidate context bound",
          "passed" : true
        },
        {
          "name" : "image metadata does not advertise an unsupported path",
          "passed" : true
        },
        {
          "name" : "candidate banner makes no original speed claim",
          "passed" : true
        },
        {
          "name" : "draft keeps its own four-bit cost",
          "passed" : true
        },
        {
          "name" : "explicit draft uses admitted resident placement",
          "passed" : true
        },
        {
          "name" : "candidate automatic placement does not inherit original timing floors",
          "passed" : true
        },
        {
          "name" : "independent streamed draft is explicitly admitted",
          "passed" : true
        },
        {
          "name" : "independent streamed draft retains original record cost",
          "passed" : true
        },
        {
          "name" : "streaming leaves more budget for target capacity",
          "passed" : true
        },
        {
          "name" : "unmeasured draft floor is not inherited",
          "passed" : true
        },
        {
          "name" : "allocation override preserves resource identity",
          "passed" : true
        },
        {
          "name" : "reassigned capacity uses three-bit bytes",
          "passed" : true
        },
        {
          "name" : "explicit controls keep the total target",
          "passed" : true
        },
        {
          "name" : "request policy preserves resource identity",
          "passed" : true
        },
        {
          "name" : "different pack costs cannot satisfy fixed-capacity feasibility",
          "passed" : true
        },
        {
          "name" : "unsupported pack configuration refused before load",
          "passed" : true
        },
        {
          "name" : "unsupported pack configuration refused before load",
          "passed" : true
        },
        {
          "name" : "unsupported pack configuration refused before load",
          "passed" : true
        },
        {
          "name" : "unsupported pack configuration refused before load",
          "passed" : true
        },
        {
          "name" : "unsupported pack configuration refused before load",
          "passed" : true
        },
        {
          "name" : "unsupported pack configuration refused before load",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "infeasible matrix cell returns a typed refusal",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "simulated candidate remains bounded",
          "passed" : true
        },
        {
          "name" : "matrix retains exact pool geometry",
          "passed" : true
        },
        {
          "name" : "pressure fixture is below its independently planned ceiling",
          "passed" : true
        },
        {
          "name" : "pressure converts donated bytes using active pack",
          "passed" : true
        },
        {
          "name" : "pressure cannot restore an unsupported prefill size",
          "passed" : true
        },
        {
          "name" : "governor retains resource identity",
          "passed" : true
        },
        {
          "name" : "restart credits no more than observed ownership",
          "passed" : true
        },
        {
          "name" : "replan prices active pack within real credit",
          "passed" : true
        },
        {
          "name" : "failed physical observation grants no resize credit",
          "passed" : true
        },
        {
          "name" : "unknown pack cannot inherit a baseline ETA",
          "passed" : true
        },
        {
          "name" : "unknown ETA retains the real wall deadline",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "pack-memory",
      "passed" : true
    }
  ],
  "failed" : 0,
  "passed" : 1,
  "skipped" : 0
}
```

### practical-v7-model-pack-startup.json

SHA-256: `4ff6bc325e5fb23bdd068dfa1964e8de7304fd766d88a6b4fb45694ce2b79427`.

```json
{
  "checks" : [
    {
      "items" : [
        {
          "name" : "standalone recipe prices streamed drafts and lookahead inside the saved ceiling",
          "passed" : true
        },
        {
          "name" : "local trial remains outside supported selection and downloads",
          "passed" : true
        },
        {
          "name" : "research pack cannot be selected by users",
          "passed" : true
        },
        {
          "name" : "legacy activation mapping binds the exact historical startup recipe",
          "passed" : true
        },
        {
          "name" : "automatic ceiling ignores transient availability\/16.0",
          "passed" : true
        },
        {
          "name" : "original Desktop keeps its existing total ceiling\/16.0",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/16.0\/false",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/16.0\/true",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "automatic policy cannot waive current headroom",
          "passed" : true
        },
        {
          "name" : "automatic ceiling ignores transient availability\/24.0",
          "passed" : true
        },
        {
          "name" : "original Desktop keeps its existing total ceiling\/24.0",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/24.0\/false",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/24.0\/true",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "automatic policy cannot waive current headroom",
          "passed" : true
        },
        {
          "name" : "automatic ceiling ignores transient availability\/32.0",
          "passed" : true
        },
        {
          "name" : "original Desktop keeps its existing total ceiling\/32.0",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/32.0\/false",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/32.0\/true",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "automatic policy cannot waive current headroom",
          "passed" : true
        },
        {
          "name" : "automatic ceiling ignores transient availability\/48.0",
          "passed" : true
        },
        {
          "name" : "original Desktop keeps its existing total ceiling\/48.0",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/48.0\/false",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/48.0\/true",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "automatic policy cannot waive current headroom",
          "passed" : true
        },
        {
          "name" : "automatic ceiling ignores transient availability\/64.0",
          "passed" : true
        },
        {
          "name" : "original Desktop keeps its existing total ceiling\/64.0",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/64.0\/false",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/64.0\/true",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "automatic policy cannot waive current headroom",
          "passed" : true
        },
        {
          "name" : "automatic ceiling ignores transient availability\/96.0",
          "passed" : true
        },
        {
          "name" : "original Desktop keeps its existing total ceiling\/96.0",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/96.0\/false",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "original complete plan remains byte-identical\/96.0\/true",
          "passed" : true
        },
        {
          "name" : "simulated startup never creates measured evidence",
          "passed" : true
        },
        {
          "name" : "automatic policy cannot waive current headroom",
          "passed" : true
        },
        {
          "name" : "a pack recipe does not borrow the original automatic cap",
          "passed" : true
        },
        {
          "name" : "startup uses the recipe's own saved ceiling",
          "passed" : true
        },
        {
          "name" : "busy initial target retains the larger recipe ceiling",
          "passed" : true
        },
        {
          "name" : "custom may exceed the automatic recommendation without replacement",
          "passed" : true
        },
        {
          "name" : "a valid precise custom value is never rounded to the control increment",
          "passed" : true
        },
        {
          "name" : "original forecast bytes remain separately charged inside the same ceiling",
          "passed" : true
        },
        {
          "name" : "an explicit candidate recipe cannot inherit original correction settings",
          "passed" : true
        },
        {
          "name" : "invalid saved limits fail before allocation",
          "passed" : true
        },
        {
          "name" : "invalid saved limits fail before allocation",
          "passed" : true
        },
        {
          "name" : "invalid saved limits fail before allocation",
          "passed" : true
        },
        {
          "name" : "invalid saved limits fail before allocation",
          "passed" : true
        },
        {
          "name" : "invalid saved limits fail before allocation",
          "passed" : true
        },
        {
          "name" : "invalid saved limits fail before allocation",
          "passed" : true
        },
        {
          "name" : "missing or invalid availability does not rewrite the hardware ceiling",
          "passed" : true
        },
        {
          "name" : "unknown headroom cannot admit a plan",
          "passed" : true
        },
        {
          "name" : "missing or invalid availability does not rewrite the hardware ceiling",
          "passed" : true
        },
        {
          "name" : "unknown headroom cannot admit a plan",
          "passed" : true
        },
        {
          "name" : "missing or invalid availability does not rewrite the hardware ceiling",
          "passed" : true
        },
        {
          "name" : "unknown headroom cannot admit a plan",
          "passed" : true
        },
        {
          "name" : "missing or invalid availability does not rewrite the hardware ceiling",
          "passed" : true
        },
        {
          "name" : "unknown headroom cannot admit a plan",
          "passed" : true
        },
        {
          "name" : "missing or invalid availability does not rewrite the hardware ceiling",
          "passed" : true
        },
        {
          "name" : "unknown headroom cannot admit a plan",
          "passed" : true
        },
        {
          "name" : "invalid hardware cannot invent an automatic cap",
          "passed" : true
        },
        {
          "name" : "invalid hardware cannot invent an automatic cap",
          "passed" : true
        },
        {
          "name" : "invalid hardware cannot invent an automatic cap",
          "passed" : true
        },
        {
          "name" : "invalid hardware cannot invent an automatic cap",
          "passed" : true
        },
        {
          "name" : "invalid hardware cannot invent an automatic cap",
          "passed" : true
        },
        {
          "name" : "malformed or incompatible compiled recipes fail closed",
          "passed" : true
        },
        {
          "name" : "malformed or incompatible compiled recipes fail closed",
          "passed" : true
        },
        {
          "name" : "malformed or incompatible compiled recipes fail closed",
          "passed" : true
        },
        {
          "name" : "malformed or incompatible compiled recipes fail closed",
          "passed" : true
        },
        {
          "name" : "malformed or incompatible compiled recipes fail closed",
          "passed" : true
        },
        {
          "name" : "malformed or incompatible compiled recipes fail closed",
          "passed" : true
        },
        {
          "name" : "malformed or incompatible compiled recipes fail closed",
          "passed" : true
        },
        {
          "name" : "malformed or incompatible compiled recipes fail closed",
          "passed" : true
        },
        {
          "name" : "malformed or incompatible compiled recipes fail closed",
          "passed" : true
        },
        {
          "name" : "malformed or incompatible compiled recipes fail closed",
          "passed" : true
        },
        {
          "name" : "execution identities are deterministic",
          "passed" : true
        },
        {
          "name" : "changing a non-planner choice changes execution identity",
          "passed" : true
        },
        {
          "name" : "changing a non-planner choice changes execution identity",
          "passed" : true
        },
        {
          "name" : "changing a non-planner choice changes execution identity",
          "passed" : true
        },
        {
          "name" : "changing a non-planner choice changes execution identity",
          "passed" : true
        },
        {
          "name" : "changing a non-planner choice changes execution identity",
          "passed" : true
        },
        {
          "name" : "changing a non-planner choice changes execution identity",
          "passed" : true
        },
        {
          "name" : "changing a non-planner choice changes execution identity",
          "passed" : true
        },
        {
          "name" : "changing a non-planner choice changes execution identity",
          "passed" : true
        },
        {
          "name" : "live adjustment is independent but remains identified",
          "passed" : true
        },
        {
          "name" : "startup policy does not change the original download manifest",
          "passed" : true
        },
        {
          "name" : "older applied receipts retain missing startup policy explicitly",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "model-pack-startup-defaults",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "one accepted complete installation produces one proposal",
          "passed" : true
        },
        {
          "name" : "proposal uses the pack's own automatic ceiling",
          "passed" : true
        },
        {
          "name" : "proposal prices the actual complete startup allocation",
          "passed" : true
        },
        {
          "name" : "proposal keeps its observed storage and operating conditions",
          "passed" : true
        },
        {
          "name" : "proposal binds execution rather than an arbitrary recipe label",
          "passed" : true
        },
        {
          "name" : "custom ceiling is preserved exactly",
          "passed" : true
        },
        {
          "name" : "live mode leaves the startup allocation unchanged",
          "passed" : true
        },
        {
          "name" : "live mode changes the complete execution identity",
          "passed" : true
        },
        {
          "name" : "a supported custom limit is not rounded to a slider increment",
          "passed" : true
        },
        {
          "name" : "the precise custom limit reaches the proposal",
          "passed" : true
        },
        {
          "name" : "missing, unaccepted, incompatible or infeasible content cannot propose itself",
          "passed" : true
        },
        {
          "name" : "missing, unaccepted, incompatible or infeasible content cannot propose itself",
          "passed" : true
        },
        {
          "name" : "missing, unaccepted, incompatible or infeasible content cannot propose itself",
          "passed" : true
        },
        {
          "name" : "missing, unaccepted, incompatible or infeasible content cannot propose itself",
          "passed" : true
        },
        {
          "name" : "missing, unaccepted, incompatible or infeasible content cannot propose itself",
          "passed" : true
        },
        {
          "name" : "missing, unaccepted, incompatible or infeasible content cannot propose itself",
          "passed" : true
        },
        {
          "name" : "missing, unaccepted, incompatible or infeasible content cannot propose itself",
          "passed" : true
        },
        {
          "name" : "missing, unaccepted, incompatible or infeasible content cannot propose itself",
          "passed" : true
        },
        {
          "name" : "missing, unaccepted, incompatible or infeasible content cannot propose itself",
          "passed" : true
        },
        {
          "name" : "a busy start cannot lower the automatic policy ceiling",
          "passed" : true
        },
        {
          "name" : "busy startup proposes a smaller current allocation",
          "passed" : true
        },
        {
          "name" : "invalid saved memory is refused",
          "passed" : true
        },
        {
          "name" : "invalid saved memory is refused",
          "passed" : true
        },
        {
          "name" : "invalid saved memory is refused",
          "passed" : true
        },
        {
          "name" : "invalid saved memory is refused",
          "passed" : true
        },
        {
          "name" : "duplicate observations fail closed",
          "passed" : true
        },
        {
          "name" : "the active pinned correction changes the complete execution identity",
          "passed" : true
        },
        {
          "name" : "experimental or unknown forecast cannot inherit automatic evidence",
          "passed" : true
        },
        {
          "name" : "experimental or unknown forecast cannot inherit automatic evidence",
          "passed" : true
        },
        {
          "name" : "experimental or unknown forecast cannot inherit automatic evidence",
          "passed" : true
        },
        {
          "name" : "experimental or unknown forecast cannot inherit automatic evidence",
          "passed" : true
        },
        {
          "name" : "actual generated proposal matches its exact synthetic complete profile",
          "passed" : true
        },
        {
          "name" : "a different saved ceiling cannot inherit that measured configuration",
          "passed" : true
        },
        {
          "name" : "production remains an unqualified supported fallback",
          "passed" : true
        },
        {
          "name" : "a proposed configuration cannot confirm itself without a loaded observation",
          "passed" : true
        },
        {
          "name" : "resolved platform execution defaults change the complete policy identity",
          "passed" : true
        },
        {
          "name" : "ordinary paths and build-tool selectors do not change loaded execution evidence",
          "passed" : true
        },
        {
          "name" : "ordinary paths and build-tool selectors do not change loaded execution evidence",
          "passed" : true
        },
        {
          "name" : "ordinary paths and build-tool selectors do not change loaded execution evidence",
          "passed" : true
        },
        {
          "name" : "explicit or unknown runtime tuning cannot inherit default measurements",
          "passed" : true
        },
        {
          "name" : "explicit or unknown runtime tuning cannot inherit default measurements",
          "passed" : true
        },
        {
          "name" : "explicit or unknown runtime tuning cannot inherit default measurements",
          "passed" : true
        },
        {
          "name" : "unmeasured compiler modes cannot inherit optimized runtime evidence\/debug",
          "passed" : true
        },
        {
          "name" : "unmeasured compiler modes cannot inherit optimized runtime evidence\/unchecked",
          "passed" : true
        },
        {
          "name" : "unmeasured compiler modes cannot inherit optimized runtime evidence\/unknown",
          "passed" : true
        },
        {
          "name" : "the production evidence check observes this compiled library's actual mode",
          "passed" : true
        },
        {
          "name" : "explicit choice remains exact without granting installation or allocation",
          "passed" : true
        },
        {
          "name" : "complete setup proposes its declared independent draft",
          "passed" : true
        },
        {
          "name" : "complete setup prices its pinned optional forecast",
          "passed" : true
        },
        {
          "name" : "setup respects an explicit forecast override",
          "passed" : true
        },
        {
          "name" : "an undownloaded setup offer is distinct from qualification",
          "passed" : true
        },
        {
          "name" : "creating an offer does not admit unaccepted files",
          "passed" : true
        },
        {
          "name" : "an explicit supported pack can be reviewed before it is installed",
          "passed" : true
        },
        {
          "name" : "setup cannot replace an unavailable explicit choice",
          "passed" : true
        },
        {
          "name" : "ambiguous setup observations are refused",
          "passed" : true
        },
        {
          "name" : "uncreated setup directory uses its existing ancestor's volume",
          "passed" : true
        },
        {
          "name" : "uncreated setup directory keeps its actual storage class",
          "passed" : true
        },
        {
          "name" : "prospective storage inspection creates no model directory",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "model-pack-startup-selection",
      "passed" : true
    }
  ],
  "failed" : 0,
  "passed" : 2,
  "skipped" : 0
}
```

### practical-v7-quantization-performance-protocol.json

SHA-256: `a4dc438e0531678ae57982a08bba42428fea97277999f872514472464b68e794`.

```json
{
  "checks" : [
    {
      "items" : [
        {
          "name" : "complete original profile keeps its own resource identity",
          "passed" : true
        },
        {
          "name" : "experimental candidate receives only its explicit lookahead identity",
          "passed" : true
        },
        {
          "name" : "ordinary candidate retains its prior resource identity",
          "passed" : true
        },
        {
          "name" : "natural completion retains its separate reply ceiling",
          "passed" : true
        },
        {
          "name" : "prompt admission reserves the entire frozen reply",
          "passed" : true
        },
        {
          "name" : "warm timing requires a predecessor and explicit minimum reuse",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/schema",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/kind",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/extra",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/artifact",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/memory_bytes",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/memory_bytes",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/memory_bytes",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/memory_mode",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/memory_mode",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/context_limit",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/draft_depth",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/draft_depth",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/draft_mode",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/draft_placement",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/lookahead",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/original_correction_sha256",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/live_memory",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/gpu_keep_alive",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/maximum_seconds",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/request_seconds",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/seed",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/tokenizer_sha256",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/cases",
          "passed" : true
        },
        {
          "name" : "unfrozen configuration is refused\/cases",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/id",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/id",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/extra",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/work",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/prompt_tokens",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/prompt_tokens",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/prompt_tokens",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/prompt_tokens",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/output_tokens",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/prefix",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/prefix",
          "passed" : true
        },
        {
          "name" : "invalid work or cache contract is refused\/minimum_reused_tokens",
          "passed" : true
        },
        {
          "name" : "warm cache cannot be declared when disabled",
          "passed" : true
        },
        {
          "name" : "candidate cannot borrow original automatic lookahead",
          "passed" : true
        },
        {
          "name" : "Desktop short requests use their explicit prefill policy",
          "passed" : true
        },
        {
          "name" : "the Desktop boundary returns to the priced full-context policy",
          "passed" : true
        },
        {
          "name" : "Desktop never increases a smaller admitted chunk",
          "passed" : true
        },
        {
          "name" : "legacy protocols preserve the Engine policy",
          "passed" : true
        },
        {
          "name" : "standalone protocol parsing cannot admit an artifact for model loading",
          "passed" : true
        },
        {
          "name" : "native trial binds its own allocation and arithmetic contract",
          "passed" : true
        },
        {
          "name" : "native trial cannot inherit reference qualification\/scope",
          "passed" : true
        },
        {
          "name" : "native trial cannot inherit reference qualification\/deployment",
          "passed" : true
        },
        {
          "name" : "physical deployment cannot substitute another loader",
          "passed" : true
        },
        {
          "name" : "physical deployment cannot substitute another loader",
          "passed" : true
        },
        {
          "name" : "physical deployment cannot substitute another loader",
          "passed" : true
        },
        {
          "name" : "physical deployment cannot substitute another loader",
          "passed" : true
        },
        {
          "name" : "physical deployment cannot substitute another loader",
          "passed" : true
        },
        {
          "name" : "physical deployment cannot substitute another loader",
          "passed" : true
        },
        {
          "name" : "physical deployment cannot substitute another loader",
          "passed" : true
        },
        {
          "name" : "physical deployment cannot substitute another loader",
          "passed" : true
        },
        {
          "name" : "physical deployment cannot substitute another loader",
          "passed" : true
        },
        {
          "name" : "V2 deployment and prefill contract is exact\/deployment",
          "passed" : true
        },
        {
          "name" : "V2 deployment and prefill contract is exact\/standalone_manifest_sha256",
          "passed" : true
        },
        {
          "name" : "V2 deployment and prefill contract is exact\/standalone_manifest_sha256",
          "passed" : true
        },
        {
          "name" : "V2 deployment and prefill contract is exact\/short_prompt_tokens",
          "passed" : true
        },
        {
          "name" : "V2 deployment and prefill contract is exact\/short_prompt_chunk",
          "passed" : true
        },
        {
          "name" : "V2 deployment and prefill contract is exact\/short_prompt_tokens",
          "passed" : true
        },
        {
          "name" : "V2 deployment and prefill contract is exact\/schema",
          "passed" : true
        },
        {
          "name" : "V2 may explicitly retain the stock Engine policy",
          "passed" : true
        },
        {
          "name" : "applied request prefill survives stats serialization",
          "passed" : true
        },
        {
          "name" : "older statistics remain decodable without the new observation",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "quantization-performance-protocol",
      "passed" : true
    }
  ],
  "failed" : 0,
  "passed" : 1,
  "skipped" : 0
}
```

### practical-v7-quantization-session-framing.json

SHA-256: `b7b241328d36b32200c65291569c1245d59d9fe1ac0064e06630ca07acd3497c`.

```json
{
  "checks" : [
    {
      "items" : [
        {
          "name" : "clean EOF is explicit and contains no request",
          "passed" : true
        },
        {
          "name" : "coalesced frames preserve order",
          "passed" : true
        },
        {
          "name" : "refuse unfinished object",
          "passed" : true
        },
        {
          "name" : "refuse truncated JSON",
          "passed" : true
        },
        {
          "name" : "refuse empty line",
          "passed" : true
        },
        {
          "name" : "refuse array",
          "passed" : true
        },
        {
          "name" : "refuse unbounded unfinished frame",
          "passed" : true
        },
        {
          "name" : "idle input returns control to the resource deadline",
          "passed" : true
        },
        {
          "name" : "V2 admits the explicit app reply limit 4096",
          "passed" : true
        },
        {
          "name" : "V2 refuses incomplete reply reservation 4096\/-1",
          "passed" : true
        },
        {
          "name" : "V2 refuses incomplete reply reservation 4096\/28673",
          "passed" : true
        },
        {
          "name" : "V2 refuses incomplete reply reservation 4096\/9223372036854775807",
          "passed" : true
        },
        {
          "name" : "V2 admits the explicit app reply limit 12288",
          "passed" : true
        },
        {
          "name" : "V2 refuses incomplete reply reservation 12288\/-1",
          "passed" : true
        },
        {
          "name" : "V2 refuses incomplete reply reservation 12288\/20481",
          "passed" : true
        },
        {
          "name" : "V2 refuses incomplete reply reservation 12288\/9223372036854775807",
          "passed" : true
        },
        {
          "name" : "V1 retains its smaller output scope",
          "passed" : true
        },
        {
          "name" : "proposal does not fit an eight-K context",
          "passed" : true
        },
        {
          "name" : "unpriced output limit",
          "passed" : true
        },
        {
          "name" : "unknown protocol version",
          "passed" : true
        },
        {
          "name" : "image protocol separately admits owned vision",
          "passed" : true
        },
        {
          "name" : "full photographs retain their actual preflight reserve",
          "passed" : true
        },
        {
          "name" : "text protocols cannot inherit the larger image budget",
          "passed" : true
        },
        {
          "name" : "image process ceiling stays bounded",
          "passed" : true
        },
        {
          "name" : "image transcripts retain a smaller request envelope",
          "passed" : true
        },
        {
          "name" : "image reply allowance stays explicit",
          "passed" : true
        },
        {
          "name" : "image sessions retain checked draft depths",
          "passed" : true
        },
        {
          "name" : "image session retains deployed vision query tiling",
          "passed" : true
        },
        {
          "name" : "image session retains unpadded tiled vision arithmetic",
          "passed" : true
        },
        {
          "name" : "original-affine4-memory-v1: image plan retains context and complete draft",
          "passed" : true
        },
        {
          "name" : "original-affine4-memory-v1: tower reservation never grows the arena",
          "passed" : true
        },
        {
          "name" : "original-affine4-memory-v1: 846x859 has complete workspace inside target",
          "passed" : true
        },
        {
          "name" : "original-affine4-memory-v1: 1206x1570 has complete workspace inside target",
          "passed" : true
        },
        {
          "name" : "original-affine4-memory-v1: 512x512 has complete workspace inside target",
          "passed" : true
        },
        {
          "name" : "original-affine4-memory-v1: 256x256 has complete workspace inside target",
          "passed" : true
        },
        {
          "name" : "original-affine4-memory-v1: 1536x1536 has complete workspace inside target",
          "passed" : true
        },
        {
          "name" : "affine3-grouped-vision-memory-v1: image plan retains context and complete draft",
          "passed" : true
        },
        {
          "name" : "affine3-grouped-vision-memory-v1: tower reservation never grows the arena",
          "passed" : true
        },
        {
          "name" : "affine3-grouped-vision-memory-v1: 846x859 has complete workspace inside target",
          "passed" : true
        },
        {
          "name" : "affine3-grouped-vision-memory-v1: 1206x1570 has complete workspace inside target",
          "passed" : true
        },
        {
          "name" : "affine3-grouped-vision-memory-v1: 512x512 has complete workspace inside target",
          "passed" : true
        },
        {
          "name" : "affine3-grouped-vision-memory-v1: 256x256 has complete workspace inside target",
          "passed" : true
        },
        {
          "name" : "affine3-grouped-vision-memory-v1: 1536x1536 has complete workspace inside target",
          "passed" : true
        }
      ],
      "measurements" : {
        "affine3-grouped-vision-memory-v1.1206x1570.workspace_bytes" : 426885824,
        "affine3-grouped-vision-memory-v1.1536x1536.workspace_bytes" : 528482304,
        "affine3-grouped-vision-memory-v1.256x256.workspace_bytes" : 14680064,
        "affine3-grouped-vision-memory-v1.512x512.workspace_bytes" : 58720256,
        "affine3-grouped-vision-memory-v1.846x859.workspace_bytes" : 161147808,
        "original-affine4-memory-v1.1206x1570.workspace_bytes" : 426885824,
        "original-affine4-memory-v1.1536x1536.workspace_bytes" : 528482304,
        "original-affine4-memory-v1.256x256.workspace_bytes" : 14680064,
        "original-affine4-memory-v1.512x512.workspace_bytes" : 58720256,
        "original-affine4-memory-v1.846x859.workspace_bytes" : 161147808
      },
      "name" : "quantization-session-framing",
      "passed" : true
    }
  ],
  "failed" : 0,
  "passed" : 1,
  "skipped" : 0
}
```

### practical-quality-v1-protocol/prospective-resource.json

SHA-256: `7a91cf06b47d35ea853770be37e3c26fbcb7ee43a3ebf4e5dc012831b78cfd45`.

```json
{
  "schema": 1,
  "kind": "practical-quality-v1",
  "created_at": "2026-10-05T16:20:01.563117+00:00",
  "scope": "Focused comparison of the same fixed 25 pilot cases using the original and the standalone three-bit native arithmetic. This is descriptive product evidence, not a statistical noninferiority study or speed qualification.",
  "selection_seed": "slotstream-quality-instrument-pilot-2026-10-04-v1",
  "cases_per_family": 5,
  "case_ids": {
    "instruction": [
      "1646",
      "3479",
      "2977",
      "2801",
      "2859"
    ],
    "coding": [
      "509",
      "476",
      "483",
      "138",
      "261"
    ],
    "facts": [
      "813",
      "12847",
      "1667",
      "8530",
      "4257"
    ],
    "multilingual": [
      "63",
      "43",
      "240",
      "184",
      "25"
    ],
    "tools": [
      "multi_turn_base_31",
      "multi_turn_base_39",
      "multi_turn_base_0",
      "multi_turn_base_16",
      "multi_turn_base_95"
    ]
  },
  "model_artifacts": [
    "original",
    "affine3-native"
  ],
  "maximum_model_runs": 10,
  "maximum_concurrent_model_processes": 1,
  "maximum_model_process_bytes": 14000000000,
  "minimum_actual_preflight_bytes": 17000000000,
  "minimum_actual_headroom_bytes": 3000000000,
  "context_reason": "The ordinary app context and multi-turn tool definitions/history require a real 32K admission plan. The explicit fourteen-GB ceiling prices both artifacts independently; physical allocation remains watched.",
  "maximum_run_seconds": 1800,
  "maximum_campaign_seconds": 18000,
  "maximum_tool_steps_per_turn": 8,
  "maximum_tool_calls_per_step": 8,
  "maximum_tool_calls_per_case": 48,
  "maximum_research_staging_bytes": 430000000000,
  "maximum_new_artifact_bytes": 100000000,
  "new_weight_bytes": 0,
  "new_raw_logit_bytes": 0,
  "paid_compute_usd": 0,
  "answer_limits": {
    "instruction": 2048,
    "coding": 1024,
    "facts": 128,
    "multilingual": 1024,
    "tools": 512
  },
  "sampling": "temperature zero, seed seven, default plain answers, two streamed original drafts; reset retained conversation between independent cases",
  "grading": {
    "instruction": "Pinned official IFEval strict prompt-level all-instructions outcome",
    "coding": "Verified restricted MBPP repair cases, native sandbox and exact tests without input mutation",
    "facts": "Exact single option letter",
    "multilingual": "Exact final numeric answer after ####; one language per underlying problem, never count translations as independent",
    "tools": "All user turns, structured calls and actual isolated results; pinned BFCL state/response checker, completed terminal responses and bounded step count"
  },
  "failure_policy": "Preserve failed/truncated model tasks as failures. Abort on infrastructure, identity or resource failure. No outcome-dependent replacements. Exclude every pilot underlying task from final evaluation.",
  "timing_policy": "Record wall time to price the final protocol. No speed qualification from this pilot.",
  "inputs": {
    "tasks_sha256": "3e1c34c5e2e23699658acfc99c3bf1010c083773c39d6f578efa656e6bb0b8db",
    "source_receipt_sha256": "3f9eb69ff7b02a894b862c0f0349184bc4cda90375844c18560e2d08d8215afe",
    "coding_population_sha256": "ffdd8022b4c8c12a49ff614c27ab15b9829bb8de033a0733c232bfab7d515e3a",
    "bfcl_bundle_manifest_sha256": "d684362dd02ae9541651829c6d513b86636f70fa98e9f1c4121f01feaa710850",
    "native_build_identity_sha256": "779367311eb7ab55f7c3e903311c570f85928bf27090163d02a428e7a999986b",
    "task_selection_source": "quality-protocol-pilot-v1/tasks.json; all 25 unchanged cases, no replacements",
    "helpers": {
      "quantization_bfcl.py": "df45b7b932fd32817c5b6e3504cbb2bd69ea1eae10ec55014a8c03c58af04a5c",
      "quantization_code_sandbox.py": "329b0968a3e808e1f6daffaee11a285965474c942844f54ad456d5a9d776cf43",
      "quantization_tasks.py": "002b9b45c9a4d4c65e567594f52832ac19938f0f8f7c044c411e9afa06005013",
      "quantization_inventory.py": "af0220f7dde0b783fd5800ed2f0ee5545ed30bd855cf6d34d6a79820c9ef47cb",
      "quantization_outcomes.py": "28ed136046f837d7adc2a26958a2ea5fad33e62ceee00931047b7d81aac4238e"
    }
  },
  "model_execution_started": false,
  "instruction_worker": {
    "executable": "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "executable_sha256": "e878533ce71a6e91b0fae5e8bbe8baebbb6194dad84fead52e9b42f0620ad011",
    "version": "3.12.9 (main, Feb 12 2025, 15:09:19) [Clang 19.1.6 ]",
    "cache_tag": "cpython-312"
  }
}
```

### practical-quality-v1-protocol/launch-preflight.json

SHA-256: `601435ac49a8d8321d5f528815493cb3ca275c315194370edebcab53db43880f`.

```json
{
  "resource_sha256": "7a91cf06b47d35ea853770be37e3c26fbcb7ee43a3ebf4e5dc012831b78cfd45",
  "driver_sha256": "9541f1230a831b9840481f2039293767474850215bed9626e0e39083c1b6e78c",
  "memory": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33551106048,
    "swapins": 32076,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   573503.\nPages active:                                 870616.\nPages inactive:                              1250007.\nPages speculative:                             50724.\nPages throttled:                                   0.\nPages wired down:                             169332.\nPages purgeable:                                2937.\n\"Translation faults\":                     3924009437.\nPages copy-on-write:                       331330050.\nPages zero filled:                       18356505298.\nPages reactivated:                         501386634.\nPages purged:                               16962366.\nFile-backed pages:                           1471357.\nAnonymous pages:                              699990.\nPages stored in compressor:                   536855.\nPages occupied by compressor:                 170566.\nDecompressions:                            158985428.\nCompressions:                              183226633.\nPageins:                                  5717627282.\nPageouts:                                    2720344.\nSwapins:                                       32076.\nSwapouts:                                     156707.\nPages tagged:                                 140594.\nPages tagged resident:                        113837.\nPages tagged compressed:                       26757.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6485.\nPages tag-storage free:                          693.\nPages tag-storage non-tag pageable:            91118.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3923776.\nTagged compressions:                         1631911.\nTagged decompressions:                       1478955.\n"
  },
  "conditions": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-10-05T16:24:22.117275+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "contention": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 99.3
      }
    ],
    "known_jobs": []
  },
  "scope": "Fifty fresh task outcomes, two arms over the same preselected 25 cases. Functional quality only, no speed qualification, no large statistical campaign or held-out continuation."
}
```

### practical-quality-v1-protocol/grader-preflight.json

SHA-256: `4bacb0e3072db896301d248dedfac3c6491d95dec3950e6d921b3a0bb1ca9988`.

```json
[
  {
    "passed": true,
    "instructions": [
      true
    ],
    "method": "upstream-strict-prompt",
    "peak_worker_bytes": 104153664
  },
  {
    "passed": false,
    "instructions": [
      false
    ],
    "method": "upstream-strict-prompt",
    "peak_worker_bytes": 36258296
  }
]
```

### practical-quality-v1-protocol/facts-session.json

SHA-256: `0b2d850cd1e1f0161d0cfd11407b0e35ede519c84c09c53a489208616d60dae8`.

```json
{
  "schema": 1,
  "kind": "quantization-tool-session-v1",
  "scope": "instrument-check",
  "memory_bytes": 14000000000,
  "context_limit": 32768,
  "output_limit": 128,
  "draft_depth": 2,
  "prefix_cache": true,
  "maximum_requests": 128,
  "maximum_seconds": 1800,
  "seed": 7
}
```

### practical-quality-v1-protocol/multilingual-session.json

SHA-256: `d8228ea1605cd9d94bd6bdf46e811a3560534c212d80edf4175993d9f83b6177`.

```json
{
  "schema": 1,
  "kind": "quantization-tool-session-v1",
  "scope": "instrument-check",
  "memory_bytes": 14000000000,
  "context_limit": 32768,
  "output_limit": 1024,
  "draft_depth": 2,
  "prefix_cache": true,
  "maximum_requests": 128,
  "maximum_seconds": 1800,
  "seed": 7
}
```

### practical-quality-v1-protocol/coding-session.json

SHA-256: `d8228ea1605cd9d94bd6bdf46e811a3560534c212d80edf4175993d9f83b6177`.

```json
{
  "schema": 1,
  "kind": "quantization-tool-session-v1",
  "scope": "instrument-check",
  "memory_bytes": 14000000000,
  "context_limit": 32768,
  "output_limit": 1024,
  "draft_depth": 2,
  "prefix_cache": true,
  "maximum_requests": 128,
  "maximum_seconds": 1800,
  "seed": 7
}
```

### practical-quality-v1-protocol/instruction-session.json

SHA-256: `8d7513730b46fecb4ca1b4b9335cace2e4c95fd8e016535e7ed50093dd2603e9`.

```json
{
  "schema": 1,
  "kind": "quantization-tool-session-v1",
  "scope": "instrument-check",
  "memory_bytes": 14000000000,
  "context_limit": 32768,
  "output_limit": 2048,
  "draft_depth": 2,
  "prefix_cache": true,
  "maximum_requests": 128,
  "maximum_seconds": 1800,
  "seed": 7
}
```

### practical-quality-v1-protocol/tools-session.json

SHA-256: `cf7fc351de5b893a99dd5520e3bc405f1573283990251238b78495ee8195c9d8`.

```json
{
  "schema": 1,
  "kind": "quantization-tool-session-v1",
  "scope": "instrument-check",
  "memory_bytes": 14000000000,
  "context_limit": 32768,
  "output_limit": 512,
  "draft_depth": 2,
  "prefix_cache": true,
  "maximum_requests": 256,
  "maximum_seconds": 1800,
  "seed": 7
}
```

### run-practical-quality-v1.py

SHA-256: `9541f1230a831b9840481f2039293767474850215bed9626e0e39083c1b6e78c`.

```python
from pathlib import Path
import ctypes,ctypes.util,hashlib,importlib.util,json,os,selectors,shutil,subprocess,sys,threading,time,traceback
root=Path(__file__).resolve().parent
repo=root.parent.parent
sys.path.insert(0,str(repo/'Tools'))
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
pilot=root/'practical-quality-v1-protocol'
output=root/'practical-quality-v1';output.mkdir()
frozen=output/'helpers';frozen.mkdir()
for name in ['quantization_bfcl.py','quantization_code_sandbox.py','quantization_tasks.py','quantization_inventory.py']:
 shutil.copy2(repo/'Tools'/name,frozen/name)
shutil.copy2(repo/'Tools/quantization_outcomes.py',frozen/'quantization_outcomes.py')
sys.dont_write_bytecode=True
sys.path.insert(0,str(frozen))
import quantization_bfcl as bfcl
import quantization_outcomes as outcomes

def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
spec=json.loads((pilot/'prospective-resource.json').read_text());tasks=json.loads((pilot/'tasks.json').read_text())
assert sha(pilot/'tasks.json')==spec['inputs']['tasks_sha256']
assert sha(root/'frozen-practical-v7/build-identity.json')==spec['inputs']['native_build_identity_sha256']
binary=root/'frozen-practical-v7/slotstream'
identity=json.loads((binary.parent/'build-identity.json').read_text());assert sha(binary)==identity['binary_sha256']
record={'kind':'practical-quality-v1','complete':False,'qualification':False,'model_runs':0,'runs':[],
 'driver_sha256':sha(__file__),'helpers':{x.name:sha(x) for x in frozen.glob('*.py')},'resource_sha256':sha(pilot/'prospective-resource.json'),
 'native_binary_sha256':sha(binary),'tasks_sha256':sha(pilot/'tasks.json')}
def save():
 temp=output/'receipt.tmp';temp.write_text(json.dumps(record,ensure_ascii=False,indent=2)+'\n');temp.replace(output/'receipt.json')
def check_dependencies():
 runtime_root=root/'heldout-grader-runtime-v1'
 runtime_receipt=json.loads((runtime_root/'verification-receipt-v2.json').read_text())
 for name,value in runtime_receipt['files'].items():
  path=runtime_root/name
  if path.stat().st_size!=value['bytes'] or sha(path)!=value['sha256']:raise ValueError('grader runtime identity changed: '+name)
 source_root=root/'heldout-sources-v1'
 for value in json.loads((source_root/'receipt.json').read_text())['files']:
  if sha(source_root/value['path'])!=value['sha256']:raise ValueError('upstream source identity changed')
 instruction_root=root/'heldout-ifeval-grader-v1'
 for value in json.loads((instruction_root/'receipt.json').read_text())['files']:
  if sha(instruction_root/value['path'])!=value['sha256']:raise ValueError('instruction grader data identity changed')
 for path in (source_root/'ifeval').glob('*.py'):
  if sha(instruction_root/'instruction_following_eval'/path.name)!=sha(path):raise ValueError('instruction grader source differs')
 return {'runtime_files':len(runtime_receipt['files']),'complete':True}
assert {x.name:sha(x) for x in frozen.glob('*.py')}==spec['inputs']['helpers']
instruction_worker=Path(spec['instruction_worker']['executable'])
assert sha(instruction_worker)==spec['instruction_worker']['executable_sha256']
def instruction_grader(case,response,source,runtime):
 return outcomes.isolated_instruction(case,response,source,runtime,worker_executable=instruction_worker,worker_source=frozen/'quantization_outcomes.py')
outcomes.preflight_instruction(instruction_grader,root/'heldout-ifeval-grader-v1',root/'heldout-grader-runtime-v1/packages')
record['dependencies_before']=check_dependencies()
save();campaign_start=time.monotonic()
lib=ctypes.CDLL(ctypes.util.find_library('proc'))

class Session:
 def __init__(self,arm,family,row):
  self.row=row;self.start=time.monotonic();self.error=None;self.stop=threading.Event();self.buffer=bytearray();self.count=0;self.reset_count=0
  protocol=pilot/(family+'-session.json');self.err=(output/f'{family}-{arm}.stderr').open('wb');self.raw=(output/f'{family}-{arm}.stdout').open('wb')
  command=[str(binary),'quantization-session','--baseline',str(Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit'),
   '--protocol-file',str(protocol),'--protocol-sha256',sha(protocol),'--output',str(output/f'{family}-{arm}')]
  if arm=='candidate':
   command[command.index('--baseline')+1]=str(root/'affine-standalone-pack-v1')
   command+=['--standalone-manifest-sha256','8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5','--native-arithmetic']
  environment={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG','VQ_','VQLAB_'))}
  allocated=int(subprocess.check_output(['du','-sk',str(root)],text=True).split()[0])*1024
  if allocated>spec['maximum_research_staging_bytes']:raise RuntimeError('research staging limit')
  row['before']=quiet_preflight(17);row['command']=command;save()
  self.child=subprocess.Popen(command,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=self.err,start_new_session=True,env=environment)
  record['model_runs']+=1;assert record['model_runs']<=10;save()
  os.set_blocking(self.child.stdout.fileno(),False);self.selector=selectors.DefaultSelector();self.selector.register(self.child.stdout,selectors.EVENT_READ)
  self.last_disk_check=0;self.thread=threading.Thread(target=self.monitor,daemon=True);self.thread.start()
  try:row['identity']=self.receive('ready')['identity'];save()
  except BaseException:self.close();raise
 def monitor(self):
  try:
   while not self.stop.wait(.25) and self.child.poll() is None:
    if time.monotonic()-self.start>1800:raise TimeoutError('native session wall deadline')
    if time.monotonic()-self.last_disk_check>5:
     self.last_disk_check=time.monotonic()
     allocated=sum(p.stat().st_blocks*512 for p in output.rglob('*') if p.is_file())
     self.row['peak_run_artifact_bytes']=max(self.row.get('peak_run_artifact_bytes',0),allocated)
     if allocated>100000000:raise RuntimeError('pilot artifact budget exceeded')
     research=int(subprocess.check_output(['du','-sk',str(root)],text=True).split()[0])*1024
     if research>spec['maximum_research_staging_bytes']:raise RuntimeError('research staging limit')
    buffer=ctypes.create_string_buffer(296)
    if lib.proc_pid_rusage(self.child.pid,4,buffer)==0:
     peak=max(int.from_bytes(buffer.raw[72:80],'little'),int.from_bytes(buffer.raw[240:248],'little'))
     self.row['peak_process_bytes']=max(self.row.get('peak_process_bytes',0),peak)
     if peak>14000000000:raise MemoryError('native physical ceiling')
    if vm_snapshot()['reclaimable_bytes']<3000000000:raise MemoryError('lost three GB real headroom')
    if subprocess.check_output(['sysctl','-n','kern.memorystatus_vm_pressure_level'],text=True,timeout=5).strip()!='1':raise MemoryError('OS memory pressure')
  except BaseException as error:
   self.error=error
   if self.child.poll() is None:terminate_child_tree(self.child)
 def receive(self,event):
  while True:
   if self.error:raise self.error
   if b'\n' in self.buffer:
    line,_,tail=self.buffer.partition(b'\n');self.buffer[:]=tail;value=json.loads(line)
    if value.get('event')!=event:raise ValueError('unexpected native event: '+str(value.get('event')))
    return value
   for key,_ in self.selector.select(.1):
    data=os.read(key.fd,8192)
    if not data:raise RuntimeError('native session ended before '+event)
    self.raw.write(data);self.raw.flush();self.buffer.extend(data)
    if len(self.buffer)>2<<20:raise ValueError('native event exceeds its output bound')
 def send(self,value):
  if self.error:raise self.error
  self.child.stdin.write(json.dumps(value,ensure_ascii=False,allow_nan=False).encode()+b'\n');self.child.stdin.flush()
 def chat(self,messages,tools=None):
  self.count+=1;body={'messages':messages}
  if tools:body['tools']=tools
  self.send({'op':'chat','id':f'call-{self.count}','body':body});value=self.receive('response')
  if not value['http_head'].startswith('HTTP/1.1 200'):raise RuntimeError('native request refused: '+json.dumps(value['response'])[:500])
  return value['response']
 def reset(self):
  self.reset_count+=1;self.send({'op':'reset','id':f'reset-{self.reset_count}'});self.receive('reset')
 def finish(self):
  self.send({'op':'finish'});self.child.stdin.close();value=self.receive('complete')['receipt']
  self.child.wait(timeout=30)
  if self.error:raise self.error
  assert self.child.returncode==0 and value['complete'] and value['requests']==self.count and value['resets']==self.reset_count
  self.row['native_receipt']=value
 def close(self):
  if self.child.poll() is None:terminate_child_tree(self.child)
  self.stop.set();self.thread.join(timeout=10)
  self.selector.close();self.err.close();self.raw.close()
  self.row['after']=vm_snapshot();self.row['seconds']=time.monotonic()-self.start

class TaskFailure(Exception):pass

def tool_case(session,case,bundle):
 entry=case['entry'];tools=outcomes.tools_for(entry,root/'heldout-bfcl-source-v1',bfcl.CLASSES)
 history=[{'role':'system','content':'Use the provided tools to complete each user request in the offline fixture. Inspect state when needed, use actual tool results, and finish each request with a concise answer. Do not invent missing information or claim an action succeeded without a tool result.'}]
 turns=[];steps=[];responses=[];calls=0
 try:
  for question in entry['question']:
   history+=question;turn=[];turns.append(turn)
   for _ in range(8):
    response=session.chat(history,tools);responses.append(response);choice=response['choices'][0];message=choice['message'];reason=choice['finish_reason']
    if reason=='stop':
     if message.get('tool_calls'):raise TaskFailure('tool calls after terminal stop')
     history.append(message);break
    if reason!='tool_calls':raise TaskFailure('tool turn did not finish before its output limit')
    raw=message.get('tool_calls')
    if not isinstance(raw,list) or not 1<=len(raw)<=8:raise TaskFailure('tool calls exceed the step bound')
    try:decoded=[bfcl.model_call(x['function']) for x in raw]
    except (ValueError,TypeError,KeyError,json.JSONDecodeError) as error:raise TaskFailure('invalid structured tool arguments: '+str(error))
    calls+=len(decoded)
    if calls>48:raise TaskFailure('tool calls exceed the case bound')
    turn.append(decoded);steps.append(decoded)
    result=bundle.run({'mode':'replay','entry':entry,'steps':steps})
    returned=result['result']['results'][-1]
    assert len(returned)==len(raw)
    history.append(message)
    history += [{'role':'tool','tool_call_id':call['id'],'content':value} for call,value in zip(raw,returned)]
   else:raise TaskFailure('tool steps exceeded their per-turn bound')
  graded=bundle.run({'mode':'grade','entry':entry,'turns':turns,'gold':case['gold']})
  return {'passed':graded['result']['valid'],'grade':graded,'responses':responses,'turns':turns,'history':history,'calls':calls}
 except TaskFailure as error:
  return {'passed':False,'reason':str(error),'responses':responses,'turns':turns,'history':history,'calls':calls}

session=None
try:
 manifest=root/'heldout-bfcl-bundle-manifest-v1.json'
 with bfcl.Bundle(root/'heldout-bfcl-source-v1',root/'heldout-bfcl-runtime-v1',manifest,spec['inputs']['bfcl_bundle_manifest_sha256']) as bundle:
  for family in ['facts','multilingual','coding','instruction','tools']:
   for arm in ['original','candidate']:
    if time.monotonic()-campaign_start>18000:raise TimeoutError('pilot campaign deadline')
    row={'family':family,'arm':arm,'complete':False,'cases':[]};record['runs'].append(row);save()
    session=Session(arm,family,row)
    try:
     for case in tasks[family]:
      session.reset();began=time.monotonic()
      if family=='tools':result=tool_case(session,case,bundle)
      else:
       response=session.chat([{'role':'user','content':case['prompt']}])
       result=instruction_grader(case,response,root/'heldout-ifeval-grader-v1',root/'heldout-grader-runtime-v1/packages') if family=='instruction' else outcomes.grade(family,case,response)
       result['response']=response
      row['cases'].append({'id':case['id'],'seconds':time.monotonic()-began,**result});save()
      print(json.dumps({'family':family,'arm':arm,'case':case['id'],'passed':result['passed'],'seconds':round(time.monotonic()-began,3)}),flush=True)
     session.finish();row['complete']=True
    finally:session.close();session=None;save()
 record['dependencies_after']=check_dependencies()
 record['complete']=True;record['seconds']=time.monotonic()-campaign_start
except BaseException as error:
 record['failure']=type(error).__name__+': '+str(error)
 if session:session.close()
 save();traceback.print_exc();raise
finally:save()
print(json.dumps({'complete':record['complete'],'model_runs':record['model_runs'],'seconds':record.get('seconds')}))
```

