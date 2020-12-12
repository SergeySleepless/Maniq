//
//  FirestoreService.swift
//  FirebaseService
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import FirebaseFirestore

enum CollectionType: String {
    case user = "users"
}

enum CollectionFields: String {
    case username = "username"
    case phoneNumber = "phoneNumber"
    case email = "email"
}

class FirestoreServices {
    
    private let firestore = Firestore.firestore()
    
    init() {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = false
        firestore.settings = settings
    }
    
    private func getCollection(type: CollectionType) -> CollectionReference {
        return firestore.collection(type.rawValue)
    }
    
}

extension FirestoreServices: FirestoreServiceProtocol {
    
    func getSnapshotFrom(username: String, completion: @escaping getQueryHandler) {
        getCollection(type: .user)
            .whereField(CollectionFields.username.rawValue, isEqualTo: username)
            .getDocuments(source: .server) { (querySnapshot, error) in
                completion(querySnapshot, error)
            }
    }
    
    func getSnapshotFrom(phoneNumber: String, completion: @escaping getQueryHandler) {
        getCollection(type: .user)
            .whereField(CollectionFields.phoneNumber.rawValue, isEqualTo: phoneNumber)
            .getDocuments(source: .server) { (querySnapshot, error) in
                completion(querySnapshot, error)
            }
    }
    
    func getEmail(querySnapshot: QuerySnapshot, completion: @escaping getEmailHandler) {
        var email: String?
        if querySnapshot.documents.count == 1 {
            let doc = querySnapshot.documents.first!
            email = doc.data()["email"] as? String
        } else {}
        completion(email)
    }
    
    func checkNumberExist(phoneNumber: String, completion: @escaping getDataHandler) {
        getCollection(type: .user)
            .whereField(CollectionFields.phoneNumber.rawValue, isEqualTo: phoneNumber)
            .getDocuments(source: .server) { (querySnapshot, error) in
                let numberExist = querySnapshot?.documents.isEmpty
                completion(numberExist == nil ? nil : !numberExist!, error)
            }
    }
    
    func checkEmailExist(email: String, completion: @escaping (Bool?, Error?) -> ()) {
        getCollection(type: .user)
            .whereField(CollectionFields.email.rawValue, isEqualTo: email)
            .getDocuments(source: .server) { (querySnapshot, error) in
                let emailExist = querySnapshot?.documents.isEmpty
                completion(emailExist == nil ? nil : !emailExist!, error)
            }
    }
    
    
    func checkUsernameExist(username: String, completion: @escaping (Bool?, Error?) -> ()) {
        getCollection(type: .user)
            .whereField(CollectionFields.username.rawValue, isEqualTo: username)
            .getDocuments(source: .server) { (querySnapshot, error) in
                let usernameExist = querySnapshot?.documents.isEmpty
                completion(usernameExist == nil ? nil : !usernameExist!, error)
            }
    }
    
    func loadClient(email: String, completion: @escaping (QueryDocumentSnapshot?, Error?) -> ()) {
        getCollection(type: .user)
            .whereField(CollectionFields.email.rawValue, isEqualTo: email)
            .getDocuments(source: .server) { (querySnapshot, error) in
                let clientDocument = querySnapshot?.documents.first
                completion(clientDocument, error)
            }
    }
    
}
