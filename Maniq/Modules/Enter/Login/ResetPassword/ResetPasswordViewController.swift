//
//  ResetPasswordViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 13.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class ResetPasswordViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: ResetPasswordPresenterInterface!

    @IBOutlet weak var loginTextField: UITextField!
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: "Сброс пароля")
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        presenter.send(login: loginTextField.text!)
    }
    
}

// MARK: - Extensions -

extension ResetPasswordViewController: ResetPasswordViewInterface {
    func loadingView(show: Bool) {
        UIUtils.shared.showLoading(view: view, isShow: show)
    }
    
}
