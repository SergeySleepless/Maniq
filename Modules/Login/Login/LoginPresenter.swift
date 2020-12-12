//
//  LoginPresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func presentLogin(response: Login.Login.Response)
}

class LoginPresenter {
    
    weak var viewController: LoginDisplayLogic?
    
}

extension LoginPresenter: LoginPresentationLogic {
    func presentLogin(response: Login.Login.Response) {
        let viewModel = Login.Login.ViewModel(error: response.error)
        viewController?.displayLogin(viewModel: viewModel)
    }
}
