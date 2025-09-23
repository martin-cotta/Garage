import SwiftUI

struct GeneralSection: View {
    var car: Car

    var body: some View {
        Section {
            DetailRowHorizontal(label: "Year", value: car.year.formatted(.number.grouping(.never)))
            DetailRowHorizontal(label: "Brand", value: car.brand)
            DetailRowHorizontal(label: "Model", value: car.model)
            DetailRowHorizontal(label: "Color", value: car.color)
            DetailRowHorizontal(label: "VIN", value: car.vin, enableCopy: true)
            DetailRowHorizontal(label: "Purchase date", value: car.purchaseDate.customFormat)
            DetailRowHorizontal(label: "Manufacture date", value: car.manufactureDate.customFormat)
        } header: {
            HStack {
                Image(systemName: "info.square")
                Text("Info".uppercased())
                Spacer()
            }
        }
    }
}

#Preview {
    List {
        GeneralSection(car: Data.cars.first!)
    }
}
