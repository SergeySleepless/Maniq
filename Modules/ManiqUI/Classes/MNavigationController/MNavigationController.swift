//
//  MNavigationController.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

public class MNavigationController: UINavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        makeTransparent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeTransparent() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
    
    public func removePrevViewController() {
        guard viewControllers.count > 1
        else {
            return
        }
        viewControllers.remove(at: viewControllers.count - 2)
    }
    
}
