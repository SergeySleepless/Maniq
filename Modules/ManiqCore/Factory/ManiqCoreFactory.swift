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
    
}
