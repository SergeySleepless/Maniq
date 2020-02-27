//
//  LoginViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: LoginPresenterInterface!

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    // MARK: - Private properties -

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }
    
    @objc private func showMain() {
        presenter.showMain()
    }
    
    private func hideNavigationBar() {
        navigationController!.navigationBar.isHidden = true
    }
	
    @IBAction func registrationButton(_ sender: UIButton) {
        presenter.showRegistration()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        presenter.login(loginText: login.text!, password: password.text!)
    }
    
    @IBAction func resetPasswordButton(_ sender: UIButton) {
        presenter.showResetPassword()
    }
    
}

// MARK: - Extensions -

extension LoginViewController: LoginViewInterface {
    func loadingView(show: Bool) {
        UIUtils.shared.showLoading(view: view, isShow: show)
    }
}

extension LoginViewController: VKAuthDelegate {
    func authShouldShow(_ viewController: UIViewController) {
        //presenter.show(viewController)
    }
    
    func authSignIn() {
        
    }
    
    func authDidSignInFail() {
        
    }
}
