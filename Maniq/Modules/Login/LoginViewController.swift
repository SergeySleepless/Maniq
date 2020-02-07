//
//  LoginViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
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
    
    private func hideNavigationBar() {
        navigationController!.navigationBar.isHidden = true
    }
	
    @IBAction func registrationButton(_ sender: UIButton) {
        presenter.showRegistration()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        presenter.login(loginText: login.text!, password: password.text!)
    }
    
}

// MARK: - Extensions -

extension LoginViewController: LoginViewInterface {
    func loadingView(show: Bool) {
        UIUtils.shared.showLoading(view: view, isShow: show)
    }
}
