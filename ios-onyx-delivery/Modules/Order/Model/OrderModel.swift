//
//  OrderModel.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

struct OrderModel {
    var orderId: String
    var customer: String
    var status: String
    var price: String?
    var date: String
}

enum Loading {
    case show
    case hide
}
