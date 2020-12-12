//
//  PhoneEnterPresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol PhoneEnterPresentationLogic {
    func presentFormatePhone(response: PhoneEnter.FormatPhone.Response)
    func presentSendPhone(response: PhoneEnter.SendCode.Response)
}

class PhoneEnterPresenter {
    
    weak var viewController: PhoneEnterDisplayLogic?
    
}

extension PhoneEnterPresenter: PhoneEnterPresentationLogic {
    func presentFormatePhone(response: PhoneEnter.FormatPhone.Response) {
        let phone = response.phone
        let cleanPhoneNumber = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
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
        let isValid = result.count == mask.count
        
        let viewModel = PhoneEnter.FormatPhone.ViewModel(formattedPhone: result,
                                                         isValid: isValid)
        viewController?.displayFormatePhone(viewModel: viewModel)
    }
    
    func presentSendPhone(response: PhoneEnter.SendCode.Response) {
        let error = response.error
        let viewModel = PhoneEnter.SendCode.ViewModel(error: error)
        viewController?.displaySendCode(viewModel: viewModel)
    }
}
