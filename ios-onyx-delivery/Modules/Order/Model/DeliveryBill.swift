//
//  Order.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

struct BillData: Codable {
    let data: DeliveryBill?
}

extension BillData {
    
    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
}


struct DeliveryBill: Codable {
    let bill: [Bill]
}

extension DeliveryBill {
    
    enum CodingKeys: String, CodingKey {
        case bill = "DeliveryBills"
    }
}


struct Bill: Codable {
    let number: String?
    let date: String?
    let tax: String?
    let status: String?
}

extension Bill {
    
    enum CodingKeys: String, CodingKey {
        case number = "BILL_NO"
        case date = "BILL_DATE"
        case tax = "TAX_AMT"
        case status = "DLVRY_STATUS_FLG"
    }
}
