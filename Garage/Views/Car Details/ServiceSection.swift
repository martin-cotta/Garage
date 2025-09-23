import SwiftUI

struct ServiceSection: View {
    @State private var isExpanded = true

    var services: [Service]

    var body: some View {
        Section(isExpanded: $isExpanded) {
            // section content
            ForEach(services) { service in
                DisclosureGroup {
                    content(service: service)
                        .foregroundStyle(.secondary)
                        .padding(.leading, -20)
                } label: {
                    DetailRow(
                        label: service.date.customFormat,
                        value: "\(service.miles.formatted()) miles")
                }
            }
        } header: {
            // section header
            sectionHeader
        }
    }

    // MARK: - view builders

    private var sectionHeader: some View {
        HStack {
            Image(systemName: "wrench.and.screwdriver")
            Text("Service history".uppercased())
            Spacer()
            Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                .onTapGesture {
                    isExpanded.toggle()
                }
        }
    }

    private func content(service: Service) -> some View {
        Text(service.details)
    }
}

#Preview("Service history (light)") {
    List {
        ServiceSection(services: Data.cars.first!.orderedServices)
    }
    .preferredColorScheme(.light)
}

#Preview("Service history (dark)") {
    List {
        ServiceSection(services: Data.cars.first!.orderedServices)
    }
    .preferredColorScheme(.dark)
}
