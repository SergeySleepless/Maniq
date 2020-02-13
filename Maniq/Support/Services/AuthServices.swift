//
//  AuthServices.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 07.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol AuthServicesInterface {
    typealias authHandler = (AuthResult) -> ()
    typealias varifyNumberHandler = (String, String?, Error?) -> ()
    
    /// Авторизация по email и паролю
    func login(email: String, password: String, handler: @escaping authHandler)
    /// Верификация номера телефона
    func verifyPhone(phoneNumber: String, handler: @escaping varifyNumberHandler)
}

class AuthServices {
    
    init() {
        Auth.auth().languageCode = "ru"
    }
    
}

extension AuthServices: AuthServicesInterface {

    func login(email: String, password: String, handler: @escaping authHandler) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            var fError: AuthErrorCode
            if error != nil {
                fError = AuthErrorCode(rawValue: error!._code)!
                handler(AuthResult.failure(AuthError(code: fError)))
                return
            }
            handler(AuthResult.accept)
        }
    }
    
    func verifyPhone(phoneNumber: String, handler: @escaping varifyNumberHandler) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            handler(phoneNumber, verificationID, error)
        }
    }
    
}
