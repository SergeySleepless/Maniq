//
//  ModuleStateProtocol.swift
//  ManiqCore
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

public protocol ModuleStateProtocol {
    func getViewController() -> UIViewController?
    func setViewController(_ viewController: UIViewController)
}
