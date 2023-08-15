//
//  AppTextField.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

class AppTextField: UITextField {
    
    var borderColor = UIColor.clear.cgColor
    let borderErrorColor = UIColor.appRed.cgColor
    let backColor = UIColor.appCell.cgColor
    
    let borderWidth : CGFloat = 1
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    var errorMessage: String?
    
    var isValid = true {
        didSet {
            self.layer.borderColor = isValid ? borderColor : borderErrorColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = Constants.defaultCornerRadius
        layer.backgroundColor = backColor
        attributedPlaceholder
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        clipsToBounds = true
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    @IBInspectable var placeholderColor: UIColor = UIColor.appBlack {
        didSet {
            if let placeholder = self.placeholder {
                let attributes = [NSAttributedString.Key.foregroundColor: placeholderColor]
                self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
            }
        }
    }
}

// MARK:- Hide/Show Password

extension AppTextField {
    
    func enablePasswordToggle() {
        let button = UIButton(type: .custom)
        
        self.isSecureTextEntry = true
        setPasswordToggleImage(button)
        button.setInsets(top: 0, leading: 0, bottom: 0, trailing: 0, imagePadding: 18)
        
//        var x: CGFloat
//        x = Localization.shared.currentLanguage() == .English ? self.frame.size.width - 25 : 25
        button.frame = CGRect(x: CGFloat(25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        
        self.rightView = button
        self.rightViewMode = .always
    }
    
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if (isSecureTextEntry) {
            button.setImage(UIImage(named: Images.invisible), for: .normal)
            
        } else {
            button.setImage(UIImage(named: Images.visible), for: .normal)
        }
        
    }
    
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
    
}
