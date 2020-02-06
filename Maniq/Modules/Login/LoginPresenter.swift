//
//  LoginPresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

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
    }
}

// MARK: - Extensions -

extension LoginPresenter: LoginPresenterInterface {
    func showRegistration() {
        wireframe.routeToRegistration()
    }
    
    func login(username: String, password: String) {
        interactor.loginWith(username: username, password: password) { authData, error in
            print(error)
        }
    }
    
}
