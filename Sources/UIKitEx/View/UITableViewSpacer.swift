//
//  UITableViewSpacer.swift
//  CalorieApp
//
//  Created by yuki on 2024/05/28.
//

import UIKit

final public class UITableViewSpacer: UILoadTableViewCell {
    public static let reuseIdentifier = "UITableViewSpacer"
    
    public var spacing: CGFloat = 0 {
        didSet { self.updateSpacing() }
    }
    
    public var heightConstraint: NSLayoutConstraint!
    
    private let dummyView = UIView()
    
    public convenience init(spacing: CGFloat) {
        self.init()
        self.spacing = spacing
        
        self.dummyView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.dummyView)
        do {
            let top = self.dummyView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
            top.isActive = true
        }
        
        do {
            let bottom = self.dummyView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            bottom.priority = .defaultHigh
            bottom.isActive = true
        }
        
        do {
            let height = self.dummyView.heightAnchor.constraint(equalToConstant: 0)
            height.isActive = true
            self.heightConstraint = height
        }
        
        self.updateSpacing()
    }
    
    private func updateSpacing() {
        self.heightConstraint.constant = self.spacing
    }
    
    public override func onAwake() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.separatorInset = .init(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        self.updateSpacing()
    }
}

