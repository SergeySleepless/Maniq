//
//  CurrentState.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 03.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

final class CurrentState {
    
    static let shared = CurrentState()
    private init() {}
    
    var clientData: ClientData?
    var firebaseUser: User?
    var phoneNumber: String?
    var phoneAuthCredential: PhoneAuthCredential?
    var authVerificationID: String?
    
}
