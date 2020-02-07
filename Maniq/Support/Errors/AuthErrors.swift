//
//  AuthErrors.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 07.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation
import Firebase

enum AuthErrors {
    static var notFilled = NotFilled.self
    static var wrongEnter = WrongEnter.self
    static var firebaseErrors = AuthErrorCode.self
    case userDisabled
    case operationNotAllowed
    case emailAlreadyInUse
    case invalidEmail
    case wrongPassword
    case tooManyRequests
    case userNotFound
    case networkError
    case weakPassword
    case expiredActionCode
    case invalidActionCode
    case invalidSender
    case invalidRecipientEmail
    case missingPhoneNumber
    case invalidPhoneNumber
    case missingVerificationCode
    case invalidVerificationCode
    case sessionExpired
    case quotaExceeded
    case captchaCheckFailed
    case webContextCancelled
    case webNetworkRequestFailed
    case webSignInUserInteractionFailure
    case missingOrInvalidNonce
    case missingClientIdentifier
    case keychainError
    case internalError
    case unknow
    
}

protocol Err {
    var message: String {get}
}

extension AuthErrors: Err {
    var message: String {
        switch self {
        case .userDisabled:
            return "Пользователь отключен"
        case .operationNotAllowed:
            return "Этот способ входа больше недоступен"
        case .emailAlreadyInUse:
            return "Этот адрес электронной почты принадлежит другому пользователю"
        case .invalidEmail:
            return "Неверный адрес электронной почты"
        case .wrongPassword:
            return "Неверный пароль"
        case .tooManyRequests:
            return "Слишком много запросов, повторите попытку позже"
        case .userNotFound:
            return "Пользователь не найден"
        case .networkError:
            return "Ошибка соединения, повторите попытку позже"
        case .weakPassword:
            return "Пароль слишком простой"
        case .expiredActionCode:
            return "Срок действия кода истек"
        case .invalidActionCode:
            return "Неверный код"
        case .invalidSender:
            return "Недопустимый адрес электронной почты"
        case .invalidRecipientEmail:
            return "Недействительный адрес электронной почты"
        case .missingPhoneNumber:
            return "Не указан номер телефона"
        case .invalidPhoneNumber:
            return "Неверный номер телефона"
        case .missingVerificationCode:
            return "Отсутствует код подтверждения"
        case .invalidVerificationCode:
            return "Неверный код подтверждения"
        case .sessionExpired:
            return "Срок действия кода истек"
        case .quotaExceeded:
            return "Превышено количество сообщений для этого номера телефона. Попробуйте использовать другой номер телефона или повторите попытку позже"
        case .captchaCheckFailed:
            return "Неудовлетворительный результат проверки на робота"
        case .webContextCancelled:
            return "Операция отменена пользователем"
        case .webNetworkRequestFailed:
            return "Ошибка соединения, повторите попытку позже"
        case .webSignInUserInteractionFailure:
            return "Ошибка соединения, повторите попытку позже"
        case .missingOrInvalidNonce:
            return "Одноразовый номер отсутствует или недействителен"
        case .missingClientIdentifier:
            return "Идентификатор клиента отсутствует"
        case .keychainError:
            return "Ошибка доступа к связке ключей"
        case .internalError:
            return "Внутренняя ошибка"
        case .unknow:
            return "Неизвестная ошибка"
        }
    }
}

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

enum WrongEnter {
    case loginDataIsWrong
}

extension WrongEnter: Err {
    var message: String {
        switch self {
        case .loginDataIsWrong:
            return "Проверьте правильность введенных данных"
        }
    }
}
