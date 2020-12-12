//
//  PhoneEnterWorker.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import FirebaseService

class PhoneEnterWorker {
    
    
    let authService = FirebaseServiceFactory.shared.makeAuthService()
    
    func sendCode(to phone: String, completion: @escaping (Result<String, Error>) -> ()) {
        authService.verifyPhone(phoneNumber: phone, completion: completion)
    }
    
}
