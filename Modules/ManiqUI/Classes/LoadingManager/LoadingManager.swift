//
//  LoadingManager.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoadingView: UIView {
    
    let activityIndicator = NVActivityIndicatorView(frame: .zero)
    
    init(parentView: UIView) {
        super.init(frame: parentView.frame)
        
        configureView(view: parentView)
        createActivityIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView(view: UIView) {
        backgroundColor = .white
        alpha = 1
        frame = view.frame
        isHidden = true
    }
    
    private func createActivityIndicator() {
        let activityIndicator = NVActivityIndicatorView(frame: .zero)
        activityIndicator.type = .ballSpinFadeLoader
        activityIndicator.color = #colorLiteral(red: 0.2790566683, green: 0.4790184498, blue: 0.6833485961, alpha: 1)
        let y = frame.midY
        let x = frame.midX
        activityIndicator.frame = CGRect(x: x - 25, y: y - 25, width: 50, height: 50)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
}

class LoadingManager {
    
    private func animate(view: UIView, isHidden: Bool, completion: @escaping (Bool) -> ()) {
        UIView.transition(with: view,
                          duration: 0.3,
                          options: .transitionCrossDissolve, animations: {
                            view.isHidden = isHidden
                          }, completion: completion)
    }
    
}

extension LoadingManager: LoadingManagerProtocol {
    func showLoading(view: UIView) {
        guard !view.subviews.contains(where: {$0 is LoadingView})
        else {
            return
        }
        let loadingView = LoadingView(parentView: view)
        view.addSubview(loadingView)
        UIView.transition(with: loadingView,
                          duration: 0.3,
                          options: .transitionCrossDissolve) {
            loadingView.isHidden = false
        }
    }
    
    func hideLoading(view: UIView) {
        guard let loadingView = view.subviews.first(where: {$0 is LoadingView})
        else {
            return
        }
        UIView.transition(with: loadingView, duration: 0.3, options: .transitionCrossDissolve) {
            loadingView.isHidden = true
        } completion: { (finished) in
            if finished {
                loadingView.removeFromSuperview()
            }
        }
    }
}
