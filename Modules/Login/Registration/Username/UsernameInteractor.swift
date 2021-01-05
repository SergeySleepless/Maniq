//
//  UsernameInteractor.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol UsernameBusinessLogic {
    func sendUsername(request: Username.SendUsername.Request)
}

protocol UsernameDataStore {
    var userRegModel: UserRegModelProtocol? { get set }
}

class UsernameInteractor: UsernameDataStore {
    
    var presenter: UsernamePresentationLogic?
    var worker: UsernameWorker?
    
    var userRegModel: UserRegModelProtocol?

}

extension UsernameInteractor: UsernameBusinessLogic {
    func sendUsername(request: Username.SendUsername.Request) {
        let username = request.username
        
        worker = UsernameWorker()
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
