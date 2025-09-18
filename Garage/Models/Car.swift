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
    let powertrain: Powertrain
    let wheels: Wheels
    let services: [Service]
    let fuel: Fuel

    //
    // Vehicle details
    // ---------------
    // Category Standard Sport Utility Vehicle
    // Engine 2.0-L L-4 DOHC 16V
    // Engine Size 2
    // Trim X-Line
    // Steering Type Rack & Pinion
    // Anti Brake System 4-Wheel ABS
    // Overall Length 172.60 inches
    // Standard Seating 5
    // Driven Wheels All-Wheel Drive
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
