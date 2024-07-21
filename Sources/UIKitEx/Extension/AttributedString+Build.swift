//
//  AttributedString+Build.swift
//  CalorieApp
//
//  Created by yuki on 2024/06/30.
//

import UIKit

@available(iOS 15.0, *)
extension AttributedString {
    static func build(_ build: (inout AttributedString) -> Void) -> AttributedString {
        var attributedString = AttributedString()
        build(&attributedString)
        return attributedString
    }
    
    static func build(_ string: String, _ build: (inout AttributedString) -> Void) -> AttributedString {
        var attributedString = AttributedString(string)
        build(&attributedString)
        return attributedString
    }
}


