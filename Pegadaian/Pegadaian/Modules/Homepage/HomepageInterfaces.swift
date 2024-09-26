//
//  HomepageInterfaces.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 26/09/24.
//

import UIKit

enum HomepageNavigationOption {
    case logout
}

protocol HomepageWireframeInterface: WireframeInterface {
    func navigate(to option: HomepageNavigationOption)
}

protocol HomepageViewInterface: ViewInterface {
    func greetUser(withName name: String)
}

protocol HomepagePresenterInterface: PresenterInterface {
    func didUserSelectLogoutAction()
}

protocol HomepageInteractorInterface: InteractorInterface {
    func fetchUserProfile(completion: @escaping (Result<User>) -> Void)
    func logout(completion: @escaping (Result<Bool>) -> Void)
}
