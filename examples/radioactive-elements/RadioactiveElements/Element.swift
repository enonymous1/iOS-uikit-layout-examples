import Foundation

/// One radioactive element, as stored in the bundled JSON.
///
/// Temperatures are in Fahrenheit, exactly as v1 labelled them, and
/// a missing temperature decodes to `nil` (shown as "N/A" in the
/// detail view) instead of a made-up number. The v1 name "Actinum"
/// is corrected to "Actinium" here; every other name, figure, and
/// note is carried over unchanged from v1.
struct Element: Codable, Equatable, Hashable, Identifiable, Sendable {
    let symbol: String
    let name: String
    let atomicNumber: Int
    let atomicWeight: Double
    let meltingPointFahrenheit: Double?
    let boilingPointFahrenheit: Double?
    let notes: String
    let discoveryYear: Int

    var id: String { symbol }

    /// Text searched by the list filter: symbol, name, and notes.
    var searchableText: String {
        "\(symbol) \(name) \(notes)".lowercased()
    }

    /// A temperature as v1 displayed it: a whole number with no
    /// decimal point, otherwise its full value, or "N/A" when nil.
    static func temperatureText(_ value: Double?) -> String {
        guard let value else { return "N/A" }
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(value)) °F"
        }
        return "\(value) °F"
    }

    /// Decodes a whole element file. Kept as a pure function so the
    /// tests can exercise it without touching the app bundle.
    static func load(from data: Data) throws -> [Element] {
        try JSONDecoder().decode([Element].self, from: data)
    }
}
