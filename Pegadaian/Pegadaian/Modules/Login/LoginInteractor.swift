//
//  LoginInteractor.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import Foundation
import LocalAuthentication

final class LoginInteractor {
}

// MARK: - Extensions -

extension LoginInteractor: LoginInteractorInterface {
    func login(username: String, password: String, completion: @escaping (Result<User>) -> Void) {
        let param = LoginParam(username: username, password: password)
        PGSNetwork.shared.request(PGSApi: .login, parameter: param, expectedResponseType: LoginResponse.self, completion: { [weak self] result in
            switch result {
            case .success(let loginResponse):
                guard let token = loginResponse.accessToken, let refreshToken = loginResponse.refreshToken else { completion(.error(.responseDecodingFailed))
                    return
                }
                self?.saveAPIToken(token: token, refreshToken: refreshToken)
                self?.saveCredentials(username: username, password: password)
                let user = User(
                    username: loginResponse.username,
                    email: loginResponse.email,
                    firstName: loginResponse.firstName,
                    lastName: loginResponse.lastName
                )
                completion(.success(user))
            case .error(let error):
                completion(.error(error))
            }
        })
    }
    
    func loginUsingBiometric(completion: @escaping (Result<User>) -> Void) {
        biometricAuth { [weak self] result in
            switch result {
            case .success(let success):
                if success, let credentials = PGSKeychain.shared.retrieveCredentials() {
                    self?.login(username: credentials.0, password: credentials.1, completion: completion)
                } else {
                    completion(.error(.biometricIdentityNotFound))
                }
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}

extension LoginInteractor {
    func saveCredentials(username: String, password: String) {
        _ = PGSKeychain.shared.storeCredentials(username: username, password: password)
    }
    
    func saveAPIToken(token: String, refreshToken: String) {
        _ = PGSKeychain.shared.storeAccessToken(accessToken: token, refreshToken: refreshToken)
    }
    
    func biometricAuth(completion: @escaping (Result<Bool>) -> Void) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate with Face ID / Touch ID to access your credentials"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                (success) ? completion(.success(true)) : completion(.error(.authenticationError(message: authenticationError?.localizedDescription ?? "")))
                
            }
        } else {
            completion(.error(.biometricIdentityNotFound))
        }
    }
}
