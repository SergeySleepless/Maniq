//
//  LoginViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import ManiqUI

protocol LoginDisplayLogic: class {
    func displayLogin(viewModel: Login.Login.ViewModel)
}

class LoginViewController: LoadingViewController {
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.setEnable(isEnabled: false)
        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setDelegates() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              !login.isEmpty,
              !password.isEmpty
        else {
            return
        }
        
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        showLoading(from: view)
        let request = Login.Login.Request(login: login, password: password)
        interactor?.login(request: request)
    }
    
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        router?.routeToForgotPassword()
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        router?.routeToRegistration()
    }
    
}

extension LoginViewController: LoginDisplayLogic {
    func displayLogin(viewModel: Login.Login.ViewModel) {
        hideLoading(from: view)
        if let error = viewModel.error {
            showErrorAlert(title: "Ошибка", body: error.localizedDescription)
            print(error)
        } else {
            // TODO: Login
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text) {
           let updatedText = text.replacingCharacters(in: textRange,
                                                      with: string)
            textField.text = updatedText
        }
        let hasField = loginTextField.hasText && passwordTextField.hasText
        loginButton.setEnable(isEnabled: hasField)
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text?.removeAll()
        let hasField = loginTextField.hasText && passwordTextField.hasText
        loginButton.setEnable(isEnabled: hasField)
        return false
    }
}
