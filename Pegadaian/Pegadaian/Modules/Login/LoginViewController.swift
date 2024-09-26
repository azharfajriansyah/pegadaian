//
//  LoginViewController.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import UIKit

final class LoginViewController: BaseViewController {

    // MARK: - Public properties -

    var presenter: LoginPresenterInterface!
    
    lazy var accountTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Nomor handphone / email"
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0
        textField.autocapitalizationType = .none
        textField.accessibilityIdentifier = "Login.accountTextField"
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0
        textField.isSecureTextEntry = true
        textField.accessibilityIdentifier = "Login.passwordTextField"
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        button.accessibilityIdentifier = "Login.loginButton"
        return button
    }()
    
    lazy var biometricButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "touchid"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor.systemGreen
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(biometricButtonAction), for: .touchUpInside)
        return button
    }()


    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.viewDidLoad()
        
        setupViews()
        setupConstrainits()
        
    }
    
    func setupViews() {
        view.addSubview(accountTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(biometricButton)
    }
    
    func setupConstrainits() {
        accountTextField.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(24)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(24)
            make.top.equalTo(accountTextField.snp.bottom).offset(24)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(24)
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.height.equalTo(50)
            make.right.equalTo(biometricButton.snp.left).offset(-16)
        }
        
        biometricButton.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-24)
            make.top.equalTo(loginButton.snp.top)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
	
}

// MARK: - Extensions -

extension LoginViewController {
    @objc
    func loginButtonAction() {
        guard let account = accountTextField.text, !account.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            showError(.requiredFieldsEmpty)
            return
        }
        presenter.didUserSelectLogin(username: account, password: password)
    }
    
    @objc
    func biometricButtonAction() {
        presenter.didUserSelectLoginUsingBiometric()
    }
}

extension LoginViewController: LoginViewInterface {
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func showError(_ error: PGSError) {
        let alert = UIAlertController(title: error.uiCopy.0, message: error.uiCopy.1, preferredStyle: .alert)
        alert.accessibilityLabel = "Login.errorAlert"
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true)
        }
    }
}
