//
//  Validator.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation

class Validator: NSObject {
    
    struct ValidationRegEx {
        static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,256}"
        static let phone = "^[+]?[0-9.-٩ -]{7,18}$"
        static let accountNumber = "[0-9.-٩]{14,16}$"
    }
    
    static var shared = Validator()
    
    func isNotEmpty(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count > 0
    }
    
    func isName(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count > 3
    }
    
    func isEmail(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.email)
    }
    
    func isPhone(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.phone)
    }
    
    func isAccountNumber(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.accountNumber)
    }
    
    func isIBAN(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count == 24
    }
    
    func isPassword(_ text: String?) -> Bool {
        /* The password should be >= 8
           But the credentials in the attached pdf used a password with 1 digit
        */
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count >= 1
    }
    
    func isCode(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count == 6
    }
    
    func validate(_ text: String?, _ regEx: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regEx)
        return test.evaluate(with: text)
    }
}
