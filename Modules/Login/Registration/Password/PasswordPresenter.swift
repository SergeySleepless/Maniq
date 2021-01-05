//
//  PasswordPresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 05.01.2021.
//  Copyright (c) 2021 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol PasswordPresentationLogic {
    func presentSomething(response: Password.Something.Response)
}

class PasswordPresenter {
    
    weak var viewController: PasswordDisplayLogic?
    
}

extension PasswordPresenter: PasswordPresentationLogic {
    func presentSomething(response: Password.Something.Response) {
        let viewModel = Password.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
