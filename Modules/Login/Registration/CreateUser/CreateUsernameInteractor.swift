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
}

class CreateUsernameInteractor: CreateUsernameDataStore {
    
    var presenter: CreateUsernamePresentationLogic?
    var worker: CreateUsernameWorker?

}

extension CreateUsernameInteractor: CreateUsernameBusinessLogic {
    func sendUsername(request: CreateUsername.SendUsername.Request) {
        let username = request.username
        worker = CreateUsernameWorker()
        worker?.sendUsername(username: username) { result in
            switch result {
                case .success(let isExist):
                    self.presenter?.presentSendUsername(response: .init(isExist: isExist, error: nil))
                case .failure(let error):
                    self.presenter?.presentSendUsername(response: .init(isExist: nil, error: error))
            }
        }
    }
}
