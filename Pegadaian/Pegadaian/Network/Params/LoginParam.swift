//
//  LoginParam.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import Foundation

struct LoginParam: Encodable {
    var username: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case username, password
    }
}
