//
//  SuccessResetPasswordViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 14.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class SuccessResetPasswordViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: SuccessResetPasswordPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: "Сброс пароля")
        presenter.removePreviousControllers()
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        presenter.dismiss()
    }
    
}

// MARK: - Extensions -

extension SuccessResetPasswordViewController: SuccessResetPasswordViewInterface {
}
