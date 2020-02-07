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

extension WrongEnter: ErrorProtocol {
    var message: String {
        switch self {
        case .loginDataIsWrong:
            return "Проверьте правильность введенных данных"
        }
    }
}
