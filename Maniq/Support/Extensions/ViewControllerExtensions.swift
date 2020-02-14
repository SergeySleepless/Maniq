//
//  ViewControllerExtensions.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import IQKeyboardManagerSwift

extension UIViewController {
    
    func setTitle(title: String) {
        navigationItem.title = title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private static var _loadingView: NVActivityIndicatorView?
    
    var loadingView: NVActivityIndicatorView? {
        get {
            return UIViewController._loadingView
        }
        set(loadingView) {
            UIViewController._loadingView = loadingView
        }
    }
    
    func loadView(isShowing: Bool) {
        if isShowing {
            loadingView = NVActivityIndicatorView(frame: view.frame, type: .ballRotateChase, color: UIColor.blue)
            loadingView?.startAnimating()
            return
        }
        loadingView?.stopAnimating()
    }
    
}
