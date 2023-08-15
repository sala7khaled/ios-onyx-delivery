//
//  AuthRepo.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

class AuthRepo: Repo {
    
    static let shared = AuthRepo()

    func login(signForm: SignInForm, _ completion: @escaping (APIResponse<SignInResponse>) -> ()) {
        provider.request(type: SignInResponse.self, service: Api.Auth.login(signForm: signForm)) { response in
            switch (response) {
            case let .onSuccess(response):
                completion(.onSuccess(response))
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }

}
