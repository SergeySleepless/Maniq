//
//  ManiqUIFactory.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//


public class ManiqUIFactory {
    
    private init() {}
    public static let shared = ManiqUIFactory()
    
}

extension ManiqUIFactory: ManiqUIFactoryProtocol {
    public func makeAlertManager() -> AlertManagerProtocol {
        return AlertManager()
    }
    
    public func makeLoadingManager() -> LoadingManagerProtocol {
        return LoadingManager()
    }
    public func makeNavigationController() -> MNavigationController {
        return MNavigationController()
    }
}
