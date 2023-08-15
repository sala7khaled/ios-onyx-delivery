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
    @IBOutlet weak var btnLogIn: AppButton!
    
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
        
        txtFldUserId.text = "1010"
        txtFldPassword.text = "1"
    }

    
    // MARK: - UI Events
    
    @IBAction func btnLogInClicked(_ sender: Any) {
        btnLogIn.showLoading()
        viewModel.login(form: SignInForm(user: User(userId: txtFldUserId.text ?? "", password: txtFldPassword.text ?? "", language: Constants.defaultLanguageNumber)))
    }
}

extension SignInController: SignInResultInterface {
    func success(user: SignInResponse) {
        btnLogIn.hideLoading()
        
        if user.result?.message == "Successful" {
            RootRouter.presentRoot(OrderController())
        } else {
            showError(message: user.result?.message ?? Constants.generalResponse)
        }
    }
    
    func error(error: APIError) {
        btnLogIn.hideLoading()
        showError(message: error.message)
    }
    
}
