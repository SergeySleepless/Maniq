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
    var verificationId: String? { get set }
    var userRegModel: UserRegModelProtocol? { get set }
}

class CheckCodeInteractor: CheckCodeDataStore {
    
    var presenter: CheckCodePresentationLogic?
    var worker: CheckCodeWorker?
    
    var verificationId: String?
    var userRegModel: UserRegModelProtocol?

}

extension CheckCodeInteractor: CheckCodeBusinessLogic {
    func sendCode(request: CheckCode.Code.Request) {
        guard
            let verificationId = verificationId
        else {
            return
        }
        let code = request.code
        
        worker = CheckCodeWorker()
        worker?.signIn(verificationId: verificationId, code: code) { [weak self] result in
            switch result {
                case .success(_):
                    self?.presenter?.presentSendCode(response: .init(error: nil))
                case .failure(let error):
                    self?.presenter?.presentSendCode(response: .init(error: error))
            }
        }
    }
}
