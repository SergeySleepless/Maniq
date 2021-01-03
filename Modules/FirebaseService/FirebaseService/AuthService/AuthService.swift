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
    
    private func getEmailAndAuth(password: String, querySnapshot: QuerySnapshot, completion: @escaping (Error?) -> ()) {
        firestore.getEmail(querySnapshot: querySnapshot) { [weak self] (email) in
            if let email = email {
                self?.login(email: email,
                            password: password,
                            completion: completion)
            } else {
                completion(AuthError.wrongEnter.loginDataIsWrong)
            }
        }
    }
    
    private func reset(querySnapshot: QuerySnapshot?, completion: @escaping (Error?) -> ()) {
        guard !querySnapshot!.documents.isEmpty else {
            completion(WrongEnter.loginDataIsWrong)
            return
        }
        firestore.getEmail(querySnapshot: querySnapshot!) { [weak self] email in
            guard let email = email else {
                completion(AuthError.userNotFound)
                return
            }
            self?.resetPassword(email: email, completion: completion)
        }
    }
    
    private func resetPassword(email: String, completion: @escaping (Error?) -> ()) {
        self.auth.sendPasswordReset(withEmail: email) { (error) in
            completion(error)
        }
    }
    
}

extension AuthService: AuthServiceProtocol {
    
    func login(email: String, password: String, completion: @escaping (Error?) -> ()) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let fError = AuthErrorCode(rawValue: error._code)!
                completion(AuthError(code: fError))
            } else {
                completion(nil)
            }
        }
    }
    
    func login(username: String, password: String, completion: @escaping (Error?) -> ()) {
        firestore.getSnapshotFrom(username: username) { [weak self] result in
            switch result {
                case .success(let snapshot):
                    self?.getEmailAndAuth(password: password, querySnapshot: snapshot, completion: completion)
                case .failure(let error):
                    completion(error)
            }
        }
    }
    
    func login(phone: String, password: String, completion: @escaping (Error?) -> ()) {
        firestore.getSnapshotFrom(phoneNumber: phone) { [weak self] result in
            switch result {
                case .success(let snapshot):
                    self?.getEmailAndAuth(password: password, querySnapshot: snapshot, completion: completion)
                case .failure(let error):
                    completion(error)
            }
        }
    }
    
    func verifyPhone(phoneNumber: String, completion: @escaping (Result<String, Error>) -> ()) {
        firestore.checkNumberExist(phoneNumber: phoneNumber) { [weak self] (result) in
            switch result {
                case .success(let isExist):
                    if isExist {
                        completion(.failure(AuthError.phoneIsExist))
                    } else {
                        self?.phoneAuthProvider.verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
                            if let error = error {
                                completion(.failure(error))
                            }
                            if let verificationID = verificationID {
                                completion(.success(verificationID))
                            }
                        }
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func resetPassword(phone: String, completion: @escaping (Error?) -> ()) {
        firestore.getSnapshotFrom(phoneNumber: phone) { [weak self] result in
            switch result {
                case .success(let snapshot):
                    self?.reset(querySnapshot: snapshot, completion: completion)
                case .failure(let error):
                    completion(error)
            }
        }
    }
    
    func resetPassword(username: String, completion: @escaping (Error?) -> ()) {
        firestore.getSnapshotFrom(username: username) { [weak self] result in
            switch result {
                case .success(let snapshot):
                    self?.reset(querySnapshot: snapshot, completion: completion)
                case .failure(let error):
                    completion(error)
            }
        }
    }
    
    func getCredential(withVerificationId: String, verificationCode: String) -> PhoneAuthCredential {
        return phoneAuthProvider.credential(withVerificationID: withVerificationId,
                                            verificationCode: verificationCode)
    }
    
    func signIn(with credential: PhoneAuthCredential, completion: @escaping (Result<AuthDataResult, Error>) -> ()) {
        auth.signIn(with: credential) { (authResult, error) in
            if let authResult = authResult {
                completion(.success(authResult))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
}
