
import Foundation

enum PFContextValue: Codable, Equatable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    
    // MARK: Codable
    
    enum CodingKeys: CodingKey {
        case string, int, double, bool
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .string(let s):
            try container.encode(s, forKey: .string)
        case .int(let i):
            try container.encode(i, forKey: .int)
        case .double(let d):
            try container.encode(d, forKey: .double)
        case .bool(let b):
            try container.encode(b, forKey: .bool)
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first
        switch key {
        case .string:
            let string = try container.decode(String.self, forKey: .string)
            self = .string(string)
        case .int:
            let int = try container.decode(Int.self, forKey: .int)
            self = .int(int)
        case .double:
            let double = try container.decode(Double.self, forKey: .double)
            self = .double(double)
        case .bool:
            let bool = try container.decode(Bool.self, forKey: .bool)
            self = .bool(bool)
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(codingPath: container.codingPath, debugDescription: "Unable to decode enum."))
        }
    }
}
