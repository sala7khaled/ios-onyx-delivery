//
//  UIView+Extensions.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    func applyShadow(radius: CGFloat = 10, color: UIColor = .appBlack) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 5.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
    
}
