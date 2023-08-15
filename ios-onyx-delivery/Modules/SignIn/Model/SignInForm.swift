//
//  SignInForm.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

struct SignInForm: Codable {
    let user: User
}

extension SignInForm {
    
    enum CodingKeys: String, CodingKey {
        case user = "Value"
    }
}


struct User: Codable {
    let userId: String
    let password: String
    let language: String
}

extension User {
    
    enum CodingKeys: String, CodingKey {
        case userId = "P_DLVRY_NO"
        case password = "P_PSSWRD"
        case language = "P_LANG_NO"
    }
}
