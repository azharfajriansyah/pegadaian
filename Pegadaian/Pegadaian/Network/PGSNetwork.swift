//
//  PGSNetwork.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import Foundation
import Alamofire

enum Result<Value> {
    case success(Value)
    case error(PGSError)
}

class PGSNetwork {
    static let shared = PGSNetwork()
    
    lazy var sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.ephemeral
        let sessionManager = SessionManager(configuration: configuration)
        return sessionManager
    }()
    
    func request<T: Decodable>(PGSApi: PGSAPI, parameter: Encodable? = nil, expectedResponseType: T.Type, completion: @escaping (Result<T>) -> Void) {
        var headers: [String:String] = [String:String]()
        if let token = PGSKeychain.shared.retrieveApiToken() {
            headers["Authorization"] = "Bearer \(token.0)"
        }
        
        debugPrint(headers)
        sessionManager.request(PGSApi.url, method: PGSApi.method, parameters: parameter?.toJSON(), headers: headers).responseJSON { response in
            debugPrint(response)
            
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(T.self, from: data)
                completion(.success(response))
            } catch {
                debugPrint("Failed to decode data")
                completion(.error(PGSError.responseDecodingFailed))
            }
        }
    }
}
