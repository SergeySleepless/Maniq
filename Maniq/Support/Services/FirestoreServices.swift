//
//  FirestoreServices.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 07.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol FirestoreInterface {
    typealias getQueryHandler = (QuerySnapshot?, Error?) -> ()
    typealias getEmailHandler = (String?) -> ()
    typealias getDataHandler = (Bool?, Error?) -> ()
    
    /// Получить snapshot по имени пользователя
    func getSnapshotFrom(username: String, handler: @escaping getQueryHandler)
    /// Получить snapshot по номеру телефона пользователя
    func getSnapshotFrom(phoneNumber: String, handler: @escaping getQueryHandler)
    /// Получить email из snapshota
    func getEmail(querySnapshot: QuerySnapshot, handler: @escaping getEmailHandler)
    /// Проверка номера телефона на наличие в базе
    func checkNumberExist(phoneNumber: String, handler: @escaping getDataHandler)
    /// Проверка email на наличие в базе
    func checkEmailExist(email: String, handler: @escaping (Bool?, Error?) -> ())
    /// Проверка username на наличие в базе
    func checkUsernameExist(username: String, handler: @escaping (Bool?, Error?) -> ())
    /// Загрузить пользователя по почте
    func loadClient(email: String, handler: @escaping (QueryDocumentSnapshot?, Error?) -> ())
}

class FirestoreServices {
    
    private let firestore = Firestore.firestore()
    
    init() {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = false
        firestore.settings = settings
    }
    
}

extension FirestoreServices: FirestoreInterface {
    
    func getSnapshotFrom(username: String, handler: @escaping getQueryHandler) {
        firestore.collection("users").whereField("username", isEqualTo: username).getDocuments(source: .server) { (querySnapshot, error) in
            handler(querySnapshot, error)
        }
    }
    
    func getSnapshotFrom(phoneNumber: String, handler: @escaping getQueryHandler) {
        firestore.collection("users").whereField("phoneNumber", isEqualTo: phoneNumber).getDocuments(source: .server) { (querySnapshot, error) in
            handler(querySnapshot, error)
        }
    }
    
    func getEmail(querySnapshot: QuerySnapshot, handler: @escaping getEmailHandler) {
        var email: String?
        if querySnapshot.documents.count == 1 {
            let doc = querySnapshot.documents.first!
            email = doc.data()["email"] as? String
        } else {}
        handler(email)
    }
    
    func checkNumberExist(phoneNumber: String, handler: @escaping getDataHandler) {
        firestore.collection("users").whereField("phoneNumber", isEqualTo: phoneNumber).getDocuments(source: .server) { (querySnapshot, error) in
            let numberExist = querySnapshot?.documents.isEmpty
            handler(numberExist == nil ? nil : !numberExist!, error)
        }
    }
    
    func checkEmailExist(email: String, handler: @escaping (Bool?, Error?) -> ()) {
        firestore.collection("users").whereField("email", isEqualTo: email).getDocuments(source: .server) { (querySnapshot, error) in
            let emailExist = querySnapshot?.documents.isEmpty
            handler(emailExist == nil ? nil : !emailExist!, error)
        }
    }
    
    
    func checkUsernameExist(username: String, handler: @escaping (Bool?, Error?) -> ()) {
        firestore.collection("users").whereField("username", isEqualTo: username).getDocuments(source: .server) { (querySnapshot, error) in
            let usernameExist = querySnapshot?.documents.isEmpty
            handler(usernameExist == nil ? nil : !usernameExist!, error)
        }
    }
    
    func loadClient(email: String, handler: @escaping (QueryDocumentSnapshot?, Error?) -> ()) {
        firestore.collection("users").whereField("email", isEqualTo: email).getDocuments(source: .server) { (querySnapshot, error) in
            let clientDocument = querySnapshot?.documents.first
            handler(clientDocument, error)
        }
    }
    
}
