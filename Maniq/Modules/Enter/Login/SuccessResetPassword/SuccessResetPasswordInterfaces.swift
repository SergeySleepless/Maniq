//
//  SuccessResetPasswordInterfaces.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 14.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol SuccessResetPasswordWireframeInterface: WireframeInterface {
    func removePreviousControllers()
}

protocol SuccessResetPasswordViewInterface: ViewInterface {
}

protocol SuccessResetPasswordPresenterInterface: PresenterInterface {
    func removePreviousControllers()
    func dismiss()
}

protocol SuccessResetPasswordInteractorInterface: InteractorInterface {
}
