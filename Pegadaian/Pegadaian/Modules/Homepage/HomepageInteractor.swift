//
//  HomepageInteractor.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 26/09/24.
//

import Foundation

final class HomepageInteractor {
}

// MARK: - Extensions -

extension HomepageInteractor: HomepageInteractorInterface {
    func logout(completion: @escaping (Result<Bool>) -> Void) {
        let result = PGSKeychain.shared.removeApiToken()
        result ? completion(.success(true)) : completion(.error(.responseDecodingFailed))
    }
    
    func fetchUserProfile(completion: @escaping (Result<User>) -> Void) {
        PGSNetwork.shared.request(PGSApi: .getProfile, expectedResponseType: User.self) { result in
            completion(result)
        }
    }
}
