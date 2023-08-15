//
//  SceneDelegate.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var sessionExpiryTimer: Timer?
    let userDefaults = UserDefaults.standard

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.tintColor = .primary
        
        let vc = userDefaults.string(forKey: Constants.userInfoKey) == nil ? SignInController() : OrderController()
        RootRouter.presentRootScreen(in: window, vc: vc)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDidInteract), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(userDidBecomeInactive), name: UIApplication.willResignActiveNotification, object: nil)
    }

    @objc func userDidInteract() {
        resetSessionExpiryTimer()
    }

    @objc func userDidBecomeInactive() {
        startSessionExpiryTimer()
    }

    func startSessionExpiryTimer() {
        sessionExpiryTimer?.invalidate()
        sessionExpiryTimer = Timer.scheduledTimer(withTimeInterval: Constants.defaultTimeOut, repeats: false) { [weak self] _ in
            self?.sessionExpired()
        }
    }

    func resetSessionExpiryTimer() {
        sessionExpiryTimer?.invalidate()
        startSessionExpiryTimer()
    }

    func sessionExpired() {
        RootRouter.presentRootScreen(in: window, vc: SignInController())
    }
}
