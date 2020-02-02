//
//  CheckCodeWireframe.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class CheckCodeWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "CheckCode", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: CheckCodeViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = CheckCodeInteractor()
        let presenter = CheckCodePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension CheckCodeWireframe: CheckCodeWireframeInterface {
    
    func routeToCreateUser() {
        let createUserWireframe = CreateUserWireframe()
        navigationController?.pushWireframe(createUserWireframe)
    }
     
}