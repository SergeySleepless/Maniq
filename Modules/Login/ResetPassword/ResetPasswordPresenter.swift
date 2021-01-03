//
//  ResetPasswordPresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol ResetPasswordPresentationLogic {
    func presentSomething(response: ResetPassword.ResetPassword.Response)
}

class ResetPasswordPresenter {
    
    weak var viewController: ResetPasswordDisplayLogic?
    
}

extension ResetPasswordPresenter: ResetPasswordPresentationLogic {
    func presentSomething(response: ResetPassword.ResetPassword.Response) {
        let viewModel = ResetPassword.ResetPassword.ViewModel(error: response.error)
        viewController?.displayResetPassword(viewModel: viewModel)
    }
}
