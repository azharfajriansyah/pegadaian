//
//  PGSAPI.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import Foundation
import Alamofire

enum PGSAPI {
    case login
    case register
    case getProfile
    
    var url: String {
        switch self {
        case .login: "https://dummyjson.com/auth/login"
        case .register: "https://dummyjson.com/auth/register"
        case .getProfile: "https://dummyjson.com/auth/me"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .register: .post
        case .getProfile: .get
        }
    }
}
