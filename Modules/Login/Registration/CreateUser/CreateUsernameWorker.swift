//
//  CreateUsernameWorker.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import FirebaseService

class CreateUsernameWorker {
    
    private let firestore = FirebaseServiceFactory.shared.makeFirestoreService()
    
    func sendUsername(username: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        firestore.checkUsernameExist(username: username) { (result) in
            switch result {
                case .success(let isExist):
                    completion(.failure(<#T##Error#>))
                case .failure(let error):
                    <#code#>
            }
        }
        firestore.checkUsernameExist(username: username, completion: completion)
    }
    
}
