//
//  PhoneEnterInteractor.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import FirebaseAuth

final class PhoneEnterInteractor {
    
}

// MARK: - Extensions -

extension PhoneEnterInteractor: PhoneEnterInteractorInterface {
    
    func auth(phoneNumber: String, authResult: @escaping (String, String?, Error?) -> ()) {
        firebaseServices.firestore.checkNumberExist(phoneNumber: phoneNumber) { isExist, error in
            if let error = error {
                authResult(phoneNumber, nil, error)
                return
            }
            if isExist! {
                authResult(phoneNumber, nil, RegistrationErrors.numberExist)
                return
            }
            firebaseServices.auth.verifyPhone(phoneNumber: phoneNumber, handler: authResult)
        }
    }
    
    func saveVerificationID(verificationID: String) {
        CurrentState.shared.authVerificationID = verificationID
    }
    
    func savePhoneNumber(phoneNumber: String) {
        CurrentState.shared.phoneNumber = phoneNumber
    }
    
}
