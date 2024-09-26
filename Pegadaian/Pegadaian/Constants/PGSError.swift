//
//  PGSError.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 26/09/24.
//

import Foundation

enum PGSError: Error {
    case responseDecodingFailed
    case biometricIdentityNotFound
    case authenticationError(message: String)
    case requiredFieldsEmpty
    
    var uiCopy: (String, String) {
        switch self {
        case .responseDecodingFailed: ("Response decoding failed", "Response decoding failed")
        case .biometricIdentityNotFound: ("Your biometric login is currently unavailable", "Please activate it after login using password")
        case .authenticationError(let message): (message, message)
        case .requiredFieldsEmpty: ("Oops", "Please fill the required fields")
        }
    }
}
