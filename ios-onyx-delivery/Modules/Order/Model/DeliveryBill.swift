//
//  Order.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

struct DeliveryBill: Codable {
    let data: Bill?
}

extension DeliveryBill {
    
    enum CodingKeys: String, CodingKey {
        case order = "Value"
    }
}


struct Bill: Codable {
    let number: String?
    let date: String?
    let tax: String?
}

extension Bill {
    
    enum CodingKeys: String, CodingKey {
        case number = "BILL_NO"
        case date = "BILL_DATE"
        case tax = "TAX_AMT"
    }
}
