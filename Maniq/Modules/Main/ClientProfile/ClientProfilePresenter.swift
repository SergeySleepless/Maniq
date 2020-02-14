//
//  ClientProfilePresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 14.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class ClientProfilePresenter {

    // MARK: - Private properties -

    private unowned let view: ClientProfileViewInterface
    private let interactor: ClientProfileInteractorInterface
    private let wireframe: ClientProfileWireframeInterface

    // MARK: - Lifecycle -

    init(view: ClientProfileViewInterface, interactor: ClientProfileInteractorInterface, wireframe: ClientProfileWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ClientProfilePresenter: ClientProfilePresenterInterface {
}
