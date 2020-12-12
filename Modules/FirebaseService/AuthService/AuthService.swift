//
//  AuthService.swift
//  FirebaseService
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import ServicesCommon
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    private let auth: Auth
    private let firestore: FirestoreServiceProtocol
    private let phoneAuthProvider = PhoneAuthProvider.provider()
    
    init(auth: Auth, firestore: FirestoreServiceProtocol) {
        self.auth = auth
        self.firestore = firestore
        setLanguage()
    }
    
    private func setLanguage() {
        auth.languageCode = "ru"
    }
    
    private func getEmailAndAuth(password: String, querySnapshot: QuerySnapshot, completion: @escaping (BaseResult) -> ()) {
        firestore.getEmail(querySnapshot: querySnapshot) { [weak self] (email) in
            if let email = email {
                self?.login(email: email,
                            password: password,
                            completion: completion)
            } else {
                completion(.failure(AuthError.wrongEnter.loginDataIsWrong))
            }
        }
    }
    
}

extension AuthService: AuthServiceProtocol {

    func login(email: String, password: String, completion: @escaping (BaseResult) -> ()) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let fError = AuthErrorCode(rawValue: error._code)!
                completion(BaseResult.failure(AuthError(code: fError)))
            } else {
                completion(BaseResult.accept)
            }
        }
    }
    
    func login(username: String, password: String, completion: @escaping (BaseResult) -> ()) {
        firestore.getSnapshotFrom(username: username) { [weak self] (snapshot, error) in
            if let snapshot = snapshot {
                self?.getEmailAndAuth(password: password, querySnapshot: snapshot, completion: completion)
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func login(phone: String, password: String, completion: @escaping (BaseResult) -> ()) {
        firestore.getSnapshotFrom(phoneNumber: phone) { [weak self] (snapshot, error) in
            if let snapshot = snapshot {
                self?.getEmailAndAuth(password: password, querySnapshot: snapshot, completion: completion)
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func verifyPhone(phoneNumber: String, completion: @escaping (Result<String, Error>) -> ()) {
        phoneAuthProvider.verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let verificationID = verificationID {
                completion(.success(verificationID))
            }
        }
    }
    
    func resetPassword(email: String, completion: @escaping (BaseResult) -> ()) {
        auth.sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                let fError = AuthErrorCode(rawValue: error._code)!
                completion(.failure(AuthError(code: fError)))
            } else {
                completion(BaseResult.accept)
            }
        }
    }
    
    func getCredential(withVerificationId: String, verificationCode: String) -> PhoneAuthCredential {
        return phoneAuthProvider.credential(withVerificationID: withVerificationId,
                                            verificationCode: verificationCode)
    }
    
    func signIn(with credential: PhoneAuthCredential, completion: @escaping (AuthDataResult?, Error?) -> ()) {
        auth.signIn(with: credential, completion: completion)
    }
    
}
