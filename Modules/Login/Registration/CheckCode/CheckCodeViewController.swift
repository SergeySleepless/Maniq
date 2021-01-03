//
//  CheckCodeViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import ManiqUI
import CBPinEntryView

protocol CheckCodeDisplayLogic: class {
    func displaySendCode(viewModel: CheckCode.Code.ViewModel)
}

class CheckCodeViewController: LoadingViewController {
    
    var interactor: CheckCodeBusinessLogic?
    var router: (NSObjectProtocol & CheckCodeRoutingLogic & CheckCodeDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CheckCodeInteractor()
        let presenter = CheckCodePresenter()
        let router = CheckCodeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    @IBOutlet weak var pinEntryView: CBPinEntryView!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePinEntryView()
        removePrevViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        pinEntryView.becomeFirstResponder()
    }
    
    private func configurePinEntryView() {
        pinEntryView.allowedEntryTypes = .numerical
        pinEntryView.keyboardType = 4
        pinEntryView.delegate = self
    }
    
}

extension CheckCodeViewController: CheckCodeDisplayLogic {
    func displaySendCode(viewModel: CheckCode.Code.ViewModel) {
        hideLoading(from: view)
        if let error = viewModel.error {
            showErrorAlert(title: "Ошибка", body: error.localizedDescription)
        } else {
            router?.routeToUsername()
        }
    }
}

extension CheckCodeViewController: CBPinEntryViewDelegate {
    func entryChanged(_ completed: Bool) {
        pinEntryView.setError(isError: false)
    }
    
    func entryCompleted(with entry: String?) {
        guard let code = entry
        else {
            return
        }
        pinEntryView.resignFirstResponder()
        showLoading(from: view)
        let request = CheckCode.Code.Request(code: code)
        interactor?.sendCode(request: request)
    }
}
