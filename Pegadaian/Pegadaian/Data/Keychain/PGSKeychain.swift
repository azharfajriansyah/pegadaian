//
//  PGSKeychain.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 26/09/24.
//

import Foundation
import Security

fileprivate enum PGSKeychainKey: String {
    case userCredential = "PGSUserCredential"
    case apiToken = "PGSApiToken"
}

class PGSKeychain {
    static let shared = PGSKeychain()
    
    var userSessionExist: Bool {
        return retrieve(key: .apiToken) != nil
    }
    
    func storeCredentials(username: String, password: String) -> Bool {
        guard let credentialsData = "\(username):\(password)".data(using: .utf8) else { return false }
        return store(key: .userCredential, data: credentialsData)
    }
    
    func storeAccessToken(accessToken: String, refreshToken: String) -> Bool {
        guard let tokenData = "\(accessToken):\(refreshToken)".data(using: .utf8) else { return false }
        return store(key: .apiToken, data: tokenData)
    }
    
    func retrieveCredentials() -> (String, String)? {
        guard let credentials = retrieve(key: .userCredential) else { return nil }
        let credentialsArray = credentials.split(separator: ":").map(String.init)
        if credentialsArray.count == 2 {
            return (credentialsArray[0], credentialsArray[1])
        }
        return nil
    }
    
    func retrieveApiToken() -> (String, String)? {
        guard let credentials = retrieve(key: .apiToken) else { return nil }
        let credentialsArray = credentials.split(separator: ":").map(String.init)
        if credentialsArray.count == 2 {
            return (credentialsArray[0], credentialsArray[1])
        }
        return nil
    }
    
    func removeApiToken() -> Bool {
        return remove(key: .apiToken)
    }
    
    func clearKeychainData() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword
        ]
        SecItemDelete(query as CFDictionary)
    }
}

// MARK: - Private functions
extension PGSKeychain {
    fileprivate func store(key: PGSKeychainKey, data: Data) -> Bool {

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
        ]
        
        // Remove any existing item with the same account
        SecItemDelete(query as CFDictionary)

        // Add the credentials to the Keychain
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    fileprivate func remove(key: PGSKeychainKey) -> Bool {

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue
        ]
        
        // Remove any existing item with the same account
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
    
    fileprivate func retrieve(key: PGSKeychainKey) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject? = nil
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess, let retrievedData = dataTypeRef as? Data,
           let credentials = String(data: retrievedData, encoding: .utf8) {
            return credentials
        }
        return nil
    }
}
