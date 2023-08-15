//
//  OrderViewModel.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

protocol OrderInterface {
    func getOrder(orderDetail: OrderDetail)
}

protocol OrderResultInterface {
    func success(bills: BillData)
    func error(error: APIError)
}

class OrderViewModel: OrderInterface {
    
    var delegate: OrderResultInterface?
    
    func getOrder(orderDetail: OrderDetail) {
        OrderRepo.shared.getOrder(orderDetail: orderDetail) { [ weak self ] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response {
                case let .onSuccess(response):
                    self.delegate?.success(bills: response)
                case let .onFailure(error):
                    self.delegate?.error(error: error)
                }
            }
        }
    }
}
