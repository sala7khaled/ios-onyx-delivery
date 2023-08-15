//
//  OrderService.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

extension Api {
    
    enum Order: ServiceProtocol {
        
        case getOrder(orderDetail: OrderDetail)
        
        var path: String {
            switch self {
            case .getOrder:
                return API.SERVICE_ORDER_ITEMS
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getOrder:
                return .POST
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .getOrder:
                return nil
            }
        }
        
        var headers: Headers? {
            switch self {
            case .getOrder:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case let .getOrder(orderDetail):
                return orderDetail
            }
        }
    }
}
