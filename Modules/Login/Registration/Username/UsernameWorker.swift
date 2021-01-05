//
//  UsernameWorker.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import FirebaseService

class UsernameWorker {
    
    private let auth = FirebaseServiceFactory.shared.makeAuthService()
    private let firestore = FirebaseServiceFactory.shared.makeFirestoreService()
    
    func checkUsernameExist(username: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        firestore.checkUsernameExist(username: username) { (result) in
            switch result {
            case .success(let isExist):
                completion(.success(isExist))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func setUsername(_ username: String, completion: @escaping (Result<Bool, Error>) -> ()) {
//        auth.currentUser.
    }
    
}
