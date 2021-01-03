//
//  FirestoreServiceProtocol.swift
//  FirebaseService
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import FirebaseFirestore
import ManiqCore

public protocol FirestoreServiceProtocol: AutoMockable {
    /// Получить snapshot по имени пользователя
    func getSnapshotFrom(username: String, completion: @escaping (Result<QuerySnapshot, Error>) -> ())
    
    /// Получить snapshot по номеру телефона пользователя
    func getSnapshotFrom(phoneNumber: String, completion: @escaping (Result<QuerySnapshot, Error>) -> ())
    
    /// Получить email из snapshota
    func getEmail(querySnapshot: QuerySnapshot, completion: @escaping (String?) -> ())
    
    /// Проверка номера телефона на наличие в базе
    func checkNumberExist(phoneNumber: String, completion: @escaping (Result<Bool, Error>) -> ())
    
    /// Проверка email на наличие в базе
    func checkEmailExist(email: String, completion: @escaping (Result<Bool, Error>) -> ())
    
    /// Проверка username на наличие в базе
    func checkUsernameExist(username: String, completion: @escaping (Result<Bool, Error>) -> ())
    
    /// Загрузить пользователя по почте
    func loadClient(email: String, completion: @escaping (Result<QueryDocumentSnapshot, Error>) -> ())
}
