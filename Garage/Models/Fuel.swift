import Foundation

struct Fuel: Identifiable, Decodable {
    /// Stable identity
    var id = UUID()

    /// Type of fuel
    let type: String

    /// The recomended octane rating/number
    let octaneRating: String

    /// Tank capacity in gallons
    let capacity: Double

    /// Highway fuel efficiency in miles per gallon
    let highwayFuelEfficiency: Double

    /// City fuel efficiency in miles per gallon
    let cityFuelEfficiency: Double
}

extension Fuel {
    var capacityLabel: String {
        "\(capacity) gallons or \(convertToLiters(gallons: capacity).formatted()) liters"
    }

    var highwayMileageString: String {
        let mpg = "\(highwayFuelEfficiency) mpg"
        let lp100km = "\(convertToLitersPer100km(milesPerGallon: highwayFuelEfficiency).formatted()) L/100km"

        return "\(mpg) or \(lp100km)"
    }

    var cityMileageString: String {
        let mpg = "\(cityFuelEfficiency) mpg"
        let lp100km = "\(convertToLitersPer100km(milesPerGallon: cityFuelEfficiency).formatted()) L/100km"

        return "\(mpg) or \(lp100km)"
    }

    private func convertToLiters(gallons: Double) -> Double {
        let gallonsMeasurement = Measurement(value: gallons, unit: UnitVolume.gallons)
        let litersMeasurement = gallonsMeasurement.converted(to: UnitVolume.liters)
        return litersMeasurement.value.rounded(.up)
    }

    private func convertToLitersPer100km(milesPerGallon: Double) -> Double {
        let mpgMeasurement = Measurement(
            value: milesPerGallon,
            unit: UnitFuelEfficiency.milesPerGallon)
        let litersPer100Km = mpgMeasurement.converted(to: UnitFuelEfficiency.litersPer100Kilometers)
        return litersPer100Km.value.rounded(.up)
    }
}
