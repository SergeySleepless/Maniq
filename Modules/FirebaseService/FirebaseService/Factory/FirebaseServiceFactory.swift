//
//  FirebaseServiceFactory.swift
//  FirebaseService
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import FirebaseAuth

public class FirebaseServiceFactory {
    private init() {}
    public static let shared = FirebaseServiceFactory()
}

extension FirebaseServiceFactory: FirebaseServiceFactoryProtocol {
    public func makeAuthService() -> AuthServiceProtocol {
        let firestoreService = makeFirestoreService()
        return AuthService(auth: Auth.auth(), firestore: firestoreService)
    }
    
    public func makeFirestoreService() -> FirestoreServiceProtocol {
        return FirestoreServices()
    }
}
