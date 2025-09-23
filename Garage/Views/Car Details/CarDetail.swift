import CoreHaptics
import SwiftUI

struct CarDetail: View {
    var car: Car

    var body: some View {
        List {
            GeneralSection(car: car)
            WarrantySection(car: car)
            PowertrainSection(powertrain: car.powertrain)
            FuelSection(fuel: car.fuel)
            WheelsSection(wheels: car.wheels)
            ServiceSection(services: car.orderedServices)
        }
        .navigationTitle(car.navTitle)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NavigationStack {
        CarDetail(car: Data.cars.first!)
    }
}
