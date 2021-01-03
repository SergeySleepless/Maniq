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
}
