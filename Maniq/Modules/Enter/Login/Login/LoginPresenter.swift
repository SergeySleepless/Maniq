//
//  LoginPresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class LoginPresenter {
    
    // MARK: - Private properties -
    
    private unowned let view: LoginViewInterface
    private let interactor: LoginInteractorInterface
    private let wireframe: LoginWireframeInterface
    
    // MARK: - Lifecycle -
    
    init(view: LoginViewInterface, interactor: LoginInteractorInterface, wireframe: LoginWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        setObserverForLogin()
    }
    
    private func setObserverForLogin() {
        NotificationCenter.default.addObserver(forName: Notification.Name("RegisterCompleted"), object: nil, queue: nil) { (notification) in
            self.loadUser(email: CurrentState.shared.email!)
        }
    }
    
    private func loadUser(email: String) {
        view.loadingView(show: true)
        self.interactor.loadUser(email: email) { (error) in
            if let error = error {
                self.wireframe.showErrorAlert(with: error.localizedDescription)
            } else {
                self.wireframe.routeToMain()
            }
            self.view.loadingView(show: false)
        }
    }
    
    private func handleLoginResult(result: AuthResult, email: String) {
        self.view.loadingView(show: false)
        switch result {
        case .accept:
            loadUser(email: email)
        case .failure(let error):
            self.wireframe.showErrorAlert(with: error.localizedDescription)
        }
    }
    
    private func isValid(phoneNumber: String) -> Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = phoneNumber.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return phoneNumber == filtered
    }
    
    private func loginWith(username: String, password: String) {
        interactor.loginWith(username: username, password: password) { result, email  in
            self.view.loadingView(show: false)
            switch result {
            case .accept:
                self.loadUser(email: email)
            case .failure(let error):
                self.wireframe.showErrorAlert(with: error.localizedDescription)
            }
        }
    }
    
    private func loginWith(phoneNumber: String, password: String) {
        interactor.loginWith(phoneNumber: phoneNumber, password: password) { result, email  in
            self.handleLoginResult(result: result, email: email)
        }
    }
    
    func getFormatted(_ phoneNumber: String) -> String {
        let cleanPhoneNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+X (XXX) XXX-XX-XX"
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
}

// MARK: - Extensions -

extension LoginPresenter: LoginPresenterInterface {
    func showResetPassword() {
        wireframe.routeToResetPassword()
    }
    
    func show(_ viewController: UIViewController) {
        wireframe.routeTo(viewController)
    }
    
    func showRegistration() {
        wireframe.routeToRegistration()
    }
    
    func showMain() {
        wireframe.routeToMain()
    }
    
    func login(loginText: String, password: String) {
        if let error = interactor.isFilledData(loginText, password) {
            wireframe.showErrorAlert(with: error.localizedDescription)
            return
        }
        view.loadingView(show: true)
        if isValid(phoneNumber: loginText) {
            loginWith(phoneNumber: getFormatted(loginText), password: password)
            return
        }
        loginWith(username: loginText, password: password)
    }
    
    func vkLogin(delegate: VKAuthDelegate) {
        interactor.vkLogin(delegate: delegate)
    }
    
}
