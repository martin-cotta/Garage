import SwiftUI

enum Sections: CaseIterable {
    case general
    case history
    case maintenance
}

struct GeneralSection: View {
    @State private var isExpanded = true

    var car: Car

    var body: some View {
        Section(isExpanded: $isExpanded) {
            DetailRow(label: "Year", value: car.year.formatted(.number.grouping(.never)))
            DetailRow(label: "Brand", value: car.brand)
            DetailRow(label: "Model", value: car.model)
            DetailRow(label: "Color", value: car.color)
            DetailRow(label: "Purchase date", value: car.purchaseDate.customFormat)
            DetailRow(label: "Manufacture date", value: car.manufactureDate.customFormat)
        } header: {
            HStack {
                Image(systemName: "info.square")
                Text("Info".uppercased())
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
        GeneralSection(car: data.first!)
    }
}
