//
//  ResetPasswordViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import ManiqUI

protocol ResetPasswordDisplayLogic: class {
    func displayResetPassword(viewModel: ResetPassword.ResetPassword.ViewModel)
}

class ResetPasswordViewController: LoadingViewController {
    
    var interactor: ResetPasswordBusinessLogic?
    var router: (NSObjectProtocol & ResetPasswordRoutingLogic & ResetPasswordDataPassing)?
    
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
        let interactor = ResetPasswordInteractor()
        let presenter = ResetPasswordPresenter()
        let router = ResetPasswordRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var resetButton: UIButton!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        resetButton.setEnable(isEnabled: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !loginTextField.hasText {
            loginTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        guard
            let login = loginTextField.text
        else {
            return
        }
        
        loginTextField.resignFirstResponder()
        showLoading(from: view)
        let request = ResetPassword.ResetPassword.Request(login: login)
        interactor?.resetPassword(request: request)
    }
    
}

extension ResetPasswordViewController: ResetPasswordDisplayLogic {
    func displayResetPassword(viewModel: ResetPassword.ResetPassword.ViewModel) {
        hideLoading(from: view)
        if let error = viewModel.error {
            showErrorAlert(title: "Ошибка", body: error.localizedDescription)
        } else {
            
        }
    }
}

extension ResetPasswordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text) {
           let updatedText = text.replacingCharacters(in: textRange,
                                                      with: string)
            textField.text = updatedText
        }
        resetButton.setEnable(isEnabled: loginTextField.hasText)
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text?.removeAll()
        resetButton.setEnable(isEnabled: loginTextField.hasText)
        return false
    }
}
