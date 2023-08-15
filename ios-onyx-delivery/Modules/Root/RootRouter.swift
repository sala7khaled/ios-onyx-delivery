//
//  RootRouter.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

class RootRouter {
    
    static func pushVC(_ vc: UIViewController, in viewController: UIViewController, animated: Bool = true) {
        viewController.navigationController?.pushViewController(vc, animated: animated)
    }
    
    static func presentRootScreen(in window: UIWindow?, vc: UIViewController) {
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    static func presentRoot(_ vc: UIViewController) {
        let window = UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    static func resetApp() {
//        resetApp(with: SplashController())
    }
    
    static func resetApp(with vc: UIViewController) {
        let window = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({$0 as? UIWindowScene})
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow }).first
        
        window?.makeKeyAndVisible()
        window?.tintColor = .primary
        window?.rootViewController = vc
    }
}
