//
//  LoginPresenter.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import UIKit

final class LoginPresenter {

    // MARK: - Private properties -

    private unowned let view: LoginViewInterface
    private let wireframe: LoginWireframeInterface
    private let interactor: LoginInteractorInterface

    // MARK: - Lifecycle -

    init(wireframe: LoginWireframeInterface, view: LoginViewInterface, interactor: LoginInteractorInterface) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
}

// MARK: - Extensions -

extension LoginPresenter: LoginPresenterInterface {
    func viewDidLoad() {
        view.setTitle("Login")
    }
    
    func viewDidAppear(animated: Bool) {
        view.setBackgroundColor(UIColor.red)
    }
    
    func didUserSelectLogin(username: String, password: String) {
        interactor.login(username: username, password: password, completion: { [weak self] (success, message) in
            if success { //sukses
                self?.wireframe.navigate(to: .homepage("LoginPage"))
            } else {
                // kasih tau view untuk menampilkan error
            }
        })
    }
}
