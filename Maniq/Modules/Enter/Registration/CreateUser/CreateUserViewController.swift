//
//  CreateUserViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import FirebaseAuth

final class CreateUserViewController: UITableViewController {
    
    // MARK: - Public properties -
    
    var presenter: CreateUserPresenterInterface!
    
    @IBOutlet weak var usernameTextField: EnterTextField!
    @IBOutlet weak var emailTextField: EnterTextField!
    @IBOutlet weak var nameTextField: EnterTextField!
    @IBOutlet weak var birthDateTextField: EnterTextField!
    @IBOutlet weak var passwordTextField: EnterTextField!
    @IBOutlet weak var repeatPasswordTextField: EnterTextField!
    @IBOutlet weak var roleSegmentedControl: UISegmentedControl!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: "Регистрация")
        presenter.removePreviousControllers()
        createDatePicker()
        setBirthdateDelegate()
    }
    
    private func createDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.locale = Locale(identifier: "ru")
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
        birthDateTextField.inputView = datePicker
    }
    
    private func setBirthdateDelegate() {
        birthDateTextField.delegate = self
    }
    
    @objc private func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        birthDateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        guard presenter.isValid(username: usernameTextField.text!),
            presenter.isValid(email: emailTextField.text!),
            presenter.isValid(firstName: nameTextField.text!),
            presenter.isValid(birthDate: birthDateTextField.text!),
            presenter.isValid(password: passwordTextField.text!),
            presenter.isEqual(password: passwordTextField.text!, repeatPassword: repeatPasswordTextField.text!)
            else {return}
        
        presenter.createUser(username: usernameTextField.text!, email: emailTextField.text!, name: nameTextField.text!, birthDate: birthDateTextField.text!, isMaster: roleSegmentedControl!.selectedSegmentIndex == 0 ? false : true, password: passwordTextField.text!)
    }
    
}

// MARK: - Extensions -

extension CreateUserViewController: CreateUserViewInterface {
    func userNameIsNotValid() {
        usernameTextField.setError()
    }
    
    func emailIsNotValid() {
        emailTextField.setError()
    }
    
    func firstNameNotValid() {
        nameTextField.setError()
    }
    
    func birthDateIsNotValid() {
        birthDateTextField.setError()
    }
    
    func passwordIsNotValid() {
        passwordTextField.setError()
    }
    
    func passwordIsNotEqual() {
        repeatPasswordTextField.setError()
    }
    
    func loadingView(show: Bool) {
        UIUtils.shared.showLoading(view: view.superview!, isShow: show)
    }
    
}

extension CreateUserViewController: UITextFieldDelegate {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
