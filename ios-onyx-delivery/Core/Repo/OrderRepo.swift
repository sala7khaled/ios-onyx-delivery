//
//  OrderRepo.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

class OrderRepo: Repo {
    
    static let shared = OrderRepo()

    func getOrder(orderDetail: OrderDetail, _ completion: @escaping (APIResponse<BillData>) -> ()) {
        provider.request(type: BillData.self, service: Api.Order.getOrder(orderDetail: orderDetail)) { response in
            switch (response) {
            case let .onSuccess(response):
                completion(.onSuccess(response))
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }

}
