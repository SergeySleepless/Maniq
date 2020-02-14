//
//  SuccessResetPasswordWireframe.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 14.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class SuccessResetPasswordWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "SuccessResetPassword", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: SuccessResetPasswordViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = SuccessResetPasswordInteractor()
        let presenter = SuccessResetPasswordPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension SuccessResetPasswordWireframe: SuccessResetPasswordWireframeInterface {
    func removePreviousControllers() {
        navigationController?.viewControllers.removeAll(where: {
            !($0 is SuccessResetPasswordViewController)
        })
    }
}
