//
//  LoginWireframe.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class LoginWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Login", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: LoginViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension LoginWireframe: LoginWireframeInterface {
    func routeToRegistration() {
        let registrationWireFrame = PhoneEnterWireframe()
        let navigationController = UINavigationController()
        navigationController.setRootWireframe(registrationWireFrame)
        viewController.present(navigationController, animated: true, completion: nil)
    }
    
    func routeTo(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
