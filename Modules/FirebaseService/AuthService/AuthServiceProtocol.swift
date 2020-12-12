//
//  AuthServiceProtocol.swift
//  FirebaseService
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import ServicesCommon
import FirebaseAuth

public protocol AuthServiceProtocol {
    /// Авторизация по email и паролю
    func login(email: String, password: String, completion: @escaping (BaseResult) -> ())
    
    /// Авторизация по username и паролю
    func login(username: String, password: String, completion: @escaping (BaseResult) -> ())
    
    /// Авторизация по номеру телефона и паролю
    func login(phone: String, password: String, completion: @escaping (BaseResult) -> ())
    
    /// Верификация номера телефона
    func verifyPhone(phoneNumber: String, completion: @escaping (Result<String, Error>) -> ())
    
    /// Восстановление пароля
    func resetPassword(email: String, completion: @escaping (BaseResult) -> ())
    
    func getCredential(withVerificationId: String, verificationCode: String) -> PhoneAuthCredential
    
    func signIn(with credential: PhoneAuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ())
}
