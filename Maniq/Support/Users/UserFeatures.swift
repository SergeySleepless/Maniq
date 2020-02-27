//
//  UserFeatures.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 15.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol UserFeatures {
    var title: String { get }
    var icon: UIImage { get }
}

enum Social: Int, UserFeatures {
    case sociable = 0
    case silent = 1
    
    var title: String {
        switch self {
        case .sociable:
            return "Молчаливая"
        case .silent:
            return "Общительная"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .sociable:
            return UIImage()
        case .silent:
            return UIImage()
        }
    }
}

enum Smoking: Int {
    case smoke = 0
    case doesntSmoke = 1
    
    var title: String {
        switch self {
        case .smoke:
            return "Не выношу курение"
        case .doesntSmoke:
            return "Курю"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .smoke:
            return UIImage()
        case .doesntSmoke:
            return UIImage()
        }
    }
}

enum Pets: Int {
    case without = 0
    case with = 1
    
    var title: String {
        switch self {
        case .without:
            return "Только без животных"
        case .with:
            return "Не против домашних животных"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .without:
            return UIImage()
        case .with:
            return UIImage()
        }
    }
}
