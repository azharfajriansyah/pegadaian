//
//  HomepageViewController.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 26/09/24.
//

import UIKit

final class HomepageViewController: BaseViewController {

    // MARK: - Public properties -
    
    lazy var greetingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        label.textColor = .black
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 50, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var logoutButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Logout", image: nil, target: self, action: #selector(didTapLogout))
        return button
    }()

    var presenter: HomepagePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Homepage"
        
        setupViews()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.viewDidAppear(animated: animated)
    }
    
    func setupViews() {
        navigationItem.rightBarButtonItem = logoutButton
        view.addSubview(greetingsLabel)
    }
    
    func setupConstraints() {
        greetingsLabel.snp.makeConstraints { make in
            make.left.greaterThanOrEqualTo(view.safeAreaLayoutGuide.snp.left).offset(24)
            make.center.equalToSuperview()
        }
    }
    
    @objc
    func didTapLogout() {
        debugPrint("logout called")
        presenter.didUserSelectLogoutAction()
        // call presenter
        // presenter -> interactor untuk remove token
        // interacgtor -> presenter bahwa remove token selesai
        // presenter -> wireframe -> instruksi untuk navigate
    }
	
}

// MARK: - Extensions -

extension HomepageViewController: HomepageViewInterface {
    func greetUser(withName name: String) {
        greetingsLabel.text = "Hi, welcome to Pegadaian, \(name)!"
    }
    
    func showError(_ error: PGSError) {
        
    }
}
