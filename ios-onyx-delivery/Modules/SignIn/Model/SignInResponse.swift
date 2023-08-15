//
//  SignInResponse.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

struct SignInResponse: Codable {
    let data: UserData?
    let result: Result?
}

extension SignInResponse {
    
    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case result = "Result"
    }
}

struct UserData: Codable {
    let name: String?
}

extension UserData {
    enum CodingKeys: String, CodingKey {
        case name = "DeliveryName"
    }
}


struct Result: Codable {
    let message: String?
    let number: Int?
}

extension Result {
    
    enum CodingKeys: String, CodingKey {
        case message = "ErrMsg"
        case number = "ErrNo"
    }
}
