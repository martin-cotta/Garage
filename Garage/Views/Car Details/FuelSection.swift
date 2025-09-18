import SwiftUI

struct FuelSection: View {
    @State private var isExpanded = true
    var fuel: Fuel

    var body: some View {
        Section(isExpanded: $isExpanded) {
            DetailRow(label: "Type", value: fuel.type)
            DetailRow(label: "Octane number", value: fuel.octaneRating) {
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
            DetailRow(label: "Tank capacity", value: fuel.capacityLabel)
            DetailRow(label: "City mileage efficiency", value: fuel.cityMileageString)
            DetailRow(label: "Highway mileage efficiency", value: fuel.highwayMileageString)
        } header: {
            HStack {
                Image(systemName: "fuelpump")
                Text("Fuel".uppercased())
                Spacer()
                Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                    .onTapGesture {
                        isExpanded.toggle()
                    }
            }
        }
    }
}

#Preview("Fuel section (light)") {
    List {
        FuelSection(fuel: data.first!.fuel)
    }
    .preferredColorScheme(.light)
}

#Preview("Fuel section (dark)") {
    List {
        FuelSection(fuel: data.first!.fuel)
    }
    .preferredColorScheme(.dark)
}
