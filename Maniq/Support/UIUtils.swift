//
//  UIUtils.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class UIUtils {
    static let shared = UIUtils()
    private init() {}
    
    private let loadingView = UIView(frame: .zero)
    let activityIndicator = NVActivityIndicatorView(frame: .zero)

    
    func showLoading(view: UIView) {
        loadingView.backgroundColor = .white
        loadingView.alpha = 1
        loadingView.frame = view.frame
        activityIndicator.type = .ballSpinFadeLoader
        activityIndicator.color = #colorLiteral(red: 0.2790566683, green: 0.4790184498, blue: 0.6833485961, alpha: 1)
        view.addSubview(loadingView)
        loadingView.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func endLoading() {
        activityIndicator.stopAnimating()
        loadingView.removeFromSuperview()
    }
    
}
