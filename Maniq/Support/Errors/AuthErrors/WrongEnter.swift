//
//  WrongEnter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 07.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation

enum WrongEnter {
    case loginDataIsWrong
}

extension WrongEnter: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .loginDataIsWrong:
            return "Проверьте правильность введенных данных"
        }
    }
}
