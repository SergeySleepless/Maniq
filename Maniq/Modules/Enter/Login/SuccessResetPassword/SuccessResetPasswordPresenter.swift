//
//  SuccessResetPasswordPresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 14.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class SuccessResetPasswordPresenter {

    // MARK: - Private properties -

    private unowned let view: SuccessResetPasswordViewInterface
    private let interactor: SuccessResetPasswordInteractorInterface
    private let wireframe: SuccessResetPasswordWireframeInterface

    // MARK: - Lifecycle -

    init(view: SuccessResetPasswordViewInterface, interactor: SuccessResetPasswordInteractorInterface, wireframe: SuccessResetPasswordWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension SuccessResetPasswordPresenter: SuccessResetPasswordPresenterInterface {
    func dismiss() {
        wireframe.dismiss(animated: true)
    }
    
    func removePreviousControllers() {
        wireframe.removePreviousControllers()
    }
}
