//
//  ResetPasswordWorker.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import FirebaseService
import ServicesCommon

class ResetPasswordWorker {
    
    private let authService = FirebaseServiceFactory.shared.makeAuthService()
    
    func restore(login: String, completion: @escaping (Error?) -> ()) {
        if login.isPhoneNumber {
            resetBy(phone: getFormatted(login), completion: completion)
        } else {
            resetBy(username: login, completion: completion)
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
    
    private func resetBy(username: String, completion: @escaping (Error?) -> ()) {
        authService.resetPassword(username: username, completion: completion)
    }
    
    private func resetBy(phone: String, completion: @escaping (Error?) -> ()) {
        authService.resetPassword(phone: phone, completion: completion)
    }
    
}
