//
//  HomepageInterfaces.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 26/09/24.
//

import UIKit

enum HomepageNavigationOption {
}

protocol HomepageWireframeInterface: WireframeInterface {
    func navigate(to option: HomepageNavigationOption)
}

protocol HomepageViewInterface: ViewInterface {
    func greetUser(withName name: String)
}

protocol HomepagePresenterInterface: PresenterInterface {
}

protocol HomepageInteractorInterface: InteractorInterface {
    func fetchUserProfile(completion: @escaping (Result<User>) -> Void)
}
