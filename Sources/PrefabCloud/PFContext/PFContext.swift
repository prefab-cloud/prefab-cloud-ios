import Foundation

public class PFContext: Codable, Equatable {
    var type: String
    var values: [String: PFContextValue]
    
    public init(type: String, values: [String : PFContextValue]) {
        self.type = type
        self.values = values
    }
    
    // MARK: Equatable
    
    public static func == (lhs: PFContext, rhs: PFContext) -> Bool {
        lhs.type == rhs.type && lhs.values == rhs.values
    }
}
