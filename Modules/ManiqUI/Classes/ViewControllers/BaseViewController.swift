//
//  BaseViewController.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import ManiqCore

open class BaseViewController: UIViewController {
    
    private var navController: MNavigationController?
    
    public var isNeedSetState: Bool = true
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
    }
    
    private func setNavController() {
        navController = navigationController as? MNavigationController
    }
    
    public func navigationBar(isHidden: Bool) {
        navController = navigationController as? MNavigationController
        navController?.isNavigationBarHidden = isHidden
    }
    
    public func removePrevViewController() {
        navController = navigationController as? MNavigationController
        navController?.removePrevViewController()
    }
    
}
