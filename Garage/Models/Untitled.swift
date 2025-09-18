import Foundation

extension Date {
    var customFormat: String {
        formatted(.dateTime
            .month(.abbreviated)
            .day()
            .year())
    }
}
