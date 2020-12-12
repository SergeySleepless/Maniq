//
//  FirestoreServiceProtocol.swift
//  FirebaseService
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import FirebaseFirestore

public protocol FirestoreServiceProtocol {
    typealias getQueryHandler = (QuerySnapshot?, Error?) -> ()
    typealias getEmailHandler = (String?) -> ()
    typealias getDataHandler = (Bool?, Error?) -> ()

    /// Получить snapshot по имени пользователя
    func getSnapshotFrom(username: String, completion: @escaping getQueryHandler)
    
    /// Получить snapshot по номеру телефона пользователя
    func getSnapshotFrom(phoneNumber: String, completion: @escaping getQueryHandler)
    
    /// Получить email из snapshota
    func getEmail(querySnapshot: QuerySnapshot, completion: @escaping getEmailHandler)
    
    /// Проверка номера телефона на наличие в базе
    func checkNumberExist(phoneNumber: String, completion: @escaping getDataHandler)
    
    /// Проверка email на наличие в базе
    func checkEmailExist(email: String, completion: @escaping (Bool?, Error?) -> ())
    
    /// Проверка username на наличие в базе
    func checkUsernameExist(username: String, completion: @escaping (Bool?, Error?) -> ())
    
    /// Загрузить пользователя по почте
    func loadClient(email: String, completion: @escaping (QueryDocumentSnapshot?, Error?) -> ())
}
