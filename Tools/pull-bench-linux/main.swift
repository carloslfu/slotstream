import ArgumentParser
struct PullBench: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "pullbench", abstract: "slotstream's pull, built on Linux for bandwidth measurement",
        subcommands: [Pull.self, PullCheck.self])
}
PullBench.main()
