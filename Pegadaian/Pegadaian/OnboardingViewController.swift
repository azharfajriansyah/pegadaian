//
//  OnboardingViewController.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 24/09/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    lazy var masukButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Masuk", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return button
    }()
    
    lazy var daftarButton: UIButton = {
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
        view.addSubview(masukButton)
        view.addConstraints(
            [
                NSLayoutConstraint(item: masukButton, attribute: .left, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 24),
                NSLayoutConstraint(item: masukButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: masukButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50),
                NSLayoutConstraint(item: masukButton, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
            ]
        )
        view.layoutIfNeeded()
    }
    
    func setupDaftarButton() {
        view.addSubview(daftarButton)
        view.addConstraints(
            [
                NSLayoutConstraint(item: daftarButton, attribute: .left, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 24),
                NSLayoutConstraint(item: daftarButton, attribute: .bottom, relatedBy: .equal, toItem: masukButton.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: -16),
                NSLayoutConstraint(item: daftarButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50),
                NSLayoutConstraint(item: daftarButton, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
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
    
}
