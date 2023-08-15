//
//  ServiceProtocol.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

typealias Headers = [String : String]
typealias Parameters = [String : Any]

protocol ServiceProtocol {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: Headers? { get }
    var body: Any? { get }
}
