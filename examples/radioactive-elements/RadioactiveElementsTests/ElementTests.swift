import Foundation
import Testing

@testable import RadioactiveElements

@Suite("Element decoding and display")
struct ElementTests {
    @Test("Decodes the bundled element fields, including nil temperatures")
    func decodesFields() throws {
        let json = """
        [
          {
            "symbol": "Rn",
            "name": "Radon",
            "atomicNumber": 86,
            "atomicWeight": 222,
            "meltingPointFahrenheit": null,
            "boilingPointFahrenheit": null,
            "notes": "A radioactive gas.",
            "discoveryYear": 1898
          }
        ]
        """
        let elements = try Element.load(from: Data(json.utf8))
        #expect(elements.count == 1)
        #expect(elements[0].symbol == "Rn")
        #expect(elements[0].atomicNumber == 86)
        #expect(elements[0].meltingPointFahrenheit == nil)
        #expect(elements[0].boilingPointFahrenheit == nil)
    }

    @Test("Temperature text matches v1: whole numbers without decimals, nil as N/A")
    func temperatureText() {
        #expect(Element.temperatureText(nil) == "N/A")
        #expect(Element.temperatureText(2070) == "2070 °F")
        #expect(Element.temperatureText(1182.9) == "1182.9 °F")
    }

    @Test("Element identity is its symbol")
    func identity() {
        let element = Element(
            symbol: "Pu", name: "Plutonium", atomicNumber: 94,
            atomicWeight: 244, meltingPointFahrenheit: 1182.9,
            boilingPointFahrenheit: 5842, notes: "", discoveryYear: 1941
        )
        #expect(element.id == "Pu")
        #expect(element.searchableText.contains("plutonium"))
    }
}
