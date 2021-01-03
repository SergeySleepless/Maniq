//
//  AuthServiceProtocol.swift
//  FirebaseService
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import ServicesCommon
import FirebaseAuth
import ManiqCore

public protocol AuthServiceProtocol: AutoMockable {
    
    /// Авторизация по email и паролю
    func login(email: String, password: String, completion: @escaping (Error?) -> ())
    
    /// Авторизация по username и паролю
    func login(username: String, password: String, completion: @escaping (Error?) -> ())
    
    /// Авторизация по номеру телефона и паролю
    func login(phone: String, password: String, completion: @escaping (Error?) -> ())
    
    /// Верификация номера телефона
    func verifyPhone(phoneNumber: String, completion: @escaping (Result<String, Error>) -> ())
    
    /// Восстановление пароля
    func resetPassword(username: String, completion: @escaping (Error?) -> ())
    func resetPassword(phone: String, completion: @escaping (Error?) -> ())
    
    func getCredential(withVerificationId: String, verificationCode: String) -> PhoneAuthCredential
    
    func signIn(with credential: PhoneAuthCredential, completion: @escaping (Result<AuthDataResult, Error>) -> ())
}
