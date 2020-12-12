//
//  CheckCodePresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol CheckCodePresentationLogic {
    func presentSendCode(response: CheckCode.Code.Response)
}

class CheckCodePresenter {
    
    weak var viewController: CheckCodeDisplayLogic?
    
}

extension CheckCodePresenter: CheckCodePresentationLogic {
    func presentSendCode(response: CheckCode.Code.Response) {
        let error = response.error
        let viewModel = CheckCode.Code.ViewModel(error: error)
        viewController?.displaySendCode(viewModel: viewModel)
    }
}
