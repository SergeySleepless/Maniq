//
//  AlertManagerProtocol.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

public protocol AlertManagerProtocol {
    func showErrorAlert(title: String, body: String)
    func showWarningAlert(title: String, body: String)
}
