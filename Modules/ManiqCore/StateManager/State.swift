//
//  State.swift
//  ManiqCore
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//


public protocol StateProtocol {
    var module: Module { get set }
    var moduleState: ModuleStateProtocol { get set }
    var viewControllerIdentifier: String { get set }
}

final class State: StateProtocol {
    var module: Module
    var moduleState: ModuleStateProtocol
    var viewControllerIdentifier: String
    
    init(module: Module, moduleState: ModuleStateProtocol, viewControllerIdentifier: String) {
        self.module = module
        self.moduleState = moduleState
        self.viewControllerIdentifier = viewControllerIdentifier
    }
}
