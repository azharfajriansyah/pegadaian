//
//  LoginInterfaces.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import UIKit

enum LoginNavigationOption {
}

protocol LoginWireframeInterface: WireframeInterface {
    func navigate(to option: LoginNavigationOption)
}

protocol LoginViewInterface: ViewInterface {
    func setTitle(_ title: String)
}

protocol LoginPresenterInterface: PresenterInterface {
}

protocol LoginInteractorInterface: InteractorInterface {
}
