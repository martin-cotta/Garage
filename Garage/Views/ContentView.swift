import SwiftUI

struct ContentView: View {
    @State private var presentedCars: [String] = []

    var cars: [Car] {
        Data.cars
    }

    var body: some View {
        NavigationStack(path: $presentedCars) {
            List {
                ForEach(cars) { car in
                    Button {
                        presentedCars.append(car.id.uuidString)
                    } label: {
                        Card {
                            ZStack(alignment: .topLeading) {
                                carInfo(car: car)
                                carLogo(car: car)
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .navigationTitle("Garage")
            .navigationDestination(for: String.self) { id in
                CarDetail(car: cars.first(where: { $0.id.uuidString == id })!)
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
        }
    }

    // MARK: -

    func carLogo(car: Car) -> some View {
        Image(car.logoImageName)
            .resizable()
            .scaledToFit()
            .frame(width: 80)
            .offset(x: -10, y: -10)
            .opacity(0.8)
    }

    func carInfo(car: Car) -> some View {
        VStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.tint)
            Text(car.name)
                .font(.title2)
            Text(car.desc)
                .font(.title3)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview("Light") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}

struct Card<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        VStack {
            content
        }
        .padding()
        .background(Material.regular, in: .rect(cornerRadius: 8))
//        .shadow(radius: 1)
    }
}
