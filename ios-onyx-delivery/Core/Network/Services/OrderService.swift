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
            case .login:
                return API.SERVICE_AUTH_LOGIN
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .login:
                return .POST
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .login:
                return nil
            }
        }
        
        var headers: Headers? {
            switch self {
            case .login:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case let .login(signForm):
                return signForm
            }
        }
    }
}
