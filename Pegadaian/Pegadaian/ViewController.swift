//
//  ViewController.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 12/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var greetingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        label.textColor = .black
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 50, weight: .semibold)
        return label
    }()
    
    lazy var tapMeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(tapMeButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    var greetingsBottomConstraint: NSLayoutConstraint?
    
    // Create a button with title "Tap Me"
    // Blue title color
    // When tap, print "Tapped" message

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupTapMeButton()
        setupGreetingsLabel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tapMeButton.frame = CGRect(x: 300, y: 400, width: 100, height: 50)
    }
    
    func setupTapMeButton() {
        view.addSubview(tapMeButton)
    }
    
    func setupGreetingsLabel() {
        view.addSubview(greetingsLabel)
        greetingsBottomConstraint = NSLayoutConstraint(item: greetingsLabel, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        guard let bottomConstraint = greetingsBottomConstraint else { return }
        view.addConstraints([
            bottomConstraint,
            NSLayoutConstraint(item: greetingsLabel, attribute: .right, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 0)
        ])
        view.layoutIfNeeded()
    }
    
    @objc
    func tapMeButtonAction(_ sender: UIButton) {
        debugPrint("Tapped")
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.greetingsBottomConstraint?.constant = -100
            self?.view.layoutIfNeeded()
        }
    }


}

