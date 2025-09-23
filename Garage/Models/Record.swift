import Foundation

struct Record<Data: Codable>: Codable {
    let label: String
    let value: Data
}
