//
//  LoginRouter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

@objc protocol LoginRoutingLogic {
    func routeToRegistration()
    func routeToForgotPassword()
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject {
    
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
}

extension LoginRouter: LoginRoutingLogic {
    
    func routeToRegistration() {
        let storyboard = UIStoryboard(name: "PhoneEnter", bundle: bundle)
        guard let viewController = storyboard.instantiateInitialViewController()
        else {
            return
        }
        self.viewController?.show(viewController, sender: nil)
    }
    
    func routeToForgotPassword() {
        let storyboard = UIStoryboard(name: "ResetPassword", bundle: bundle)
        guard
            let viewController = storyboard.instantiateInitialViewController()
        else {
            return
        }
        self.viewController?.show(viewController, sender: nil)
    }
}

extension LoginRouter: LoginDataPassing {
    func passDataToRegistration(source: LoginDataStore, destination: inout PhoneEnterDataStore) {
        destination.userRegModel = source.userRegModel
    }
}
