//
//  PhoneEnterWireframe.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class PhoneEnterWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "PhoneEnter", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: PhoneEnterViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = PhoneEnterInteractor()
        let presenter = PhoneEnterPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension PhoneEnterWireframe: PhoneEnterWireframeInterface {
    func routeToCheckCode(number: String) {
        let checkCodeWireframe = CheckCodeWireframe()
        (checkCodeWireframe.viewController as! CheckCodeViewController).number = number
        navigationController?.pushWireframe(checkCodeWireframe)
    }
    
}