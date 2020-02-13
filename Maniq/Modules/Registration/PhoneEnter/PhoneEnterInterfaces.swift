//
//  PhoneEnterInterfaces.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol PhoneEnterWireframeInterface: WireframeInterface {
    func routeToCheckCode(number: String)
}

protocol PhoneEnterViewInterface: ViewInterface {
    func nextButtonIs(enabled: Bool)
    func loadingView(show: Bool)
}

protocol PhoneEnterPresenterInterface: PresenterInterface {
    func getFormattedPhoneNumber(number: String) -> String
    func set(number: String)
    func auth()
}

protocol PhoneEnterInteractorInterface: InteractorInterface {
    func set(number: String)
    func auth(authResult: @escaping (String, String?, Error?) -> ())
    func saveVerificationID(verificationID: String)
}
