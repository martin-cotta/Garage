import SwiftUI

struct WheelsSection: View {
    var wheels: Wheels

    var body: some View {
        Section {
            DetailRow(label: "Rims", value: wheels.rims)
            DisclosureGroup {
                Text(wheels.tireSpecs)
                    .foregroundStyle(.secondary)
                    .padding(.leading, -20)
            } label: {
                DetailRow(label: "Tires", value: wheels.tires)
            }
            DetailRow(label: "Tire pressure", value: wheels.preasureLabel)

        } header: {
            HStack {
                Image(systemName: "tire")
                Text("Wheels".uppercased())
            }
        }
    }
}

#Preview {
    List {
        WheelsSection(wheels: Data.cars.first!.wheels)
    }
}
