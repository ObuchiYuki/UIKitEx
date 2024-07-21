//
//  UIViewController+.swift
//  CalorieApp
//
//  Created by yuki on 2024/05/28.
//

import UIKit

extension UIViewController {
    public static func color(_ backgroundColor: UIColor) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = backgroundColor
        return viewController
    }
}
