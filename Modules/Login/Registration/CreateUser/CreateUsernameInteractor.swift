//
//  CreateUsernameInteractor.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol CreateUsernameBusinessLogic {
    func sendUsername(request: CreateUsername.SendUsername.Request)
}

protocol CreateUsernameDataStore {
    //var name: String { get set }
}

class CreateUsernameInteractor: CreateUsernameDataStore {
    
    var presenter: CreateUsernamePresentationLogic?
    var worker: CreateUsernameWorker?
    
    //var name: String = ""

}

extension CreateUsernameInteractor: CreateUsernameBusinessLogic {
    func sendUsername(request: CreateUsername.SendUsername.Request) {
        worker = CreateUsernameWorker()
        
//        let response = CreateUsername.SendUsername.Response()
//        presenter?.presentSomething(response: response)
    }
}
