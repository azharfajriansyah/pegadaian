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
        sessionManager.adapter = PGSNetworkRequestAdapter()
        
        sessionManager.delegate.taskWillPerformHTTPRedirection = { session, task, response, request in
            var redirectedRequest = request
            
            if let originalRequest = task.originalRequest,
               let headers = originalRequest.allHTTPHeaderFields,
               let authHeaderValue = headers["Authorization"] {
                
                var mutableRequest = request as! NSMutableURLRequest
                mutableRequest.setValue(authHeaderValue, forHTTPHeaderField: "Authorization")
                redirectedRequest = mutableRequest as URLRequest
            }
            return redirectedRequest
        }
        
        return sessionManager
    }()
    
    func request<T: Decodable>(PGSApi: PGSAPI, parameter: Encodable? = nil, expectedResponseType: T.Type, completion: @escaping (Result<T>) -> Void) {
        
        sessionManager.request(PGSApi.url, method: PGSApi.method, parameters: parameter?.toJSON()).responseJSON { response in
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

class PGSNetworkRequestAdapter: RequestAdapter {
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        guard let token = PGSKeychain.shared.retrieveApiToken() else { return urlRequest }
        
        var urlRequest = urlRequest
        urlRequest.setValue("Bearer \(token.0)", forHTTPHeaderField: "Authorization")
        urlRequest.timeoutInterval = TimeInterval(5)
        return urlRequest
    }
}
