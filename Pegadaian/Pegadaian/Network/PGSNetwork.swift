//
//  PGSNetwork.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import Foundation
import Alamofire

enum PGSNetworkResult<Value> {
    case success(Value)
    case error(NSError)
}

class PGSNetwork {
    static let shared = PGSNetwork()
    
    func requestLogin(username: String, password: String) {
        Alamofire.request("https://dummyjson.com/auth/login", method: .post, parameters: ["username":username, "password":password]).responseJSON { response in
            debugPrint(response)
            
        }
    }
    
    func request(PGSApi: PGSAPI, parameter: Encodable?, completion: @escaping (PGSNetworkResult<String>) -> Void) {
        Alamofire.request(PGSApi.url, method: PGSApi.method, parameters: parameter?.toJSON()).responseJSON { response in
            debugPrint(response)
            
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(LoginResponse.self, from: data)
                
                debugPrint("Login success with token: \(response.accessToken ?? "")")
                completion(.success(response.accessToken ?? ""))
            } catch {
                debugPrint("Failed to decode data")
                completion(.error(NSError()))
            }
        }
    }
}
