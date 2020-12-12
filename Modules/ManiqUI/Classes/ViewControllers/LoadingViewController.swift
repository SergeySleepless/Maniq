//
//  LoadingViewController.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

open class LoadingViewController: MessageViewController {
    
    private let loadingManager = ManiqUIFactory.shared.makeLoadingManager()
    
    public func showLoading(from view: UIView) {
        loadingManager.showLoading(view: view)
    }
    
    public func hideLoading(from view: UIView) {
        loadingManager.hideLoading(view: view)
    }
    
}
