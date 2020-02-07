//
//  AuthServices.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 07.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthServices {
    
    typealias authHandler = (AuthDataResult?, AuthResult?) -> ()
    
    func login(email: String, password: String, handler: @escaping authHandler) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            var fError: AuthErrorCode
            if error != nil {
                fError = AuthErrorCode(rawValue: error!._code)!
                handler(authResult, AuthResult.failure(AuthError(code: fError)))
            }
            handler(authResult, AuthResult.accept)
        }
    }
    
}
