//
//  ClientProfileWireframe.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 14.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class ClientProfileWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "ClientProfile", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: ClientProfileViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ClientProfileInteractor()
        let presenter = ClientProfilePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ClientProfileWireframe: ClientProfileWireframeInterface {
}
