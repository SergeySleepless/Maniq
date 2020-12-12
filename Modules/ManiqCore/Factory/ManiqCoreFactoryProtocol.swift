//
//  ManiqCoreFactoryProtocol.swift
//  ManiqCore
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation

public protocol ManiqCoreFactoryProtocol {
    func makeUserDefaultsStorage() -> KeyValueStorage
    
    func makeModuleState(module: Module) -> ModuleStateProtocol
    
    func makeStateManager() -> StateManagerProtocol
    
    func makeState(module: Module,
                   moduleState: ModuleStateProtocol,
                   viewControllerIdentifier: String) -> StateProtocol
}
