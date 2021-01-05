//
//  UsernameViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import ManiqUI

protocol UsernameDisplayLogic: class {
    func displaySendUsername(viewModel: Username.SendUsername.ViewModel)
}

class UsernameViewController: LoadingViewController {
    
    var interactor: UsernameBusinessLogic?
    var router: (NSObjectProtocol & UsernameRoutingLogic & UsernameDataPassing)?
    
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
        let interactor = UsernameInteractor()
        let presenter = UsernamePresenter()
        let router = UsernameRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var nextButton: UIButton!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        nextButton.setEnable(isEnabled: false)
        removePrevViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        usernameTextField.becomeFirstResponder()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        guard
            let username = usernameTextField.text
        else {
            return
        }
        usernameTextField.resignFirstResponder()
        showLoading(from: view)
        
        let request = Username.SendUsername.Request(username: username)
        interactor?.sendUsername(request: request)
    }
    
}

extension UsernameViewController: UsernameDisplayLogic {
    func displaySendUsername(viewModel: Username.SendUsername.ViewModel) {
        hideLoading(from: view)
        if let error = viewModel.error {
            showErrorAlert(title: "Ошибка", body: error)
        } else {
            // TODO: Next
        }
    }
}

extension UsernameViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text) {
           let updatedText = text.replacingCharacters(in: textRange,
                                                      with: string)
            textField.text = updatedText
            nextButton.setEnable(isEnabled: textField.hasText)
        }
        return false
    }
}
