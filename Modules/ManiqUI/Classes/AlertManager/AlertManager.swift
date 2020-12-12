//
//  AlertManager.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import SwiftMessages

class AlertManager {
    
}

extension AlertManager: AlertManagerProtocol {
    func showErrorAlert(title: String, body: String) {
        let error = MessageView.viewFromNib(layout: .cardView)
        error.configureTheme(.error)
        error.configureContent(title: title, body: body)
        error.button?.isHidden = true
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: .statusBar)
        config.duration = .forever
        config.dimMode = .none
        config.interactiveHide = true
        SwiftMessages.show(config: config, view: error)
    }
}
