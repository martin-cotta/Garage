import Foundation

struct Record<T: Codable>: Codable {
    let label: String
    let value: T
}
