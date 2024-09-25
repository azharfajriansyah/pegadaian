//
//  LoginWireframe.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import UIKit

final class LoginWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = LoginViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension LoginWireframe: LoginWireframeInterface {

    func navigate(to option: LoginNavigationOption) {
    }
}
