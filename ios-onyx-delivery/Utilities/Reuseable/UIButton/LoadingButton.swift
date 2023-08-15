//
//  LoadingButton.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

class LoadingButton: UIButton {
    
    var originalButtonText: String?
    var activityIndicator: UIActivityIndicatorView!
    
    func configure(radius: CGFloat = Constants.defaultCornerRadius,
                   textFont: UIFont = .systemFont(ofSize: 14, weight: .medium),
                   textColor: UIColor = .appWhite,
                   backColor: UIColor = .primary,
                   borderColor: UIColor? = nil) {
        
        titleLabel?.font = textFont
        layer.cornerRadius = radius
        setTitleColor(textColor, for: .normal)
        backgroundColor = backColor
        
        if let borderColor {
            layer.borderWidth = 1.5
            layer.borderColor = borderColor.cgColor
        }
    }
    
    func showLoading() {
        isEnabled = false
        originalButtonText = self.titleLabel?.text
        setTitle("", for: .normal)
        
        if activityIndicator == nil {
            activityIndicator = createActivityIndicator()
        }
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        if activityIndicator != nil && activityIndicator.isAnimating {
            isEnabled = true
            setTitle(originalButtonText, for: .normal)
            
            if activityIndicator.isAnimating {
                activityIndicator.stopAnimating()
            }
        }
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .appWhite
        return activityIndicator
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
}
