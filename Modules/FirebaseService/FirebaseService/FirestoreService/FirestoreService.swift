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
    
    func getSnapshotFrom(username: String, completion: @escaping (Result<QuerySnapshot, Error>) -> ()) {
        getCollection(type: .user)
            .whereField(CollectionFields.username.rawValue, isEqualTo: username)
            .getDocuments(source: .server) { (querySnapshot, error) in
                if let snapshot = querySnapshot {
                    completion(.success(snapshot))
                } else if let error = error {
                    completion(.failure(error))
                }
            }
    }
    
    func getSnapshotFrom(phoneNumber: String, completion: @escaping (Result<QuerySnapshot, Error>) -> ()) {
        getCollection(type: .user)
            .whereField(CollectionFields.phoneNumber.rawValue, isEqualTo: phoneNumber)
            .getDocuments(source: .server) { (querySnapshot, error) in
                if let snapshot = querySnapshot {
                    completion(.success(snapshot))
                } else if let error = error {
                    completion(.failure(error))
                }
            }
    }
    
    func getEmail(querySnapshot: QuerySnapshot, completion: @escaping (String?) -> ()) {
        var email: String?
        if querySnapshot.documents.count == 1 {
            let doc = querySnapshot.documents.first!
            email = doc.data()["email"] as? String
        } else {}
        completion(email)
    }
    
    func checkNumberExist(phoneNumber: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        getCollection(type: .user)
            .whereField(CollectionFields.phoneNumber.rawValue, isEqualTo: phoneNumber)
            .getDocuments(source: .server) { (querySnapshot, error) in
                if let numberExist = querySnapshot?.documents.isEmpty {
                    completion(.success(numberExist))
                } else if let error = error {
                    completion(.failure(error))
                }
            }
    }
    
    func checkEmailExist(email: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        getCollection(type: .user)
            .whereField(CollectionFields.email.rawValue, isEqualTo: email)
            .getDocuments(source: .server) { (querySnapshot, error) in
                if let emailExist = querySnapshot?.documents.isEmpty {
                    completion(.success(emailExist))
                } else if let error = error {
                    completion(.failure(error))
                }
            }
    }
    
    func checkUsernameExist(username: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        getCollection(type: .user)
            .whereField(CollectionFields.username.rawValue, isEqualTo: username)
            .getDocuments(source: .server) { (querySnapshot, error) in
                if let isExist = querySnapshot?.documents.isEmpty {
                    completion(.success(isExist))
                } else if let error = error {
                    completion(.failure(error))
                }
            }
    }
    
    func loadClient(email: String, completion: @escaping (Result<QueryDocumentSnapshot, Error>) -> ()) {
        getCollection(type: .user)
            .whereField(CollectionFields.email.rawValue, isEqualTo: email)
            .getDocuments(source: .server) { (querySnapshot, error) in
                if let clientDocument = querySnapshot?.documents.first {
                    completion(.success(clientDocument))
                } else if let error = error {
                    completion(.failure(error))
                }
            }
    }
    
}
