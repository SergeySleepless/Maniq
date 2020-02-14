//
//  ResetPasswordWireframe.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 13.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class ResetPasswordWireframe: BaseWireframe {
    
    // MARK: - Private properties -
    
    private let storyboard = UIStoryboard(name: "ResetPassword", bundle: nil)
    
    // MARK: - Module setup -
    
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: ResetPasswordViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ResetPasswordInteractor()
        let presenter = ResetPasswordPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
    
}

// MARK: - Extensions -

extension ResetPasswordWireframe: ResetPasswordWireframeInterface {
    
    func routeToSuccessController() {
        let successResetPasswordWireframe = SuccessResetPasswordWireframe()
        navigationController?.pushWireframe(successResetPasswordWireframe)
    }
    
}
