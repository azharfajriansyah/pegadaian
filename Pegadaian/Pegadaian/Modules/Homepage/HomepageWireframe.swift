//
//  HomepageWireframe.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 26/09/24.
//

import UIKit

final class HomepageWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = HomepageViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = HomepageInteractor()
        let presenter = HomepagePresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension HomepageWireframe: HomepageWireframeInterface {

    func navigate(to option: HomepageNavigationOption) {
    }
}
