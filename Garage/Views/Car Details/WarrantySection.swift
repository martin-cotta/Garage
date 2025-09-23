import SwiftUI

struct WarrantySection: View {
    var car: Car

    var body: some View {
        Section {
            DetailRow(label: "Limited powertrain warranty", value: "10 yrs or 100,000 mi")
            DetailRow(label: "Limited basic warranty", value: "5 yrs or 60,000 mi")
            DetailRow(label: "Roadside assistance", value: "5 yrs or 60,000 mi")
        } header: { header }
    }

    // MARK: - Private

    private let header: HStack<TupleView<(Image, Text, Spacer)>> = HStack {
        Image(systemName: "checkmark.seal")
        Text("Warranty".uppercased())
        Spacer()
    }
}

#Preview {
    List {
        WarrantySection(car: Data.cars.first!)
    }
}
