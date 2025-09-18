import Foundation

struct Wheels: Identifiable, Codable {
    var id = UUID()

    /// Rims information
    let rims: String

    /// Tires information
    let tires: String

    /// Tire pressure in PSI
    let pressure: Double

    /// Tire specs
    let tireSpecs: String
}

extension Wheels {
    var psiMeasure: Measurement<UnitPressure> {
        .init(value: pressure, unit: UnitPressure.poundsForcePerSquareInch)
    }

    var kPaMeasure: Measurement<UnitPressure> {
        psiMeasure.converted(to: .kilopascals)
    }

    var barMeasure: Measurement<UnitPressure> {
        psiMeasure.converted(to: .bars)
    }
}

extension Wheels {
    var preasureLabel: String {
        let psi = psiMeasure.value
        let kPa = kPaMeasure.value
        let bar = barMeasure.value
        let psiString = "\(psi.formatted()) psi"
        let kPaString = "\(kPa.formatted(.number.precision(.fractionLength(2)))) kPa"
        let barString = "\(bar.formatted(.number.precision(.fractionLength(2)))) bar"

        return "\(psiString), \(kPaString), \(barString)"
    }
}
