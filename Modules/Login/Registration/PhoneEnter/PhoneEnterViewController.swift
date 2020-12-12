//
//  PhoneEnterViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import ManiqUI

protocol PhoneEnterDisplayLogic: class {
    func displayFormatePhone(viewModel: PhoneEnter.FormatPhone.ViewModel)
    func displaySendCode(viewModel: PhoneEnter.SendCode.ViewModel)
}

class PhoneEnterViewController: LoadingViewController {
    
    var interactor: PhoneEnterBusinessLogic?
    var router: (NSObjectProtocol & PhoneEnterRoutingLogic & PhoneEnterDataPassing)?
    
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
        let interactor = PhoneEnterInteractor()
        let presenter = PhoneEnterPresenter()
        let router = PhoneEnterRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var nextButton: UIButton!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar(isHidden: false)
        phoneTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !phoneTextField.hasText {
            phoneTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        guard let phone = phoneTextField.text
        else {
            return
        }
        phoneTextField.resignFirstResponder()
        
        showLoading(from: view)
        let request = PhoneEnter.SendCode.Request(phone: phone)
        interactor?.sendCode(request: request)
    }
    
}

extension PhoneEnterViewController: PhoneEnterDisplayLogic {
    func displayFormatePhone(viewModel: PhoneEnter.FormatPhone.ViewModel) {
        phoneTextField.text = viewModel.formattedPhone
        nextButton.setEnable(isEnabled: viewModel.isValid)
    }
    
    func displaySendCode(viewModel: PhoneEnter.SendCode.ViewModel) {
        hideLoading(from: view)
        if let error = viewModel.error {
            showErrorAlert(title: "Ошибка", body: error.localizedDescription)
        } else {
            router?.routeToCheckCode()
        }
    }
}

extension PhoneEnterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard var text = textField.text else { return false }
        var request = PhoneEnter.FormatPhone.Request(phone: text + string)
        if string == "" {
            if let range = Range(range, in: text) {
                text.removeSubrange(range)
                request = .init(phone: text)
            }
        }
        interactor?.formatePhone(request: request)
        return false
    }
}
