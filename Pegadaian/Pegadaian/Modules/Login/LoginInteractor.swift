//
//  LoginInteractor.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import Foundation

final class LoginInteractor {
}

// MARK: - Extensions -

extension LoginInteractor: LoginInteractorInterface {
    func login(username: String, password: String, completion: @escaping (Bool, String) -> Void) {
        //PGSNetwork.shared.requestLogin(username: username, password: password)
        let param = LoginParam(username: username, password: password)
        PGSNetwork.shared.request(PGSApi: .login, parameter: param, completion: { result in
            switch result {
            case .success(let token):
                // presenter -> kasih tau bahwa dia sukses
                completion(true, "Success")
                break
            case .error(let error):
                // presenter -> kasih tau bahwa dia gagal
                completion(false, "Failed")
                break
            }
        })
    }
}
