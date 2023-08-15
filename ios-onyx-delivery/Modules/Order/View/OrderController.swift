//
//  OrderController.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

class OrderController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: IntrinsicTableView!
    @IBOutlet weak var lblDeliveryName: UILabel!
    
    let userDefaults = UserDefaults.standard
    
    let viewModel = OrderViewModel()
    var orders: [OrderModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        setupView()
        getOrder()
    }
    
    func setupView() {
        viewModel.delegate = self
        setupSegmentedControl()
        setupLoading(.show)
        setUserInfo()
    }
    
    func getOrder() {
        viewModel.getOrder(orderDetail: OrderDetail(order: Order(userId: "1010", language: Constants.defaultLanguageNumber, serial: "", flag: "\(segmentedControl.selectedSegmentIndex)")))
    }
    
    func setUserInfo() {
        if let userInfo = userDefaults.string(forKey: Constants.userInfoKey) {
            lblDeliveryName.text = userInfo
        }
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
                orders.append(OrderModel(orderId: order.number ?? "", customer: order.customer ?? "", status: order.status ?? "", price: order.tax ?? "", date: order.date ?? ""))
            }
        }
        tableView.reloadData()
        setupLoading(.hide)
    }
    
    func error(error: APIError) {
        showError(message: error.message)
    }
    
}


// MARK: - Loading

extension OrderController {
    func setupLoading(_ load: Loading) {
        
        switch load {
        case .show:
            loadingIndicator.startAnimating()
            loadingIndicator.isHidden = false
            tableView.isHidden = true
            break
        case .hide:
            loadingIndicator.stopAnimating()
            loadingIndicator.isHidden = true
            tableView.isHidden = false
            break
        }
    }
}
