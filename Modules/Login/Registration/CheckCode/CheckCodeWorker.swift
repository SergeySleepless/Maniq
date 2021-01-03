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
    
    typealias checkCodeResponse = (Result<AuthDataResult, Error>) -> ()
    
    private let authService = FirebaseServiceFactory.shared.makeAuthService()
    
    func signIn(verificationId: String, code: String, completion: @escaping checkCodeResponse) {
        let credentialPhone = authService.getCredential(withVerificationId: verificationId,
                                                        verificationCode: code)
        authService.signIn(with: credentialPhone,
                           completion: completion)
    }
    
}
