import SwiftUI

struct PowertrainSection: View {
    var powertrain: Powertrain

    var body: some View {
        Section {
            DetailRow(label: "Engine", value: powertrain.engine)
            DetailRow(label: "Engine oil", value: "5.07qt or 4.8L (full synthetic SAE 0W-20)")
            DetailRow(label: "Oil change interval", value: powertrain.oilChangeInterval)
            DetailRow(label: "Coolant fluid", value: "7.4qt or 7L")
            DetailRow(label: "Brake fluid", value: "0.74qt or 0.7L")
            DetailRow(label: "Transmision", value: powertrain.transmission)
        } header: {
            HStack {
                Image(systemName: "engine.combustion")
                Text("Powertrain".uppercased())
            }
        }
    }
}

#Preview("Powertrain (light)") {
    List {
        PowertrainSection(powertrain: Data.cars.first!.powertrain)
            .preferredColorScheme(.light)
    }
}

#Preview("Powertrain (dark)") {
    List {
        PowertrainSection(powertrain: Data.cars.first!.powertrain)
            .preferredColorScheme(.dark)
    }
}
