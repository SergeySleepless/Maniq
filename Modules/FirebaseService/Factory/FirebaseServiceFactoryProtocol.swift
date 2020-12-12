//
//  FirebaseServiceFactoryProtocol.swift
//  FirebaseService
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation

public protocol FirebaseServiceFactoryProtocol {
    func makeAuthService() -> AuthServiceProtocol
    func makeFirestoreService() -> FirestoreServiceProtocol
}
