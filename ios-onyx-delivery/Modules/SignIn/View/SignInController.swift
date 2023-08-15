//
//  SignInController.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

class SignInController: UIViewController {
    
    
    @IBOutlet weak var txtFldUserId: AppTextField!
    @IBOutlet weak var txtFldPassword: AppTextField!
    
    let viewModel = LoginViewModel()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        viewModel.delegate = self
        txtFldPassword.enablePasswordToggle()
    }

    
    // MARK: - UI Events
    
    @IBAction func btnLogInClicked(_ sender: Any) {
        viewModel.login(form: SignInForm(username: txtFldUserId.text, password: txtFldPassword.text))
    }
}

extension SignInController: SignInResultInterface {
    func success() {
        print("success")
    }
    
    func error(error: APIError) {
        showError(message: error.message)
    }
    
}
