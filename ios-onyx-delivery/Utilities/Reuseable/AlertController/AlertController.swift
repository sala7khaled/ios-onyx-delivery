//
//  AlertController.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

class AlertController: UIViewController {
    
    static let shared = AlertController()
    var alert: UIAlertController = UIAlertController()
    
    func show(in vc: UIViewController?,
              title: String? = nil,
              message: String? = nil,
              btnTitle: String? = nil,
              withCancel: Bool = false,
              style: UIAlertController.Style = .alert,
              handler: ((UIAlertAction) -> ())? = nil
    ) {
        alert = UIAlertController(title: "", message: nil, preferredStyle: style)
        
        let titleFont = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)
        ]
        
        let messageFont = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)
        ]
        
        if let title = title {
            let titleAttr = NSMutableAttributedString(string: title,
                                                      attributes: titleFont)
            alert.setValue(titleAttr, forKey: "attributedTitle")
        }
        
        if let message = message {
            let messageAttr = NSMutableAttributedString(string: message,
                                                      attributes: messageFont)
            alert.setValue(messageAttr, forKey: "attributedMessage")
        }
        
        alert.addAction(UIAlertAction(title: btnTitle ?? "Ok", style: .default, handler: handler))
        
        if (withCancel) {
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        }
        
        vc?.present(alert, animated: true)
    }
}
