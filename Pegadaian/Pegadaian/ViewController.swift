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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupGreetingsLabel()
    }
    
    func setupGreetingsLabel() {
        view.addSubview(greetingsLabel)
        view.addConstraints([
            NSLayoutConstraint(item: greetingsLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: greetingsLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        ])
        view.layoutIfNeeded()
    }


}

