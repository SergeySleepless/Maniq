//
//  ModuleState.swift
//  ManiqCore
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class ModuleState {
    
    private let storage: KeyValueStorage
    private let module: Module
    
    private var viewControllerKey: String {
        return "\(module.rawValue).viewController"
    }
    
    init(storage: KeyValueStorage, module: Module) {
        self.storage = storage
        self.module = module
    }
    
}

extension ModuleState: ModuleStateProtocol {
    public func getViewController() -> UIViewController? {
        return storage.object(for: viewControllerKey) as? UIViewController
    }
    
    public func setViewController(_ viewController: UIViewController) {
        storage.set(object: viewController, for: viewControllerKey)
    }
}
