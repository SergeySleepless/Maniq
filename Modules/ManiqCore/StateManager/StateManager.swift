//
//  StateManager.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation

final class StateManager {
    
    private let storage: KeyValueStorage
    
    init(storage: KeyValueStorage) {
        self.storage = storage
    }
    
    private func getStateKey(_ state: StateProtocol) -> String {
        let module = state.module.rawValue
        let key = "state.\(module)"
        return key
    }
    
    private func getKeyFor(module: Module) -> String {
        let key = "state.\(module.rawValue)"
        return key
    }
    
}

extension StateManager: StateManagerProtocol {
    public func setState(_ state: StateProtocol) {
        let key = getStateKey(state)
        storage.set(object: state, for: key)
    }
    
    public func getStateFor(module: Module) -> StateProtocol? {
        let key = getKeyFor(module: module)
        let state = storage.object(for: key) as? StateProtocol
        return state
    }
}
