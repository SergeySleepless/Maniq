//
//  CreateUsernamePresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol CreateUsernamePresentationLogic {
    func presentSomething(response: CreateUsername.SendUsername.Response)
}

class CreateUsernamePresenter {
    
    weak var viewController: CreateUsernameDisplayLogic?
    
}

extension CreateUsernamePresenter: CreateUsernamePresentationLogic {
    func presentSomething(response: CreateUsername.SendUsername.Response) {
//        let viewModel = CreateUsername.SendUsername.ViewModel()
//        viewController?.displaySomething(viewModel: viewModel)
    }
}
