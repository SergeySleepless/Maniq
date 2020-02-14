//
//  ResetPasswordInteractor.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 13.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

final class ResetPasswordInteractor {
    
    private func restore(querySnapshot: QuerySnapshot?, handler: @escaping (AuthResult) -> ()) {
        guard !querySnapshot!.documents.isEmpty else {
            handler(AuthResult.failure(WrongEnter.loginDataIsWrong))
            return
        }
        firebaseServices.firestore.getEmail(querySnapshot: querySnapshot!) { email in
            guard let email = email else {
                handler(AuthResult.failure(AuthError.userNotFound))
                return
            }
            firebaseServices.auth.resetPassword(email: email) { (result) in
                handler(result)
            }
        }
    }
    
}

// MARK: - Extensions -

extension ResetPasswordInteractor: ResetPasswordInteractorInterface {
    
    func restoreBy(username: String, handler: @escaping (AuthResult) -> ()) {
        firebaseServices.firestore.getSnapshotFrom(username: username) { snapshot, error in
            if let error = error {
                let fError = FirestoreErrorCode(rawValue: error._code)!
                handler(AuthResult.failure(FirestoreError(code: fError)))
                return
            }
            self.restore(querySnapshot: snapshot, handler: handler)
        }
    }
    
    func restoreBy(phoneNumber: String, handler: @escaping (AuthResult) -> ()) {
        firebaseServices.firestore.getSnapshotFrom(phoneNumber: phoneNumber) { snapshot, error in
            if let error = error {
                let fError = FirestoreErrorCode(rawValue: error._code)!
                handler(AuthResult.failure(FirestoreError(code: fError)))
                return
            }
            self.restore(querySnapshot: snapshot, handler: handler)
        }
    }
    
}
