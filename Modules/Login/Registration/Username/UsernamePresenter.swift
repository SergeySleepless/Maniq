//
//  UsernamePresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol UsernamePresentationLogic {
    func presentSendUsername(response: Username.SendUsername.Response)
}

class UsernamePresenter {
    
    weak var viewController: UsernameDisplayLogic?
    
}

extension UsernamePresenter: UsernamePresentationLogic {
    func presentSendUsername(response: Username.SendUsername.Response) {
        let error = response.error
        let viewModel = Username.SendUsername.ViewModel(error: error)
        viewController?.displaySendUsername(viewModel: viewModel)
    }
}
