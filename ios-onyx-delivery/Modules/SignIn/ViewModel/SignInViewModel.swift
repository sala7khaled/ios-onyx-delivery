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
    func success(user: SignInResponse)
    func error(error: APIError)
}

class LoginViewModel: SignInInterface {
    
    var user: SignInForm?
    var delegate: SignInResultInterface?
    
    func login(form: SignInForm) {
        if Validator().isNotEmpty(form.user.userId) && Validator().isNotEmpty(form.user.password) && Validator().isPassword(form.user.password) {
            AuthRepo.shared.login(signForm: form) { [ weak self ] response in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    switch response {
                    case let .onSuccess(response):
                        self.delegate?.success(user: response)
                    case let .onFailure(error):
                        self.delegate?.error(error: error)
                    }
                }
            }
        } else {
            delegate?.error(error: APIError(type: .noData, message: Constants.invalidCredentials))
        }
    }
}
