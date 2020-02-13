//
//  PhoneEnterInterfaces.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 02.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol PhoneEnterWireframeInterface: WireframeInterface {
    /// Навигация до экрана проверки кода
    func routeToCheckCode(number: String)
}

protocol PhoneEnterViewInterface: ViewInterface {
    /// Включение/Отключение кнопки "Далее"
    func nextButtonIs(enabled: Bool)
    /// Показать/Скрыть загрузку
    func loadingView(show: Bool)
}

protocol PhoneEnterPresenterInterface: PresenterInterface {
    /// Форматирование номера телефона в реальном времени
    func getFormattedPhoneNumber(number: String) -> String
    /// Авторизация по номеру телефона
    func auth(phoneNumber: String)
}

protocol PhoneEnterInteractorInterface: InteractorInterface {
    /// Попытка авторизации по номеру телефона
    func auth(phoneNumber: String, authResult: @escaping (String, String?, Error?) -> ())
    /// Сохранить ID
    func saveVerificationID(verificationID: String)
    /// Сохранить номер телефона
    func savePhoneNumber(phoneNumber: String)
}
