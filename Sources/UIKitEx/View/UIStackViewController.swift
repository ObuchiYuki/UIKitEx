//
//  UIStackViewController.swift
//  CalorieApp
//
//  Created by yuki on 2024/05/30.
//

import UIKit

open class UIStackViewController: UIViewController {
    public let stackView = UIScrollableStackView()
        
    open override func loadView() {
        self.stackView.backgroundColor = .systemBackground
        self.view = UIView()
        self.view.addSubview(self.stackView)
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.stackView.spacing = 16
        self.stackView.alignment = .center
        self.stackView.distribution = .equalSpacing
    }
}

