import XCTest
@testable import PrefabCloud

final class PFContextValueTests: XCTestCase {
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func assertEncodedContextValue(_ contextValue: PFContextValue, _ expected: String) throws {
        let data = try encoder.encode(contextValue)
        let actual = String(data: data, encoding: .utf8)!
        
        assert(actual == expected, "expected \(expected), got \(actual)")
    }
    
    func assertRoundTrip(_ contextValue: PFContextValue) throws {
        let data = try encoder.encode(contextValue)
        let decoded = try decoder.decode(PFContextValue.self, from: data)
        
        assert(contextValue == decoded, "expected \(contextValue), got \(decoded)")
    }
    
    func testEncodingStringContextValue() throws {
        let contextValue = PFContextValue.string("hello")
        let expected = """
        {"string":"hello"}
        """
        
        try assertEncodedContextValue(contextValue, expected)
    }
    
    func testEncodingIntContextValue() throws {
        let contextValue = PFContextValue.int(42)
        let expected = """
        {"int":42}
        """
        
        try assertEncodedContextValue(contextValue, expected)
    }
    
    func testEncodingDoubleContextValue() throws {
        let contextValue = PFContextValue.double(3.141)
        let expected = """
        {"double":3.141}
        """
        
        try assertEncodedContextValue(contextValue, expected)
    }
    
    func testEncodingBoolContextValue() throws {
        let contextValue = PFContextValue.bool(true)
        let expected = """
        {"bool":true}
        """
        
        try assertEncodedContextValue(contextValue, expected)
    }
    
    func testRoundTripStringContextValueEncoding() throws {
        let contextValue = PFContextValue.string("hey there!")
        
        try assertRoundTrip(contextValue)
    }
    
    func testRoundTripIntContextValueEncoding() throws {
        let contextValue = PFContextValue.int(1985)
        
        try assertRoundTrip(contextValue)
    }
    
    func testRoundTripDoubleContextValueEncoding() throws {
        let contextValue = PFContextValue.double(2.71828)
        
        try assertRoundTrip(contextValue)
    }
    
    func testRoundTripBoolContextValueEncoding() throws {
        let contextValue = PFContextValue.bool(false)
        
        try assertRoundTrip(contextValue)
    }
}
