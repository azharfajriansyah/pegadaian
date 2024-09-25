//
//  OnboardingViewController.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 24/09/24.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Masuk", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Daftar", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.layer.cornerRadius = 8.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1.0
        button.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupMasukButton()
        setupDaftarButton()
    }
    
    func setupMasukButton() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupDaftarButton() {
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.bottom.equalTo(loginButton.snp.top).offset(-24)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        view.addConstraints(
            [
                NSLayoutConstraint(item: registerButton, attribute: .left, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 24),
                NSLayoutConstraint(item: registerButton, attribute: .bottom, relatedBy: .equal, toItem: loginButton.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: -16),
                NSLayoutConstraint(item: registerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50),
                NSLayoutConstraint(item: registerButton, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
            ]
        )
        view.layoutIfNeeded()
    }

}

// MARK - Button Action
extension OnboardingViewController {
    @objc
    func registerAction() {
        CoreDataHelper.shared.createOnboardingContent(imageName: "", title: "Selamat Datang di Pegadaian Digital", desc: "Solusi investasi, pendanaan, dan pembayaran dengan mudah tanpa harus keluar rumah.")
        
        CoreDataHelper.shared.createOnboardingContent(imageName: "", title: "Investasi Tanpa Cemas", desc: "Beli dan jual emas dengan fasilitas titipan yang aman karena Pegadaian telah terdaftar dan diawasi OJK.")
    }
    
    @objc
    func loginAction() {
        let contents = CoreDataHelper.shared.fetchAllOnboardingContent()
        contents?.forEach({ content in
            debugPrint(content.title ?? "", content.desc ?? "")
        })
   }
}

// MARK: - TableView UI & Handler
extension OnboardingViewController {
    @objc
    func buttonAction() {
        
    }
}
