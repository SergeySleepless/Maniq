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
            handler(authResult, nil)
        }
    }
    
}
