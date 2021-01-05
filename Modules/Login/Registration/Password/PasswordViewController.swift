//
//  PasswordViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 05.01.2021.
//  Copyright (c) 2021 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol PasswordDisplayLogic: class {
    func displaySomething(viewModel: Password.Something.ViewModel)
}

class PasswordViewController: UIViewController {
    
    var interactor: PasswordBusinessLogic?
    var router: (NSObjectProtocol & PasswordRoutingLogic & PasswordDataPassing)?
    
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
        let interactor = PasswordInteractor()
        let presenter = PasswordPresenter()
        let router = PasswordRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordRepeatTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
        
        passwordTextField.delegate = self
        passwordRepeatTextField.delegate = self
        nextButton.setEnable(isEnabled: false)
    }
    
    func doSomething() {
        let request = Password.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
    }
    
}

extension PasswordViewController: PasswordDisplayLogic {
    func displaySomething(viewModel: Password.Something.ViewModel) {
        
    }
}

extension PasswordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            textField.text = updatedText
        }
        
        guard
            let password = passwordTextField.text,
            let passwordRepeat = passwordRepeatTextField.text
        else {
            return false
        }
        
        let isEnable = password.count >= 6 &&
            passwordRepeat.count >= 6 &&
            password == passwordRepeat
        nextButton.setEnable(isEnabled: isEnable)
        
        return false
    }
}
