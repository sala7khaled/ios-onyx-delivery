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
    
    let viewModel = OrderViewModel()
    var orders: [OrderModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        setupView()
        viewModel.getOrder(orderDetail: OrderDetail(order: Order(userId: "1010", language: Constants.defaultLanguageNumber, serial: "", flag: "\(segmentedControl.selectedSegmentIndex)")))
    }
    
    func setupView() {
        viewModel.delegate = self
        
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

    @IBAction func segmentedControlClicked(_ sender: Any) {
        viewModel.getOrder(orderDetail: OrderDetail(order: Order(userId: "1010", language: Constants.defaultLanguageNumber, serial: "", flag: "\(segmentedControl.selectedSegmentIndex)")))
    }
}

extension OrderController: OrderResultInterface {
    func success(bills: BillData) {
        orders.removeAll()
        
        if let billArray = bills.data?.bill {
            for order in billArray {
                
                let taxs = order.tax?.components(separatedBy: ".")
                orders.append(OrderModel(orderId: order.number ?? "", status: order.status ?? "", price: taxs?[0] ?? "", date: order.date ?? ""))
            }
        }
        tableView.reloadData()
    }
    
    
    func error(error: APIError) {
        showError(message: error.message)
    }
    
}
