//
//  APIData.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

/// The generic response for current API

struct APIData<T: Decodable>: Decodable {
    
    var status: String?
    var message: String?
    var data: T?
}
