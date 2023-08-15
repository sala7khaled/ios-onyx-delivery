//
//  OrderDetail.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

struct OrderDetail: Codable {
    let order: Order
}

extension OrderDetail {
    
    enum CodingKeys: String, CodingKey {
        case order = "Value"
    }
}


struct Order: Codable {
    let userId: String
    let language: String
    let serial: String
    let flag: String
}

extension Order {
    
    enum CodingKeys: String, CodingKey {
        case userId = "P_DLVRY_NO"
        case language = "P_LANG_NO"
        case serial = "P_BILL_SRL"
        case flag = "P_PRCSSD_FLG"
    }
}
