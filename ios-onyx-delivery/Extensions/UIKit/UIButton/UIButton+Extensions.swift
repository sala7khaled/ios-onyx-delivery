//
//  UIButton+Extensions.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

extension UIButton {
    
    func setInsets (top: CGFloat = 0, leading: CGFloat = 14, bottom: CGFloat = 0, trailing: CGFloat = 14, imagePadding: CGFloat = 0 ) {
        
        let contentPadding = UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing)
        
        self.contentEdgeInsets = UIEdgeInsets(top: contentPadding.top,
                                              left: contentPadding.left,
                                              bottom: contentPadding.bottom,
                                              right: contentPadding.right + imagePadding)
        self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                            left: imagePadding,
                                            bottom: 0,
                                            right: -imagePadding)
    }
}
