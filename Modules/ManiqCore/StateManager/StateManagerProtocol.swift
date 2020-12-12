//
//  StateManagerProtocol.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation

public protocol StateManagerProtocol {
    func setState(_ state: StateProtocol)
    func getStateFor(module: Module) -> StateProtocol?
}
