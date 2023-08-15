//
//  Response.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

enum APIResponse<T> {

    case onSuccess(T)
    case onFailure(APIError)
}
