//
//  RegistrationInterfaces.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol RegistrationWireframeInterface: WireframeInterface {
    func routeToCheckCode(number: String)
}

protocol RegistrationViewInterface: ViewInterface {
    func nextButtonIs(enabled: Bool)
    func loadingView(show: Bool)
}

protocol RegistrationPresenterInterface: PresenterInterface {
    func getFormattedPhoneNumber(number: String) -> String
    func set(number: String)
    func auth()
}

protocol RegistrationInteractorInterface: InteractorInterface {
    func set(number: String)
    func auth(authResult: @escaping (String, String?, Error?) -> ())
    func saveVerificationID(verificationID: String)
}