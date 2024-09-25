//
//  LoginViewController.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: LoginPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension LoginViewController: LoginViewInterface {
    func setTitle(_ title: String) {
        self.title = title
    }
}
