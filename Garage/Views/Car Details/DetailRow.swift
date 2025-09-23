import SwiftUI

struct DetailRowHorizontal: View {
    var label: String
    var value: String
    var enableCopy = false

    var body: some View {
        HStack {
            Text(label)
                .bold()
            Spacer()
            if enableCopy {
                Text(value)
                    .textSelection(.enabled)
                    .foregroundStyle(.secondary)
            } else {
                Text(value)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

struct DetailRow2: View {
    var record: Record<String>

    var body: some View {
        VStack(alignment: .leading) {
            Text(record.label)
                .bold()
            Text(record.value)
                .foregroundStyle(.secondary)
        }
    }
}

struct DetailRow<InfoContent: View>: View {
    @State private var showingPopover = false

    var label: String
    var value: String
    var verLayout = true
    let infoContent: InfoContent?

    init(label: String, value: String, @ViewBuilder infoContent: @escaping () -> InfoContent) {
        self.label = label
        self.value = value
        self.infoContent = infoContent()
    }

    init(label: String, value: String) where InfoContent == EmptyView {
        self.label = label
        self.value = value
        infoContent = nil
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(label)
                    .bold()
                Text(value)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            if let infoContent {
                Image(systemName: "questionmark.circle.fill")
                    .symbolRenderingMode(.hierarchical)
                    .onTapGesture {
                        showingPopover.toggle()
                    }
                    .sensoryFeedback(.selection, trigger: showingPopover)
                    .popover(isPresented: $showingPopover) {
                        infoContent
                            .font(.footnote)
                            .padding()
                            .presentationCompactAdaptation(.popover)
                    }
            }
        }
    }
}

#Preview {
    List {
        DetailRow(label: "Label 1", value: "Here goes the value")
        DetailRow(label: "Label 2", value: "Here goes another value") {
            VStack(alignment: .leading) {
                Text(
                    """
                    In Canada, The United States, and Mexico, 
                    the advertised octane rating is 
                    the average of the RON and the MON, 
                    called the Anti-Knock Index (AKI). 
                    It is often written on pumps as (R+M)/2. 
                    AKI is also sometimes called PON.
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
        DetailRow(label: "Label 3", value: "Here goes one more value")
    }
}
