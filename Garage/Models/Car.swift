import Foundation

struct Car: Identifiable, Decodable {
    var id = UUID()
    let name: String
    let desc: String
    let purchaseDate: Date
    let manufactureDate: Date
    let year: Int
    let brand: String
    let model: String
    let color: String
    let vin: String
    let fuel: Fuel
    let powertrain: Powertrain
    let services: [Service]
    let wheels: Wheels
}

extension Car {
    var logoImageName: String {
        "\(brand)-logo".lowercased()
    }

    var imageName: String {
        "\(brand)-\(model)".lowercased()
    }

    var navTitle: String {
        "\(year) \(brand) \(model)"
    }

    var orderedServices: [Service] {
        services.sorted { $0.date > $1.date }
    }
}
