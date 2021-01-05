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
    var userRegModel: UserRegModelProtocol? { get set }
}

class CreateUsernameInteractor: CreateUsernameDataStore {
    
    var presenter: CreateUsernamePresentationLogic?
    var worker: CreateUsernameWorker?
    
    var userRegModel: UserRegModelProtocol?

}

extension CreateUsernameInteractor: CreateUsernameBusinessLogic {
    func sendUsername(request: CreateUsername.SendUsername.Request) {
        let username = request.username
        
        worker = CreateUsernameWorker()
        worker?.checkUsernameExist(username: username) { [weak self] result in
            switch result {
                case .success(let isExist):
                    if isExist {
                        self?.presenter?.presentSendUsername(response: .init(error: "Указанное имя пользователя уже занято"))
                    } else {
                        self?.userRegModel?.username = username
                        self?.presenter?.presentSendUsername(response: .init(error: nil))
                    }
                case .failure(let error):
                    self?.presenter?.presentSendUsername(response: .init(error: error.localizedDescription))
            }
        }
    }
}
