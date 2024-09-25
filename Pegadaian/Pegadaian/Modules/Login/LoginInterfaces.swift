//
//  LoginInterfaces.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import UIKit

enum LoginNavigationOption {
    case homepage(String)
}

protocol LoginWireframeInterface: WireframeInterface {
    func navigate(to option: LoginNavigationOption)
}

protocol LoginViewInterface: ViewInterface {
    func setTitle(_ title: String)
    func setBackgroundColor(_ color: UIColor)
}

protocol LoginPresenterInterface: PresenterInterface {
    func didUserSelectLogin(username: String, password: String)
}

protocol LoginInteractorInterface: InteractorInterface {
    func login(username: String, password: String, completion: @escaping (Bool, String) -> Void) // status sukses & message
}
