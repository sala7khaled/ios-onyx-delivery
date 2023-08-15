//
//  Order+SegmentedControl.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

extension OrderController {

    func setupSegmentedControl() {
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.appWhite
        ]
        segmentedControl.setTitleTextAttributes(selectedAttributes, for: .selected)
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.appBlack
        ]
        segmentedControl.setTitleTextAttributes(normalAttributes, for: .normal)
        segmentedControl.layer.cornerRadius = 2
        segmentedControl.clipsToBounds = true
    }
}
