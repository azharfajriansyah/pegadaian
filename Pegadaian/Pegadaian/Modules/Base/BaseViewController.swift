//
//  BaseViewController.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 26/09/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonAction))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = searchButton
    }
    
    @objc
    func searchButtonAction() {
        debugPrint("Search tapped")
    }

}
