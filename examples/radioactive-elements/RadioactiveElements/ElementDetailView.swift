import SwiftUI

/// The detail view for one element: the same fields v1 filled from
/// `didSelectRowAt`, now as labelled sections instead of loose
/// storyboard labels.
struct ElementDetailView: View {
    let element: Element

    var body: some View {
        List {
            Section("Element") {
                LabeledContent("Symbol", value: element.symbol)
                LabeledContent("Name", value: element.name)
            }
            Section("Atomic data") {
                LabeledContent("Atomic number", value: "\(element.atomicNumber)")
                LabeledContent("Atomic weight", value: "\(element.atomicWeight)")
            }
            Section("Temperatures (°F)") {
                LabeledContent(
                    "Melting point",
                    value: Element.temperatureText(element.meltingPointFahrenheit)
                )
                LabeledContent(
                    "Boiling point",
                    value: Element.temperatureText(element.boilingPointFahrenheit)
                )
            }
            Section("Discovery") {
                LabeledContent("Year discovered", value: "\(element.discoveryYear)")
                Text(element.notes)
            }
        }
        .navigationTitle(element.name)
    }
}
