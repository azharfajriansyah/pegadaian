//
//  HomepagePresenter.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 26/09/24.
//

import UIKit

final class HomepagePresenter {

    // MARK: - Private properties -

    private unowned let view: HomepageViewInterface
    private let wireframe: HomepageWireframeInterface
    private let interactor: HomepageInteractorInterface

    // MARK: - Lifecycle -

    init(wireframe: HomepageWireframeInterface, view: HomepageViewInterface, interactor: HomepageInteractorInterface) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
}

// MARK: - Extensions -

extension HomepagePresenter: HomepagePresenterInterface {
    func didUserSelectLogoutAction() {
        interactor.logout { [weak self] result in
            switch result {
            case .success(_):
                self?.wireframe.navigate(to: .logout)
            case .error(let error):
                self?.view.showError(.removeDataError)
            }
        }
    }
    
    func viewDidAppear(animated: Bool) {
        view.showLoader(withMessage: "Loading")
        interactor.fetchUserProfile { [weak self] result in
            self?.view.dismissLoader()
            switch result {
            case .success(let user):
                self?.view.greetUser(withName: "\(user.firstName ?? "") \(user.lastName ?? "")")
            case .error(let error):
                self?.view.showError(error)
            }
        }
    }
}
