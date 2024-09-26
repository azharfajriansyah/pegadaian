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
    
    // Sample closure with return value
    let someClosure: (_ valueA: Int,_ valueB: Int) -> Int = { valueA, valueB in
        return valueA + valueB
    }

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
    
    func didUserSelectLogin(username: String, password: String) {
        view.showLoader(withMessage: "Loading")
        interactor.login(username: username, password: password, completion: { [weak self] result in
            self?.view.dismissLoader()
            switch result {
            case .success(let user):
                debugPrint("Login success using username: \(String(describing: user.username))")
                self?.wireframe.navigate(to: .postLogin)
            case .error(let error):
                self?.view.showError(error)
            }
        })
    }
    
    func didUserSelectLoginUsingBiometric() {
        view.showLoader(withMessage: "Loading")
        interactor.loginUsingBiometric { [weak self] result in
            self?.view.dismissLoader()
            switch result {
            case .success(let user):
                debugPrint("Login success using biometric, username: \(String(describing: user.username))")
                self?.wireframe.navigate(to: .postLogin)
            case .error(let error):
                self?.view.showError(error)
            }
        }
    }
}
