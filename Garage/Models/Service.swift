import Foundation

struct Service: Identifiable, Decodable {
    var id = UUID()

    /// Date of service
    let date: Date

    /// Milage on date of service
    let miles: Int

    /// Service details
    let details: String
}

// TODO: add service shop, person, codes, recomendations
