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
        provider.request(type: BillData.self, service: Api.Order.getOrder(orderDetail: orderDetail)) { [self] response in
            switch (response) {
            case let .onSuccess(response):
                self.insertOrderIntoLocal(response.data!.bill)
                if let bills = getOrderFromLocal() {
                    completion(.onSuccess(BillData(data: DeliveryBill(bill: bills))))
                } else {
                    completion(.onFailure(APIError(type: .noData, message: Constants.noDataResponse)))
                }
                
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }
    
    func insertOrderIntoLocal(_ bills: [Bill]) {
        LocalDataSource.shared.upsertBills(bills: bills)
    }
    
    func getOrderFromLocal() -> [Bill]? {
        return LocalDataSource.shared.retrieveBills()
    }

}
