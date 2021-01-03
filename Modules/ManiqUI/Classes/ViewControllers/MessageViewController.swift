//
//  MessageViewController.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

open class MessageViewController: BaseViewController {
    
    private let alertManager = ManiqUIFactory.shared.makeAlertManager()
    
    public func showErrorAlert(title: String, body: String) {
        alertManager.showErrorAlert(title: title, body: body)
    }
    
    public func showWarningAlert(title: String, body: String) {
        alertManager.showWarningAlert(title: title, body: body)
    }
    
}
