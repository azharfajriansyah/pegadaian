//
//  LoginInterfaces.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import UIKit

enum LoginNavigationOption {
    case postLogin
}

protocol LoginWireframeInterface: WireframeInterface {
    func navigate(to option: LoginNavigationOption)
}

protocol LoginViewInterface: ViewInterface {
    func setTitle(_ title: String)
    func showError(_ error: PGSError)
}

protocol LoginPresenterInterface: PresenterInterface {
    func didUserSelectLogin(username: String, password: String)
    func didUserSelectLoginUsingBiometric()
}

protocol LoginInteractorInterface: InteractorInterface {
    func login(username: String, password: String, completion: @escaping (Result<User>) -> Void)
    func loginUsingBiometric(completion: @escaping (Result<User>) -> Void)
}
