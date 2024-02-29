import Foundation

public class PFContexts: Codable, Equatable {
    public var contexts: [PFContext]
    
    public init(contexts: [PFContext]) {
        self.contexts = contexts
    }
    
    public func encodeForRequest() throws -> String {
        let encoder = JSONEncoder()
        let data = try encoder.encode(self)
        guard let json = String(data: data, encoding: .utf8) else { return "" }
        guard let data = json.data(using: .utf8) else { return "" }
        let base64String = data.base64EncodedString()
        let escapedString = base64String.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        return escapedString
    }
    
    // MARK: Equatable
    
    public static func == (lhs: PFContexts, rhs: PFContexts) -> Bool {
        lhs.contexts == rhs.contexts
    }
}
