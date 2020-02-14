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
    
    /// Авторизация по email и паролю
    func login(email: String, password: String, handler: @escaping (AuthResult, String) -> ())
    /// Верификация номера телефона
    func verifyPhone(phoneNumber: String, handler: @escaping (String, String?, Error?) -> ())
    /// Восстановление пароля
    func resetPassword(email: String, handler: @escaping (AuthResult) -> ())
}

class AuthServices {
    
    init() {
        Auth.auth().languageCode = "ru"
    }
    
}

extension AuthServices: AuthServicesInterface {

    func login(email: String, password: String, handler: @escaping (AuthResult, String) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let fError = AuthErrorCode(rawValue: error._code)!
                handler(AuthResult.failure(AuthError(code: fError)), email)
            } else {
                handler(AuthResult.accept, email)
            }
        }
    }
    
    func verifyPhone(phoneNumber: String, handler: @escaping (String, String?, Error?) -> ()) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            handler(phoneNumber, verificationID, error)
        }
    }
    
    func resetPassword(email: String, handler: @escaping (AuthResult) -> ()) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                let fError = AuthErrorCode(rawValue: error._code)!
                handler(AuthResult.failure(AuthError(code: fError)))
            } else {
                handler(AuthResult.accept)
            }
        }
    }
    
}
