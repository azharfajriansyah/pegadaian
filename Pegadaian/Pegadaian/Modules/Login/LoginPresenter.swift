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
        // perintahkan interactor untuk ngambil data
        
        view.
    }
}
