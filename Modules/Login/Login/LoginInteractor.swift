//
//  LoginInteractor.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func login(request: Login.Login.Request)
}

protocol LoginDataStore {
    var userRegModel: UserRegModelProtocol { get }
}

class LoginInteractor: LoginDataStore {
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    var userRegModel: UserRegModelProtocol = UserRegModel()
    
}

extension LoginInteractor: LoginBusinessLogic {
    
    func login(request: Login.Login.Request) {
        let login = request.login
        let password = request.password
        
        worker = LoginWorker()
        
        worker?.login(login: login, password: password) { [weak self] (error) in
            self?.presenter?.presentLogin(response: .init(error: error))
        }
    }
    
}
