//
//  LoginWorker.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import FirebaseService
import ServicesCommon

class LoginWorker {
    
    typealias loginResponse = (BaseResult) -> ()
    
    private let authService = FirebaseServiceFactory.shared.makeAuthService()
    
    func login(login: String, password: String, completion: @escaping loginResponse) {
        if login.isEmail {
            self.login(email: login, password: password, completion: completion)
        } else if login.isPhoneNumber {
            self.login(phone: getFormatted(login), password: password, completion: completion)
        } else {
            self.login(username: login, password: password, completion: completion)
        }
    }
    
    private func getFormatted(_ phoneNumber: String) -> String {
        let cleanPhoneNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+X (XXX) XXX-XX-XX"
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    private func login(username: String, password: String, completion: @escaping loginResponse) {
        authService.login(username: username, password: password, completion: completion)
    }
    
    private func login(phone: String, password: String, completion: @escaping loginResponse) {
        authService.login(phone: phone, password: password, completion: completion)
    }
    
    private func login(email: String, password: String, completion: @escaping loginResponse) {
        authService.login(email: email, password: password, completion: completion)
    }
    
}
