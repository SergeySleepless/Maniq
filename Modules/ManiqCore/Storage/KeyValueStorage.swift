//
//  KeyValueStorage.swift
//  ManiqCore
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

public protocol KeyValueStorage {
    func object(for key: String) -> Any?
    func set(object: Any?, for key: String)
    func removeObject(for key: String)
}
