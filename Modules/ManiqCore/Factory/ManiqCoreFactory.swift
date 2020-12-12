//
//  ManiqCoreFactory.swift
//  ManiqCore
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation

public final class ManiqCoreFactory {
    
    private init() {}
    public static let shared = ManiqCoreFactory()
    
}

extension ManiqCoreFactory: ManiqCoreFactoryProtocol {
    
    public func makeUserDefaultsStorage() -> KeyValueStorage {
        return UserDefaultsStorage()
    }
    
    public func makeModuleState(module: Module) -> ModuleStateProtocol {
        let storage = makeUserDefaultsStorage()
        return ModuleState(storage: storage, module: module)
    }
    
    public func makeStateManager() -> StateManagerProtocol {
        let storage = makeUserDefaultsStorage()
        return StateManager(storage: storage)
    }
    
    public func makeState(module: Module,
                          moduleState: ModuleStateProtocol,
                          viewControllerIdentifier: String) -> StateProtocol {
        return State(module: module,
                     moduleState: moduleState,
                     viewControllerIdentifier: viewControllerIdentifier)
    }
    
}
