//
//  UITableViewController+Keybaord.swift
//  CalorieApp
//
//  Created by yuki on 2024/07/16.
//

import UIKit

extension UITableViewController {
    private static var _isKeyboardInsetsAdjustmentEnabled: UInt8 = 0
    
    private static var _showKeyboardDisposer: UInt8 = 0
    private static var _hideKeyboardDisposer: UInt8 = 0
    
    private static var _initialContentInset: UInt8 = 0
    
    private static var _keyboardInsetsAdjustmentBehavior: UInt8 = 0
    
    public enum KeyboardInsetsAdjustmentBehavior: UInt8 {
        case appendKeyboardHeight
        case overrideKeyboardHeight
    }
    
    public var isKeyboardInsetsAdjustmentEnabled: Bool {
        get {
            objc_getAssociatedObject(self, &UITableViewController._isKeyboardInsetsAdjustmentEnabled) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &UITableViewController._isKeyboardInsetsAdjustmentEnabled, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if newValue {
                self.setupKeyboardAdjustment()
            } else {
                self.removeKeyboardAdjustment()
            }
        }
    }
    
    public var keyboardInsetsAdjustmentBehavior: KeyboardInsetsAdjustmentBehavior {
        get {
            objc_getAssociatedObject(self, &UITableViewController._keyboardInsetsAdjustmentBehavior) as? KeyboardInsetsAdjustmentBehavior ?? .overrideKeyboardHeight
        }
        set {
            objc_setAssociatedObject(self, &UITableViewController._keyboardInsetsAdjustmentBehavior, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var showKeyboardDisposer: DisposerBox? {
        get {
            objc_getAssociatedObject(self, &UITableViewController._showKeyboardDisposer) as? DisposerBox
        }
        set {
            objc_setAssociatedObject(self, &UITableViewController._showKeyboardDisposer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var hideKeyboardDisposer: DisposerBox? {
        get {
            objc_getAssociatedObject(self, &UITableViewController._hideKeyboardDisposer) as? DisposerBox
        }
        set {
            objc_setAssociatedObject(self, &UITableViewController._hideKeyboardDisposer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var initialContentInset: UIEdgeInsets {
        get {
            objc_getAssociatedObject(self, &UITableViewController._initialContentInset) as? UIEdgeInsets ?? .zero
        }
        set {
            objc_setAssociatedObject(self, &UITableViewController._initialContentInset, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    final private class DisposerBox: @unchecked Sendable {
        var disposer: any NSObjectProtocol
        
        init(disposer: any NSObjectProtocol) {
            self.disposer = disposer
        }
    }
    
    private func setupKeyboardAdjustment() {
        do {
            let disposer = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main, using: {[weak self] in
                guard let self = self else {
                    if let disposer = self?.showKeyboardDisposer?.disposer {
                        NotificationCenter.default.removeObserver(disposer)
                    }
                    return
                }
                self.keyboardWillShow($0)
            })
            self.showKeyboardDisposer = .init(disposer: disposer)
        }
        do {
            let disposer = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main, using: {[weak self] in
                guard let self = self else {
                    if let disposer = self?.hideKeyboardDisposer?.disposer {
                        return NotificationCenter.default.removeObserver(disposer)
                    }
                    return
                }
                self.keyboardWillHide($0)
            })
            self.hideKeyboardDisposer = .init(disposer: disposer)
        }
    }
    
    private func removeKeyboardAdjustment() {
        if let disposer = self.showKeyboardDisposer {
            NotificationCenter.default.removeObserver(disposer)
        }
        if let disposer = self.hideKeyboardDisposer {
            NotificationCenter.default.removeObserver(disposer)
        }
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        self.initialContentInset = self.tableView.contentInset
        
        var newContentInset = self.tableView.contentInset
        switch self.keyboardInsetsAdjustmentBehavior {
        case .appendKeyboardHeight:
            newContentInset.bottom += keyboardFrame.height
        case .overrideKeyboardHeight:
            newContentInset.bottom = keyboardFrame.height
        }
        
        self.tableView.contentInset = newContentInset
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        self.tableView.contentInset = self.initialContentInset
    }
}
