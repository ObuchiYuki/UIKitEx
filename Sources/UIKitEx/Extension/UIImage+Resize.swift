//
//  UIImage+Resize.swift
//  CalorieApp
//
//  Created by yuki on 2024/06/28.
//

import UIKit

extension UIImage {
    public func resized(fitInto size: CGSize) -> UIImage? {
        let scale = self.size.aspectFitRatio(fitInside: size)
        let targetSize = CGSize(
            width: self.size.width * scale,
            height: self.size.height * scale
        )
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: targetSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    public func resized(fillOver size: CGSize) -> UIImage? {
        let scale = self.size.aspectFillRatio(fillInside: size)
        let targetSize = CGSize(
            width: self.size.width * scale,
            height: self.size.height * scale
        )
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: targetSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
}
