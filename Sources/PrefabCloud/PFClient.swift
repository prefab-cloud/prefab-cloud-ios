import Foundation
import Alamofire
// Things we want to be able to do here:
// initialize a client w/an API key
// set context
// retrieve/store data
// poll endpoint
// stream endpoint?
// query data from the client (how does the client store this?)

public class PFClient {
    private var apiKey: String
    private var endpoint: URL
    private var contexts: PFContexts
    private var authHeader: String {
        let credentialData = "u:\(self.apiKey)".data(using: .utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        return "Basic \(base64Credentials)"
    }
    
    public init(apiKey: String, endpoint: URL) {
        self.apiKey = apiKey
        self.endpoint = endpoint
        self.contexts = PFContexts(contexts: [])
    }
    
    public func setContexts(_ newContexts: PFContexts) {
        self.contexts = newContexts
    }
    
    public func fetch() throws {
        let encodedContexts: String = try self.contexts.encodeForRequest()
        let requestPath = self.endpoint.appendingPathComponent(encodedContexts)
        AF.request(requestPath, headers: headers()).validate().response { response in
                debugPrint(response)
        }
    }
    
    private func headers() -> HTTPHeaders {
        return [
            "Accept": "*/*",
            "Authorization": self.authHeader
        ]
    }
}
