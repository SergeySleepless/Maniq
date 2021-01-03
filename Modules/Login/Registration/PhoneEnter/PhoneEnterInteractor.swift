//
//  PhoneEnterInteractor.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol PhoneEnterBusinessLogic {
    func formatePhone(request: PhoneEnter.FormatPhone.Request)
    func sendCode(request: PhoneEnter.SendCode.Request)
}

protocol PhoneEnterDataStore {
    var verificationId: String? { get }
    var userRegModel: UserRegModelProtocol? { get set }
}

class PhoneEnterInteractor: PhoneEnterDataStore {
    
    var presenter: PhoneEnterPresentationLogic?
    var worker: PhoneEnterWorker?
    
    var verificationId: String?
    var userRegModel: UserRegModelProtocol?

}

extension PhoneEnterInteractor: PhoneEnterBusinessLogic {
    func formatePhone(request: PhoneEnter.FormatPhone.Request) {
        let phone = request.phone
        let response = PhoneEnter.FormatPhone.Response(phone: phone)
        presenter?.presentFormatePhone(response: response)
    }
    
    func sendCode(request: PhoneEnter.SendCode.Request) {
        let phone = request.phone
        worker = PhoneEnterWorker()
        
        worker?.sendCode(to: phone) { [weak self] (result) in
            var response: PhoneEnter.SendCode.Response
            switch result {
                case .success(let verificationId):
                    self?.verificationId = verificationId
                    self?.userRegModel?.phoneNumber = phone
                    response = .init(error: nil)
                case .failure(let error):
                    response = .init(error: error)
            }
            self?.presenter?.presentSendPhone(response: response)
        }
    }
}
