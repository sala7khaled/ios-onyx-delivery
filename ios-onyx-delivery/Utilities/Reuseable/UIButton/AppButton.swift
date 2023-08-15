//
//  AppButton.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

class AppButton: LoadingButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
}

extension AppButton {
    
    enum ButtonStatus {
        case active
        case inactive
    }
    
    func setStatus(_ status: ButtonStatus) {
        switch status {
        case .active:
            self.isEnabled = true
            self.alpha = 1
        case .inactive:
            self.isEnabled = false
            self.alpha = 0.5
        }
    }
    
}
