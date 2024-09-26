//
//  PegadaianLoginMockModule.swift
//  PegadaianTests
//
//  Created by FDN-Azhar on 26/09/24.
//

import Foundation
@testable import Pegadaian

class PegadaianLoginMockModule: LoginWireframeInterface {
    var interactor: LoginInteractor?
    var presenter: LoginPresenter?
    var view: LoginViewController?
    
    init() {
        view = LoginViewController()
        interactor = LoginInteractor()
        presenter = LoginPresenter(wireframe: self, view: view!, interactor: interactor!)
        view?.presenter = presenter
    }
    func navigate(to option: Pegadaian.LoginNavigationOption) {}
}
