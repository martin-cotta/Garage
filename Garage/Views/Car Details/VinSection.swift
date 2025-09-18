import CoreHaptics
import SwiftUI

struct VinSection: View {
    @State private var isExpanded = true
    @State private var vinCopied = false

    var car: Car

    var body: some View {
        Section(isExpanded: $isExpanded) {
            HStack {
                Text(car.vin)
                Spacer()
                if vinCopied {
                    Text("Copied")
                        .foregroundColor(.white)
                        .font(.footnote)
                        .bold()
                        .frame(width: 80, height: 22)
                        .background(Color.blue.cornerRadius(20))
                }
                Button {
                    print("copy VIN")
                    UIPasteboard.general.string = car.vin
                    withAnimation {
                        vinCopied.toggle()
                    }
                    DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1) {
                        withAnimation {
                            vinCopied.toggle()
                        }
                    }

                } label: {
                    Image(systemName: "document.on.document")
                        .symbolRenderingMode(.hierarchical)
                }
                .buttonStyle(.plain)
                .sensoryFeedback(.selection, trigger: vinCopied) { old, new in
                    new == true
                }
            }
        } header: {
            HStack {
                Image(systemName: "barcode.viewfinder")
                Text("VIN".uppercased())
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
        VinSection(car: data.first!)
    }
}
