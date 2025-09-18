import SwiftUI

struct WheelsSection: View {
    @State private var isExpanded = true

    var wheels: Wheels

    var body: some View {
        Section(isExpanded: $isExpanded) {
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
                Spacer()
                Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                    .onTapGesture {
                        isExpanded.toggle()
                    }
            }
        }
    }
}

#Preview {
    List {
        WheelsSection(wheels: data.first!.wheels)
    }
}
