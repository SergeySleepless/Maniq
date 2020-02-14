//
//  LoginInterfaces.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import FirebaseAuth

protocol LoginWireframeInterface: WireframeInterface {
    func routeToRegistration()
    func routeTo(_ viewController: UIViewController)
    func routeToResetPassword()
}

protocol LoginViewInterface: ViewInterface {
    func loadingView(show: Bool)
}

protocol LoginPresenterInterface: PresenterInterface {
    func showRegistration()
    func showResetPassword()
    func show(_ viewController: UIViewController)
    func login(loginText: String, password: String)
    func vkLogin(delegate: VKAuthDelegate)
}

protocol LoginInteractorInterface: InteractorInterface {
    func loginWith(username: String, password: String, handler: @escaping (AuthResult, String) -> ())
    func loginWith(phoneNumber: String, password: String, handler: @escaping (AuthResult, String) -> ())
    func isFilledData(_ loginText: String, _ password: String) -> Error?
    func vkLogin(delegate: VKAuthDelegate)
    func loadUser(email: String, handler: @escaping (Error?) -> ())
}