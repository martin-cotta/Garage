import Foundation

struct Fuel: Identifiable, Decodable {
    /// Stable identity
    var id = UUID()

    /// Type of fuel
    let type: Record<String>

    /// The minimum octane rating
    let octaneRating: Record<String>

    /// Tank capacity in gallons
    let capacity: Record<Double>

    /// Highway fuel efficiency in miles per gallon
    let highwayFuelEfficiency: Record<Double>

    /// City fuel efficiency in miles per gallon
    let cityFuelEfficiency: Record<Double>
}

extension Fuel {
    /// Tank capacity in liters
    var capacityL: Record<Double> {
        let measure = capacityMeasure.converted(to: .liters)
        return .init(label: "Tank capacity in liters", value: measure.value)
    }

    var highwayFuelEfficiencyL: Record<Double> {
        let measure = highwayFuelEfficiencyMeasure.converted(to: .litersPer100Kilometers)
        return .init(label: "Highway fuel efficiency in liters per km", value: measure.value)
    }

    var cityFuelEfficiencyL: Record<Double> {
        let measure = cityFuelEfficiencyMeasure.converted(to: .litersPer100Kilometers)
        return .init(label: "City fuel efficiency in liters per km", value: measure.value)
    }

    var capacitySummary: Record<String> {
        let formatted = capacityL.value.formatted(.number.precision(.fractionLength(2)))
        let value = "\(capacity.value) gallons or \(formatted) liters"
        return .init(label: "Tank capacity", value: value)
    }

    var highwayFuelEfficiencySummary: Record<String> {
        let value = "\(highwayFuelEfficiency.value) mpg or \(highwayFuelEfficiencyL.value) L/100km"
        return .init(label: "Highway fuel efficiency", value: value)
    }

    var cityFuelEfficiencySummary: Record<String> {
        let value = "\(cityFuelEfficiency.value) mpg or \(cityFuelEfficiencyL.value) L/100km"
        return .init(label: "City fuel efficiency", value: value)
    }

    // MARK: - Private

    private var capacityMeasure: Measurement<UnitVolume> {
        Measurement(value: capacity.value, unit: UnitVolume.gallons)
    }

    private var highwayFuelEfficiencyMeasure: Measurement<UnitFuelEfficiency> {
        Measurement(value: highwayFuelEfficiency.value, unit: UnitFuelEfficiency.milesPerGallon)
    }

    private var cityFuelEfficiencyMeasure: Measurement<UnitFuelEfficiency> {
        Measurement(value: cityFuelEfficiency.value, unit: UnitFuelEfficiency.milesPerGallon)
    }
}
