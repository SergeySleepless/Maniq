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
    
    private var loadingView = UIView(frame: .zero)
    var activityIndicator = NVActivityIndicatorView(frame: .zero)
    
    func showLoading(view: UIView, isShow: Bool) {
        view.endEditing(true)
        isShow ? showLoading(view: view) : endLoading()
    }
    
    private func showLoading(view: UIView) {
        loadingView.backgroundColor = .white
        loadingView.alpha = 1
        loadingView.frame = view.frame
        activityIndicator.type = .ballSpinFadeLoader
        activityIndicator.color = #colorLiteral(red: 0.2790566683, green: 0.4790184498, blue: 0.6833485961, alpha: 1)
        view.addSubview(loadingView)
        let y = loadingView.frame.midY
        let x = loadingView.frame.midX
        activityIndicator.frame = CGRect(x: x - 25, y: y - 25, width: 50, height: 50)
        loadingView.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    private func endLoading() {
        activityIndicator.stopAnimating()
        loadingView.removeFromSuperview()
    }
    
}
