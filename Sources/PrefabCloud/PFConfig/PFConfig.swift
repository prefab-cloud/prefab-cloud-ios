import Foundation

public struct PFConfigApikeyMetadata: Codable {
    var keyId: String
}

public struct PFConfigEvaluationMetadata: Codable {
    var configRowIndex: String
    var conditionalValueIndex: String
    var type: String
    var id: String
    var valueType: String
}

public struct PFConfigValue: Codable {
    var string: String?
    var int: Int?
    var double: Double?
    var bool: Bool?
    var configEvaluationMetadata: PFConfigEvaluationMetadata
}

public class PFConfig: Codable {
    var apikeyMetadata: PFConfigApikeyMetadata
    var values: [String: PFConfigValue]
}
