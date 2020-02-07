//
//  FirestoreServices.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 07.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirestoreServices {
    
    typealias getQueryHandler = (QuerySnapshot?, Error?) -> ()
    typealias getEmailHandler = (String?) -> ()
    
    private let firestore = Firestore.firestore()
    
    func getSnapshotFrom(username: String, handler: @escaping getQueryHandler) {
        firestore
            .collection("users")
            .whereField("username", isEqualTo: username)
            .getDocuments(source: .server) { (querySnapshot, error) in
                handler(querySnapshot, error)
        }
    }
    
    func getSnapshotFrom(phoneNumber: String, handler: @escaping getQueryHandler) {
        firestore
            .collection("users")
            .whereField("phoneNumber", isEqualTo: phoneNumber)
            .getDocuments(source: .server) { (querySnapshot, error) in
                handler(querySnapshot, error)
        }
    }
    
    func getEmail(querySnapshot: QuerySnapshot, handler: @escaping getEmailHandler) {
        let email = getEmailFrom(documents: querySnapshot.documents)
        handler(email)
    }
    
    private func getEmailFrom(documents: [QueryDocumentSnapshot]) -> String? {
        var email: String?
        if documents.count == 1 {
            let doc = documents.first!
            email = doc.data()["email"] as? String
        } else {}
        return email
    }
    
    init() {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = false
        firestore.settings = settings
    }
    
}
