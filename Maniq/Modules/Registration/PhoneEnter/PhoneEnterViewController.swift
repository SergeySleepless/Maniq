//
//  PhoneEnterViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class PhoneEnterViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: PhoneEnterPresenterInterface!
    
    // MARK: - Outlets -
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: "Регистрация")
        configurePhoneTextField()
        hideKeyboardWhenTappedAround()
    }
    
    private func configurePhoneTextField() {
        phoneNumberTextField.becomeFirstResponder()
        phoneNumberTextField.delegate = self
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        presenter.auth(phoneNumber: phoneNumberTextField.text!)
    }
    
}

// MARK: - Extensions -

extension PhoneEnterViewController: PhoneEnterViewInterface {
    func nextButtonIs(enabled: Bool) {
        nextButton.isEnabled = enabled
        nextButton.backgroundColor = enabled ? UIColor.blue : UIColor.lightGray
    }
    
    func loadingView(show: Bool) {
        UIUtils.shared.showLoading(view: view, isShow: show)
    }
}

extension PhoneEnterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = presenter.getFormattedPhoneNumber(number: newString)
        return false
    }
}
