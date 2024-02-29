import Foundation

struct PFContext: Codable, Equatable {
    var type: String
    var values: [String: PFContextValue]
}
