//
//  SignInResponse.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

struct SignInResponse: Codable {
    let result: Result?
}

extension SignInResponse {
    
    enum CodingKeys: String, CodingKey {
        case result = "Result"
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
