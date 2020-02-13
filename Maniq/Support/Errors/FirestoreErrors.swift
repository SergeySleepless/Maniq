//
//  FirestoreErrors.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 07.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FirestoreError {
    case OK
    case cancelled
    case invalidArgument
    case deadlineExceeded
    case notFound
    case alreadyExists
    case permissionDenied
    case aborted
    case unimplemented
    case internalError
    case unavailable
    case dataLoss
    case unknown
    
    init(code: FirestoreErrorCode) {
        switch code {
        case .OK:
            self = .OK
        case .cancelled:
            self = .cancelled
        case .invalidArgument:
            self = .invalidArgument
        case .deadlineExceeded:
            self = .deadlineExceeded
        case .notFound:
            self = .notFound
        case .alreadyExists:
            self = .alreadyExists
        case .permissionDenied:
            self = .permissionDenied
        case .aborted:
            self = .aborted
        case .unimplemented:
            self = .unimplemented
        case .internal:
            self = .internalError
        case .unavailable:
            self = .unavailable
        case .dataLoss:
            self = .OK
        default:
            self = .unknown
        }
    }
    
}

extension FirestoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .OK:
            return "Запись уже существует"
        case .cancelled:
            return "Операция была отменена"
        case .invalidArgument:
            return "Неверный аргумент"
        case .deadlineExceeded:
            return "Время ожидания истекло"
        case .notFound:
            return "Документы не найдены"
        case .alreadyExists:
            return "Запись уже существует"
        case .permissionDenied:
            return "У Вас нет прав для выполнения этой операции"
        case .aborted:
            return "Операция была прервана"
        case .unimplemented:
            return "Операция не поддерживается"
        case .internalError:
            return "Внутренняя ошибка"
        case .unavailable:
            return "Сервис недоступен"
        case .dataLoss:
            return "Данные повреждены"
        case .unknown:
            return "Неизвестная ошибка"
        }
    }
}
