//
//  LoginFactory.swift
//  Login
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

let bundle = LoginFactory.shared.bundle

public class LoginFactory {
    private init() {}
    public static let shared = LoginFactory()
    
    public let bundle = Bundle(identifier: "sg.LoginModule")
}

extension LoginFactory: LoginFactoryProtocol {
    public func makeLoginViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: bundle)
        let viewController = storyboard.instantiateInitialViewController()
        return viewController!
    }
}
