//
//  CheckCodeInteractor.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol CheckCodeBusinessLogic {
    func sendCode(request: CheckCode.Code.Request)
}

protocol CheckCodeDataStore {
    var verificationId: String! { get set }
}

class CheckCodeInteractor: CheckCodeDataStore {
    
    var presenter: CheckCodePresentationLogic?
    var worker: CheckCodeWorker?
    
    var verificationId: String!

}

extension CheckCodeInteractor: CheckCodeBusinessLogic {
    func sendCode(request: CheckCode.Code.Request) {
        let code = request.code
        
        worker = CheckCodeWorker()
        worker?.signIn(verificationId: verificationId, code: code) { [weak self] (result, error) in
            let response = CheckCode.Code.Response(error: error)
            self?.presenter?.presentSendCode(response: response)
        }
    }
}
