import Foundation

struct Powertrain: Identifiable, Codable {
    var id = UUID()
    let engine: String
    let transmission: String
}
