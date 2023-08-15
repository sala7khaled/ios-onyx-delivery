//
//  UIViewController+Extensions.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

extension UIViewController {
    
    static func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
    private func present(_ vc: UIViewController) {
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
    }
    
    func showAlert(title: String, message: String) {
        AlertController.shared.show(in: self, title: title, message: message)
    }
    
    func showError(message: String?) {
        AlertController.shared.show(in: self, message: message ?? Constants.generalResponse)
    }
    
}
