//
//  UIScrollableStackView.swift
//  CalorieApp
//
//  Created by yuki on 2024/06/13.
//

import UIKit

open class UIScrollableStackView: UILoadScrollView {
    open var alignment: UIStackView.Alignment {
        get { self.stackView.alignment }
        set { self.stackView.alignment = newValue }
    }
    
    open var distribution: UIStackView.Distribution {
        get { self.stackView.distribution }
        set { self.stackView.distribution = newValue }
    }
    
    open var spacing: CGFloat {
        get { self.stackView.spacing }
        set { self.stackView.spacing = newValue }
    }
    
    open func addArrangedSubview(_ view: UIView) {
        self.stackView.addArrangedSubview(view)
    }
    
    open func removeArrangedSubview(_ view: UIView) {
        self.stackView.removeArrangedSubview(view)
    }
    
    open func insertArrangedSubview(_ view: UIView, at stackIndex: Int) {
        self.stackView.insertArrangedSubview(view, at: stackIndex)
    }
    
    open func setCustomSpacing(_ spacing: CGFloat, after view: UIView) {
        self.stackView.setCustomSpacing(spacing, after: view)
    }
        
    open override var contentInset: UIEdgeInsets {
        didSet {
            self.leadingConstraint?.constant = self.contentInset.left
            self.trailingConstraint?.constant = -self.contentInset.right
            self.setNeedsUpdateConstraints()
        }
    }
    
    public let stackView = UIStackView()
    
    private var trailingConstraint: NSLayoutConstraint?
    
    private var leadingConstraint: NSLayoutConstraint?
    
    open override func onAwake() {
        self.stackView.distribution = .equalSpacing
        self.stackView.isUserInteractionEnabled = true
        self.stackView.axis = .vertical
        self.addSubview(self.stackView)
        self.contentInset = .zero
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor).isActive = true
        
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.frameLayoutGuide.leadingAnchor)
        leadingConstraint.isActive = true
        self.leadingConstraint = leadingConstraint
        
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.frameLayoutGuide.trailingAnchor)
        trailingConstraint.isActive = true
        self.trailingConstraint = trailingConstraint
        
        do {
            let bottom = self.stackView.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor)
            bottom.priority = .defaultLow
            bottom.isActive = true
        }
        
//        self.stackView.widthAnchor.constraint(equalTo: self.frameLayoutGuide.widthAnchor).isActive = true
    }
}
