//
//  OrderController.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

class OrderController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: IntrinsicTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        setupView()
    }
    
    func setupView() {
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
