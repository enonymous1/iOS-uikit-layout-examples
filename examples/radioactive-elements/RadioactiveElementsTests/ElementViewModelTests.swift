import Foundation
import Testing

@testable import RadioactiveElements

@MainActor
@Suite("Element list filtering")
struct ElementViewModelTests {
    private func sampleModel() -> ElementViewModel {
        ElementViewModel(elements: [
            Element(
                symbol: "Pu", name: "Plutonium", atomicNumber: 94,
                atomicWeight: 244, meltingPointFahrenheit: 1182.9,
                boilingPointFahrenheit: 5842, notes: "Bombardment of uranium.",
                discoveryYear: 1941
            ),
            Element(
                symbol: "U", name: "Uranium", atomicNumber: 92,
                atomicWeight: 238.02891, meltingPointFahrenheit: 2070,
                boilingPointFahrenheit: 4404, notes: "Pitchblende.",
                discoveryYear: 1789
            ),
        ])
    }

    @Test("Empty search shows everybody, in file order")
    func emptySearchShowsAll() {
        let model = sampleModel()
        model.searchText = ""
        #expect(model.filteredElements.map(\.symbol) == ["Pu", "U"])
    }

    @Test("Search matches symbol, name, and notes, case-insensitively")
    func searchMatchesFields() {
        let model = sampleModel()
        model.searchText = "pitchblende"
        #expect(model.filteredElements.map(\.symbol) == ["U"])
        model.searchText = "PU"
        #expect(model.filteredElements.map(\.symbol) == ["Pu"])
    }

    @Test("Whitespace-only search shows everybody, and no match shows nobody")
    func searchEdgeCases() {
        let model = sampleModel()
        model.searchText = "   "
        #expect(model.filteredElements.count == 2)
        model.searchText = "zzz-no-such-element"
        #expect(model.filteredElements.isEmpty)
    }
}
