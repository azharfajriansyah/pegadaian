//
//  LoginResponse.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import Foundation

struct LoginResponse: Decodable {
    var accessToken: String?
    var refreshToken: String?
    var username: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken, refreshToken, username, email, firstName, lastName
    }
}
