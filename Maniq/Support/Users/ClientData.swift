//
//  ClientData.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 15.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ClientData: UserProtocol {
    var avatarUrl: String?
    var avatar: UIImage?
    var firstName: String?
    var lastName: String?
    var birthDate: Date?
    var registrationDate: Date!
    var phoneNumber: String!
    var email: String!
    var features: [UserFeatures] = []
    
    init(model: DocumentSnapshot) {
        let data = model.data()
        avatarUrl = data?["avatarUrl"] as? String
        firstName = data?["firstName"] as? String
        lastName = data?["lastName"] as? String
        birthDate = data?["birthDate"] as? Date
        registrationDate = data?["registrationDate"] as? Date
        phoneNumber = data?["phoneNumber"] as? String
        email = data?["email"] as? String
        setFeatures(values: data?["features"] as? [Int])
    }
    
    private func setFeatures(values: [Int]?) {
        guard let values = values else {return}
        features = values.map { UserFeatures(rawValue: $0)! }
    }
    
    func getFullName() -> String? {
        guard firstName != nil, lastName != nil else {
            return nil
        }
        return "\(firstName!) \(lastName!)"
    }
    
    func getAge() -> String? {
        return nil
    }
    
    func getRegistrationDate() -> String {
        return registrationDate.description
    }
    
}
