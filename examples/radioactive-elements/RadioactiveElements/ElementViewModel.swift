import Foundation
import Observation

/// Why the bundled element data could not be loaded, in words the
/// UI can show instead of v1's silent failure modes.
enum ElementLoadError: LocalizedError {
    case missingBundleResource

    var errorDescription: String? {
        switch self {
        case .missingBundleResource:
            return "The element data file is missing from the app bundle."
        }
    }
}

/// Loads the bundled elements and filters them for the list view.
///
/// Loading runs the file read off the main actor; decoding a small
/// bundled file on the main actor is fine, and the result is
/// published through `@Observable` so the list updates without any
/// storyboard glue. `init(elements:)` exists so tests can build a view
/// model without touching the bundle.
@MainActor
@Observable
final class ElementViewModel {
    private(set) var elements: [Element] = []
    private(set) var loadError: Error?
    private(set) var isLoading = false
    private(set) var hasLoaded = false

    var searchText = ""

    init(elements: [Element] = []) {
        self.elements = elements
        hasLoaded = !elements.isEmpty
    }

    /// The list rows, in file order, filtered by the search field.
    /// An empty or whitespace-only search shows everybody.
    var filteredElements: [Element] {
        let needle = searchText
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
        guard !needle.isEmpty else { return elements }
        return elements.filter { $0.searchableText.contains(needle) }
    }

    func load() async {
        guard !hasLoaded else { return }
        isLoading = true
        defer { isLoading = false }
        do {
            guard let url = Bundle.main.url(
                forResource: "ElementData",
                withExtension: "json"
            ) else {
                throw ElementLoadError.missingBundleResource
            }
            let data = try await Task.detached {
                try Data(contentsOf: url)
            }.value
            elements = try Element.load(from: data)
            hasLoaded = true
        } catch {
            loadError = error
            hasLoaded = true
        }
    }

    func retry() async {
        loadError = nil
        hasLoaded = false
        await load()
    }
}
