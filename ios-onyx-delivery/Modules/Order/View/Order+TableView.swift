//
//  Order+TableView.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

extension OrderController: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        tableView.initialize(cellClass: OrderCell.self, delegate: self, dataSource: self, edgeInsets: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: OrderCell.self)
        
        var s: [OrderModel] = []
        s.append(OrderModel(orderId: "ssss", status: "sss", price: "sss", date: "sssssssss"))
        s.append(OrderModel(orderId: "ssss", status: "sss", price: "sss", date: "sssssssss"))
        s.append(OrderModel(orderId: "ssss", status: "sss", price: "sss", date: "sssssssss"))
        s.append(OrderModel(orderId: "ssss", status: "sss", price: "sss", date: "sssssssss"))
        s.append(OrderModel(orderId: "ssss", status: "sss", price: "sss", date: "sssssssss"))
        s.append(OrderModel(orderId: "ssss", status: "sss", price: "sss", date: "sssssssss"))
        s.append(OrderModel(orderId: "ssss", status: "sss", price: "sss", date: "sssssssss"))
        
        cell.configure(with: s[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        showAlert(title: s[indexPath.row], message: s[indexPath.row])
    }
}
