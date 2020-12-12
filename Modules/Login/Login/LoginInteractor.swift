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
    //var name: String { get set }
}

class LoginInteractor: LoginDataStore {
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    //var name: String = ""

}

extension LoginInteractor: LoginBusinessLogic {
    
    func login(request: Login.Login.Request) {
        let login = request.login
        let password = request.password
        
        worker = LoginWorker()
        
        worker?.login(login: login, password: password) { [weak self] (result) in
            var response: Login.Login.Response
            switch result {
                case .accept:
                    response = Login.Login.Response(error: nil)
                case .failure(let error):
                    response = Login.Login.Response(error: error)
            }
            self?.presenter?.presentLogin(response: response)
        }
    }
    
}
