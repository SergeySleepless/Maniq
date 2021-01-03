//
//  NotFilled.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 07.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation

enum NotFilled {
    case loginNotFilled
    case passwordNotFilled
    case allNotFilled
}

extension NotFilled: Error {
    var localizedDescription: String {
        switch self {
        case .loginNotFilled:
            return "Введите номер телефона или имя пользователя"
        case .passwordNotFilled:
            return "Введите пароль"
        case .allNotFilled:
            return "Введите номер телефона или имя пользователя, а также пароль"
        }
    }
}
