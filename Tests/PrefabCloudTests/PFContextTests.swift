import XCTest
@testable import PrefabCloud

final class PFContextTests: XCTestCase {
    func testEncodingContext() throws {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        let context = PFContext(
            type: "user", 
            values: [
                "name": PFContextValue.string("Michael"),
                "id": PFContextValue.int(52285),
                "rate": PFContextValue.double(150.75),
                "isAdmin": PFContextValue.bool(false)
            ]
        )
        
        let data = try encoder.encode(context)
        let decoded = try decoder.decode(PFContext.self, from: data)
        
        assert(decoded == context, "expected \(context), got \(decoded)")
    }
}
