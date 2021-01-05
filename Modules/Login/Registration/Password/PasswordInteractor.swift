//
//  PasswordInteractor.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 05.01.2021.
//  Copyright (c) 2021 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol PasswordBusinessLogic {
    func doSomething(request: Password.Something.Request)
}

protocol PasswordDataStore {
    //var name: String { get set }
}

class PasswordInteractor: PasswordDataStore {
    
    var presenter: PasswordPresentationLogic?
    var worker: PasswordWorker?
    
    //var name: String = ""
    
}

extension PasswordInteractor: PasswordBusinessLogic {
    func doSomething(request: Password.Something.Request) {
        worker = PasswordWorker()
        worker?.doSomeWork()
        
        let response = Password.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
