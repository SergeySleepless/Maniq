//
//  UserFeatures.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 15.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

enum UserFeatures: Int {
    case test = 0
}

extension UserFeatures {
    var title: String {
        switch self {
        case .test: return "Test"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .test: return UIImage()
        }
    }
}
