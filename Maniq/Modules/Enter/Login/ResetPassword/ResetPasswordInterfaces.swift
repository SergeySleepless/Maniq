//
//  ResetPasswordInterfaces.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 13.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol ResetPasswordWireframeInterface: WireframeInterface {
    func routeToSuccessController()
}

protocol ResetPasswordViewInterface: ViewInterface {
    func loadingView(show: Bool)
}

protocol ResetPasswordPresenterInterface: PresenterInterface {
    func send(login: String)
}

protocol ResetPasswordInteractorInterface: InteractorInterface {
    func restoreBy(username: String, handler: @escaping (AuthResult) -> ())
    func restoreBy(phoneNumber: String, handler: @escaping (AuthResult) -> ())
}
