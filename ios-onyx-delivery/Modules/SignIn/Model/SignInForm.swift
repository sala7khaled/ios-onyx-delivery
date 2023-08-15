//
//  SignInForm.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

struct SignInForm {
    var username: String?
    var password: String?
    
    init(username: String?, password: String?) {
        self.username = username
        self.password = password
    }
}
