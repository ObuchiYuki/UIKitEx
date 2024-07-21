//
//  UITableViewCell+TableView.swift
//  CalorieApp
//
//  Created by yuki on 2024/07/21.
//

import UIKit

extension UITableViewCell {
    public var tableView: UITableView? {
        var view = self.superview
        
        while let superview = view {
            if let tableView = superview as? UITableView { return tableView }
            view = superview.superview
        }
        
        return nil
    }
}

