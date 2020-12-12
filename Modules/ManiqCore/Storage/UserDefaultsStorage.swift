//
//  UserDefaultsStorage.swift
//  ManiqCore
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation

final class UserDefaultsStorage: KeyValueStorage {

    public let userDefaults: UserDefaults

    public init() {
        // swiftlint:disable force_unwrapping
        userDefaults = UserDefaults(suiteName: SharedStoragesUtils.userDefaultsSuiteName)!
        userDefaults.synchronize()
    }

    public func set(object: Any?, for key: String) {
        userDefaults.set(object, forKey: key)
    }

    public func object(for key: String) -> Any? {
        return userDefaults.object(forKey: key)
    }
    
    public func removeObject(for key: String) {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
    }
    
    public func clear() {
        userDefaults.removePersistentDomain(forName: SharedStoragesUtils.userDefaultsSuiteName)
        userDefaults.synchronize()
    }
    
}
