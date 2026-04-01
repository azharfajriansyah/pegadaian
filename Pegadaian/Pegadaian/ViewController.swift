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
        label.textColor = .white
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 50, weight: .semibold)
        return label
    }()
    
    lazy var tapMeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(tapMeButtonAction(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupGreetingsLabel()
        setupTapMeButton()
    }
    
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupTapMeButton() {
        view.addSubview(tapMeButton)
        view.addConstraints([
            NSLayoutConstraint(item: tapMeButton, attribute: .left, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tapMeButton, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tapMeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 100),
            NSLayoutConstraint(item: tapMeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 80),
            
        ]
        )
    }
    
    func setupGreetingsLabel() {
        view.addSubview(greetingsLabel)
        view.addConstraints([
            NSLayoutConstraint(item: greetingsLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: greetingsLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        ])
        view.layoutIfNeeded()
    }
    
    @objc
    func tapMeButtonAction(_ sender: UIButton) {
        debugPrint("Tapped")
    }


}

