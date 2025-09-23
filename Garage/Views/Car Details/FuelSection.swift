import SwiftUI

struct FuelSection: View {
    var fuel: Fuel

    var body: some View {
        Section {
            DetailRow2(record: fuel.type)
            DetailRow(label: fuel.octaneRating.label, value: fuel.octaneRating.value) {
                VStack(alignment: .leading) {
                    Text("AKI or (R+M)/2")
                        .font(.headline)
                        .padding(.bottom, 4)
                    Text(
                        """
                        In Canada, The United States, and Mexico, 
                        the advertised octane rating is 
                        the average of the **RON** and the **MON**, 
                        called the Anti-Knock Index (**AKI**).
                        It is often written on pumps as **(R+M)/2**. 
                        **AKI** is also sometimes called **PON**.
                        """)
                    Divider()
                    Group {
                        Text("**AKI** Anti-Knock Index")
                        Text("**PON** Pump Octane Number")
                        Text("**RON** Research Octane Number")
                        Text("**MON** Motor Octane Number")
                    }
                    .foregroundStyle(.secondary)
                }
            }
            DetailRow2(record: fuel.capacitySummary)
            DetailRow2(record: fuel.cityFuelEfficiencySummary)
            DetailRow2(record: fuel.highwayFuelEfficiencySummary)
        } header: {
            HStack {
                Image(systemName: "fuelpump")
                Text("Fuel".uppercased())
            }
        }
    }
}

#Preview("Fuel section (light)") {
    List {
        FuelSection(fuel: Data.cars.first!.fuel)
    }
    .preferredColorScheme(.light)
}

#Preview("Fuel section (dark)") {
    List {
        FuelSection(fuel: Data.cars.first!.fuel)
    }
    .preferredColorScheme(.dark)
}
