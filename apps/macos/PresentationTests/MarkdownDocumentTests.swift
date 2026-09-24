import Foundation
import AppKit
import SevraPresentation

final class MarkdownDocumentTests {
    func render(_ source: String, citations: Set<String> = []) -> RenderedDocument {
        MarkdownDocumentRenderer().render([DocumentSection(id: "message", source: source, citationIDs: citations)], style: DocumentStyle())
    }
    func testRichBlocksAndExactCode() throws {
        let source = "# A clear heading\n\nA **bold** and *emphasized* statement with `code`.\n\n- First\n  - Nested\n- Second\n\n> Quoted evidence\n\n```swift\nlet café = \"hello 👋\"\n  print(café)\n```\n\n| Name | Value |\n| :--- | ---: |\n| Maya | 400 |\n"
        let result = render(source)
        checkTrue(result.text.string.contains("A clear heading"))
        checkFalse(result.text.string.contains("**bold**"))
        checkTrue(result.text.string.contains("•\tNested"))
        checkEqual(result.regions.first(where: { $0.kind == .code })?.copyText, "let café = \"hello 👋\"\n  print(café)\n")
        checkEqual(result.regions.filter { $0.kind == .heading }.count, 1)
        let bold = (result.text.string as NSString).range(of: "bold")
        checkTrue((result.text.attribute(.font, at: bold.location, effectiveRange: nil) as? NSFont)?.fontDescriptor.symbolicTraits.contains(.bold) == true)
        let tableCell = (result.text.string as NSString).range(of: "Maya")
        checkTrue((result.text.attribute(.paragraphStyle, at: tableCell.location, effectiveRange: nil) as? NSParagraphStyle)?.textBlocks.first is NSTextTableBlock)
        let copy = (result.text.string as NSString).range(of: "Copy code")
        let region = result.regions.first { $0.kind == .code }!
        checkEqual(result.text.attribute(.link, at: copy.location, effectiveRange: nil) as? URL, MarkdownDocumentRenderer.codeCopyURL(sectionID: "message", sourceOffset: region.source.lowerBound))
        checkTrue(render("I'll keep -- literal punctuation.").text.string.contains("I'll keep -- literal"))
    }
    func testHistoryWindowsDoNotSkipOrAccumulate() {
        let sizes = (0..<203).map { $0.isMultiple(of: 9) ? 300_000 : 12_000 }
        var end = sizes.count, seen: [Int] = []
        while end > 0 { let page = HistoryPage.range(byteCounts: sizes, endingAt: end); checkTrue(page.count <= 80); seen += page.reversed(); end = page.lowerBound }
        checkEqual(seen, Array((0..<sizes.count).reversed()))
        var start = 0; seen = []
        while start < sizes.count { let end = HistoryPage.nextEnd(byteCounts: sizes, startingAt: start); seen += Array(start..<end); start = end }
        checkEqual(seen, Array(0..<sizes.count))
        checkEqual(HistoryPage.range(byteCounts: [1_000_000], endingAt: nil), 0..<1)
    }
    func testHTMLImagesAndUnsafeLinksNeverBecomeExecutable() {
        let result = render("<script>alert('bad')</script>\n\n[unsafe](javascript:alert) [file](file:///secret) ![remote](https://example.com/image.png) [safe](https://example.com/page)")
        checkTrue(result.text.string.contains("<script>"))
        checkTrue(result.text.string.contains("[Image: remote]"))
        var links: [URL] = []
        result.text.enumerateAttribute(.link, in: NSRange(location: 0, length: result.text.length)) { value, _, _ in if let u = value as? URL { links.append(u) } }
        checkEqual(Set(links.map { $0.scheme! }), ["https"])
        checkFalse(links.contains { $0.isFileURL })
        checkNil(MarkdownDocumentRenderer.externalURL("https://user:password@example.com"))
    }
    func testCitationsOnlyForOwnerSuppliedIDs() {
        let result = render("A claim [S1], an invented claim [S2].", citations: ["S1"])
        let valid = (result.text.string as NSString).range(of: "[S1]")
        let invalid = (result.text.string as NSString).range(of: "[S2]")
        checkEqual((result.text.attribute(.link, at: valid.location, effectiveRange: nil) as? URL)?.scheme, "sevra-citation")
        checkNil(result.text.attribute(.link, at: invalid.location, effectiveRange: nil))
    }
    func testSectionReuseAndLateReferences() {
        let renderer = MarkdownDocumentRenderer(), style = DocumentStyle()
        let first = DocumentSection(id: "first", source: "# Stable\n\nAlready read.")
        let incomplete = DocumentSection(id: "second", source: "[Reference][ref]")
        checkEqual(renderer.render([first, incomplete], style: style).parsedSections, 2)
        let completed = DocumentSection(id: "second", source: incomplete.source + "\n\n[ref]: https://example.com\n")
        let next = renderer.render([first, completed], style: style)
        checkEqual(next.parsedSections, 1)
        let link = (next.text.string as NSString).range(of: "Reference")
        checkEqual((next.text.attribute(.link, at: link.location, effectiveRange: nil) as? URL)?.host, "example.com")
        checkEqual(renderer.render([first, completed], style: style).parsedSections, 0)
    }
    func testSourceCoordinatesAndSourceModePreserveUnicode() {
        let source = "👩🏽‍💻 café\n\n## 中文 heading\n\nשלום **עולם**\n"
        let result = render(source), bytes = Array(source.utf8)
        let heading = result.regions.first { $0.kind == .heading }!
        checkEqual(String(decoding: bytes[heading.source], as: UTF8.self), "## 中文 heading")
        let raw = MarkdownDocumentRenderer().render([DocumentSection(id: "one", source: source)], style: DocumentStyle(sourceMode: true))
        checkTrue(raw.text.string.hasPrefix(source))
    }
    func testMalformedAndBoundedDocumentsPreserveReadableSource() {
        for source in ["**unfinished", "```swift\nlet x = 1", "[broken](", String(repeating: "> ", count: 45) + "deep"] {
            checkGreater(render(source).text.length, 0)
        }
        let large = String(repeating: "x", count: 262145)
        let result = render(large)
        checkFalse(result.notices.isEmpty)
        checkTrue(result.text.string.hasPrefix(large))
        let wide = "|" + (0..<21).map { " c\($0) |" }.joined() + "\n|" + String(repeating: "---|", count: 21) + "\n"
        let table = render(wide)
        checkFalse(table.notices.isEmpty)
        checkTrue(table.text.string.contains("---|"))
    }
    func testAnnotationsStayOutsideTheMessage() {
        let link = URL(string: "sevra-response://run/thread/run")!
        let section = DocumentSection(id: "reply", speaker: "Sevra", source: "The answer is **42**.",
            lead: DocumentAnnotation(text: "Thought for 8 s ›", link: link, help: "Show details"),
            trail: DocumentAnnotation(text: "14.2 tok/s · 318 tokens", link: link), details: link)
        let result = MarkdownDocumentRenderer().render([section], style: DocumentStyle())
        let text = result.text.string as NSString
        let lead = text.range(of: "Thought for 8 s ›"), body = text.range(of: "The answer is"), trail = text.range(of: "14.2 tok/s")
        checkTrue(lead.location != NSNotFound && body.location != NSNotFound && trail.location != NSNotFound)
        checkTrue(lead.location < body.location && body.location < trail.location)
        checkEqual(result.text.attribute(.link, at: lead.location, effectiveRange: nil) as? URL, link)
        checkEqual(result.text.attribute(.link, at: trail.location, effectiveRange: nil) as? URL, link)
        checkNil(result.text.attribute(.link, at: NSMaxRange(lead), effectiveRange: nil))
        checkNil(result.text.attribute(.underlineStyle, at: lead.location, effectiveRange: nil))
        checkEqual(result.text.attribute(.toolTip, at: lead.location, effectiveRange: nil) as? String, "Show details")
        // Quiet like the speaker's name, never like body text or a text link.
        checkEqual(result.text.attribute(.foregroundColor, at: lead.location, effectiveRange: nil) as? NSColor, result.text.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? NSColor)
        checkFalse(result.regions.contains { NSLocationInRange(lead.location, $0.display) || NSLocationInRange(trail.location, $0.display) })
        checkEqual(section.source, "The answer is **42**.")
        // Text links keep their own underline now that the view no longer adds one.
        let code = render("```\nx\n```")
        let copy = (code.text.string as NSString).range(of: "Copy code")
        checkEqual(code.text.attribute(.underlineStyle, at: copy.location, effectiveRange: nil) as? Int, NSUnderlineStyle.single.rawValue)
    }
    /// A streaming reply replaces only its changed paragraphs, even with emoji
    /// and tables earlier on the page; a page that drops its first message
    /// replaces everything.
    func testStreamingKeepsUnchangedText() {
        let renderer = MarkdownDocumentRenderer(), style = DocumentStyle()
        let emoji = DocumentSection(id: "a", speaker: "You", source: "Plans for the trip 👩🏽‍💻 🇨🇴 café")
        let table = DocumentSection(id: "b", speaker: "Sevra", source: "| City | Days |\n| --- | ---: |\n| Popayán | 3 |\n")
        var reply = DocumentSection(id: "c", speaker: "Sevra", source: "First paragraph stays.\n\nSecond grows")
        let first = renderer.render([emoji, table, reply], style: style)
        reply.source += " with more words"
        let second = renderer.render([emoji, table, reply], style: style)
        let kept = RenderedDocument.unchangedPrefix(from: first, to: second, displayedLength: first.text.length)
        let replyStart = first.spans[0].length + first.spans[1].length
        let secondParagraph = (second.text.string as NSString).range(of: "Second grows").location
        checkEqual(kept, secondParagraph)
        checkGreater(kept, replyStart)
        checkTrue(second.text.attributedSubstring(from: NSRange(location: 0, length: kept)).isEqual(to: first.text.attributedSubstring(from: NSRange(location: 0, length: kept))))
        // Unchanged sections are reused, not re-rendered.
        checkTrue(first.spans[0] == second.spans[0] && first.spans[1] == second.spans[1])
        checkFalse(first.spans[2] == second.spans[2])
        // A page that starts one message later shares nothing at the front.
        let shifted = renderer.render([table, reply], style: style)
        checkEqual(RenderedDocument.unchangedPrefix(from: second, to: shifted, displayedLength: second.text.length), 0)
        // Nothing known on screen, or a view whose text differs, keeps nothing.
        checkEqual(RenderedDocument.unchangedPrefix(from: nil, to: second, displayedLength: 0), 0)
        checkEqual(RenderedDocument.unchangedPrefix(from: first, to: second, displayedLength: first.text.length + 1), 0)
        // An identical render keeps everything.
        let same = renderer.render([emoji, table, reply], style: style)
        checkEqual(RenderedDocument.unchangedPrefix(from: second, to: same, displayedLength: second.text.length), second.text.length)
    }
    /// New messages extend the latest page instead of shifting its start,
    /// until it holds half again its bounds, or twice them while reading earlier.
    func testLatestPageKeepsItsStart() {
        let page = LatestPage()
        var ids = (0..<100).map { "m\($0)" }, counts = Array(repeating: 100, count: 100)
        checkEqual(page.range(ids: ids, byteCounts: counts, threadID: "t"), 20..<100)
        for n in 100..<140 { ids.append("m\(n)"); counts.append(100) }
        checkEqual(page.range(ids: ids, byteCounts: counts, threadID: "t"), 20..<140)
        ids.append("m140"); counts.append(100)
        checkEqual(page.range(ids: ids, byteCounts: counts, threadID: "t"), 61..<141)
        for n in 141..<180 { ids.append("m\(n)"); counts.append(100) }
        checkEqual(page.range(ids: ids, byteCounts: counts, threadID: "t", readingEarlier: true), 61..<180)
        checkEqual(page.range(ids: ids, byteCounts: counts, threadID: "other"), 100..<180)
        // A page over its byte bound moves on at once.
        let large = LatestPage()
        var big = Array(repeating: 10_000, count: 100)
        let first = large.range(ids: ids.prefix(100).map { $0 }, byteCounts: big, threadID: "t")
        big += Array(repeating: 200_000, count: 5)
        checkEqual(large.range(ids: ids.prefix(105).map { $0 }, byteCounts: big, threadID: "t"), HistoryPage.range(byteCounts: big, endingAt: nil))
        checkEqual(first, HistoryPage.range(byteCounts: Array(big.prefix(100)), endingAt: nil))
    }
    func testBoundedHistoryRenderSamples() {
        let renderer = MarkdownDocumentRenderer()
        let source = "## Update\n\nA **clear** paragraph with a [source](https://example.com).\n\n- Read\n- Review\n- Save\n\n```swift\nlet value = 42\n```\n"
        let page = (0..<80).map { DocumentSection(id: "m\($0)", speaker: "Sevra", source: source) }
        var samples: [Double] = []
        for i in 0..<20 {
            var updated = page; updated[79].source += "\nStreaming update \(i)"
            let start = ProcessInfo.processInfo.systemUptime
            let result = renderer.render(updated, style: DocumentStyle())
            samples.append((ProcessInfo.processInfo.systemUptime - start) * 1000)
            checkEqual(result.parsedSections, i == 0 ? 80 : 1)
            checkGreater(result.text.length, 0)
        }
        print("PRESENTATION_RENDER_MS " + samples.map { String(format: "%.3f", $0) }.joined(separator: ","))
    }
}

private var failures = 0
func checkTrue(_ value: @autoclosure () -> Bool, file: String = #file, line: Int = #line) { if !value() { failures += 1; print("FAIL \(file):\(line)") } }
func checkFalse(_ value: @autoclosure () -> Bool, file: String = #file, line: Int = #line) { checkTrue(!value(), file: file, line: line) }
func checkEqual<T: Equatable>(_ a: T, _ b: T, file: String = #file, line: Int = #line) { if a != b { failures += 1; print("FAIL \(file):\(line) \(a) != \(b)") } }
func checkNil<T>(_ value: T?, file: String = #file, line: Int = #line) { checkTrue(value == nil, file: file, line: line) }
func checkGreater<T: Comparable>(_ a: T, _ b: T, file: String = #file, line: Int = #line) { checkTrue(a > b, file: file, line: line) }
@main struct PresentationChecks {
    static func main() throws {
        let checks = MarkdownDocumentTests()
        try checks.testRichBlocksAndExactCode()
        checks.testHistoryWindowsDoNotSkipOrAccumulate()
        checks.testHTMLImagesAndUnsafeLinksNeverBecomeExecutable()
        checks.testCitationsOnlyForOwnerSuppliedIDs()
        checks.testSectionReuseAndLateReferences()
        checks.testSourceCoordinatesAndSourceModePreserveUnicode()
        checks.testMalformedAndBoundedDocumentsPreserveReadableSource()
        checks.testAnnotationsStayOutsideTheMessage()
        checks.testStreamingKeepsUnchangedText()
        checks.testLatestPageKeepsItsStart()
        checks.testBoundedHistoryRenderSamples()
        print(failures == 0 ? "PASS: native Markdown structure, exact code, table attributes, inert HTML/images, link/citation boundaries, Unicode source coordinates, late references, cache reuse, limits, message annotations and streaming replacement bounds" : "Presentation checks failed: \(failures)")
        exit(failures == 0 ? 0 : 1)
    }
}
