import XCTest
@testable import PrefabCloud

final class PFContextsTests: XCTestCase {
    func testEncodingContexts() throws {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        let contextOne = PFContext(
            type: "user",
            values: [
                "name": PFContextValue.string("Michael"),
                "id": PFContextValue.int(52285),
                "rate": PFContextValue.double(150.75),
                "isAdmin": PFContextValue.bool(false)
            ]
        )
        let contextTwo = PFContext(
            type: "device",
            values: [
                "OS": PFContextValue.string("iOS")
            ]
        )
        
        let contexts = PFContexts(contexts: [contextOne, contextTwo])
        
        let data = try encoder.encode(contexts)
        let decoded = try decoder.decode(PFContexts.self, from: data)
        
        assert(decoded == contexts, "expected \(contexts), got \(decoded)")
    }
}
