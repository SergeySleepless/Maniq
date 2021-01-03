//
//  ButtonExtension.swift
//  ManiqUI
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

public extension UIButton {
    func setEnable(isEnabled: Bool) {
        self.isEnabled = isEnabled
        backgroundColor = isEnabled ? UIColor.blue : UIColor.lightGray
    }
}

