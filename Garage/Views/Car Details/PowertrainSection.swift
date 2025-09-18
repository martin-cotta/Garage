import SwiftUI

struct PowertrainSection: View {
    @State private var isExpanded = true

    var powertrain: Powertrain

    var body: some View {
        Section(isExpanded: $isExpanded) {
            DetailRow(label: "Engine", value: powertrain.engine)
            DetailRow(label: "Transmision", value: powertrain.transmission)
        } header: {
            HStack {
                Image(systemName: "engine.combustion")
                Text("Powertrain".uppercased())
                Spacer()
                Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                    .onTapGesture {
                        isExpanded.toggle()
                    }
            }
        }
    }
}

#Preview("Powertrain (light)") {
    List {
        PowertrainSection(powertrain: data.first!.powertrain)
            .preferredColorScheme(.light)
    }
}

#Preview("Powertrain (dark)") {
    List {
        PowertrainSection(powertrain: data.first!.powertrain)
            .preferredColorScheme(.dark)
    }
}
