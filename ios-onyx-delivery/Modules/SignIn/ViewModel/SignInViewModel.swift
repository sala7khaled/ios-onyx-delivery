//
//  SignInViewModel.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

protocol SignInInterface {
    func login(form: SignInForm)
}

protocol SignInResultInterface {
    func success()
    func error(error: APIError)
}

class LoginViewModel: SignInInterface {
    
    var user: SignInForm?
    var delegate: SignInResultInterface?
    
    func login(form: SignInForm) {
        if Validator().isNotEmpty(form.username) && Validator().isNotEmpty(form.password) && Validator().isPassword(form.password) {
            delegate?.success()
        } else {
            delegate?.error(error: APIError(type: .noData, message: Constants.invalidCredentials))
        }
    }
}
