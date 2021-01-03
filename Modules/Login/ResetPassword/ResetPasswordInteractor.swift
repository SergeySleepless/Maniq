//
//  ResetPasswordInteractor.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol ResetPasswordBusinessLogic {
    func resetPassword(request: ResetPassword.ResetPassword.Request)
}

protocol ResetPasswordDataStore {
    //var name: String { get set }
}

class ResetPasswordInteractor: ResetPasswordDataStore {
    
    var presenter: ResetPasswordPresentationLogic?
    var worker: ResetPasswordWorker?
    
    //var name: String = ""
    
}

extension ResetPasswordInteractor: ResetPasswordBusinessLogic {
    func resetPassword(request: ResetPassword.ResetPassword.Request) {
        let login = request.login
        
        worker = ResetPasswordWorker()
        worker?.restore(login: login) { [weak self] (error) in
            self?.presenter?.presentSomething(response: .init(error: error))
        }
    }
}
