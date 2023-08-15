//
//  Api.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

/**
 APIConfigurations
 
 - parameter development: For the application during the development phase.
 - parameter stage: For the application during the testing phase.
 - parameter production: For the application during the launching on App store.
 */

let API = Api(config: .development)

enum APIConfiguration {

    case development
    case stage
    case production
}

final class Api {
    
    let config: APIConfiguration
    
    var baseUrl: String {
        switch config {
        case .development:
            return "http://mapp.yemensoft.net/"
        case .stage:
            return "http://mapp.yemensoft.net/stage/"
        case .production:
            return "http://mapp.yemensoft.net/production/"
        }
    }
    
    init(config: APIConfiguration) {
        self.config = config
    }
    
    // MARK: - AUTH
    
    let SERVICE_AUTH_LOGIN = "OnyxDeliveryService/Service.svc/CheckDeliveryLogin"


    // MARK: - ORDER
    
    let SERVICE_ORDER_ITEMS = "OnyxDeliveryService/Service.svc/GetDeliveryBillsItems"
}
