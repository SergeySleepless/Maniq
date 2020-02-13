//
//  RegistrationErrors.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 13.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation

enum RegistrationErrors {
    case numberExist
}

extension RegistrationErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .numberExist:
            return "Указанный номер телефона уже зарегистрирован"
        }
    }
}
