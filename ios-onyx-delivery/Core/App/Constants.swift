//
//  Constants.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

enum Constants {
    
    static let defaultCountryCode = "+20"
    static let appName = "Onyx Delivery"
    static let invalidCredentials = "Invalid inputs, please check username, password and try again"
    static let defaultCornerRadius: CGFloat = 22
    static let defaultTimeOut: CGFloat = 120
    static let defaultLanguageNumber: String = "2"
    static let userInfoKey = "userInfoKey"
    
    
    // MARK: - RESPONSE

    static let generalResponse = "Something went worng!"
    static let noInternetResponse = "No internet connection!"
    static let noDataResponse = "No response found!"
    static let serverErrorResponse = "Server error!"
    static let parsingErrorResponse = "Parsing error!"
    static let sessionExpiredResponse = "Session expired!"
    
}


// MARK: - IMAGES

enum Images {
    static let invisible = "ic-password-invisible"
    static let visible = "ic-password-visible"
}
