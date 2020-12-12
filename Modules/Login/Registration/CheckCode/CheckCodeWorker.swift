//
//  CheckCodeWorker.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import FirebaseService
import FirebaseAuth

class CheckCodeWorker {
    
    private let authService = FirebaseServiceFactory.shared.makeAuthService()
    
    func signIn(verificationId: String, code: String, completion: @escaping (AuthDataResult?, Error?) -> ()) {
        let credentialPhone = authService.getCredential(withVerificationId: verificationId,
                                                        verificationCode: code)
        authService.signIn(with: credentialPhone,
                           completion: completion)
    }
    
}
