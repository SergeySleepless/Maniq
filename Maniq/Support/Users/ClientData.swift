//
//  ClientData.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 15.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class ClientData: UserProtocol {
    var username: String!
    var avatarUrl: String?
    var avatar: UIImage?
    var name: String!
    var birthDate: Date!
    var registrationDate: Date!
    var phoneNumber: String!
    var email: String!
    var features: [UserFeatures] = []
    var isMaster: Bool!
    
    init(model: DocumentSnapshot) {
        let data = model.data()
        username = data?["username"] as? String
        avatarUrl = data?["avatarUrl"] as? String
        name = data?["name"] as? String
        phoneNumber = data?["phoneNumber"] as? String
        email = data?["email"] as? String
        isMaster = data?["isMaster"] as? Bool
        setRegistrationDate(value: data?["registrationDate"])
        setBirthDate(value: data?["birthDate"])
        setFeatures(value: data?["features"])
    }
    
    private func setRegistrationDate(value: Any?) {
        if let timeStamp = value as? Timestamp {
            registrationDate = timeStamp.dateValue()
        }
    }
    
    private func setBirthDate(value: Any?) {
        if let timeStamp = value as? Timestamp {
            birthDate = timeStamp.dateValue()
        }
    }
    
    private func setFeatures(value: Any?) {
//        if let values = value as? [Int] {
//            //features = values.map { UserFeatures(rawValue: $0)! }
//        }
    }
    
    func getAge() -> String? {
        let calendar = Calendar.current
        let currentDate = Date()
        let age = calendar.dateComponents([.year, .month, .day], from: birthDate, to: currentDate).year!
        var ageString = "\(age)"
        
        switch age % 10 {
        case 0:
            ageString += " лет"
        case 1:
            if age < 20 {
                ageString += " лет"
            } else {
                ageString += " год"
            }
        case 2, 3, 4:
            if age < 20 {
                ageString += " лет"
            } else {
                ageString += " года"
            }
        case 5, 6, 7, 8, 9:
            ageString += " лет"
        default:
            break
        }
        
        return ageString
    }
    
    func getRegistrationDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ru")
        
        return dateFormatter.string(from: registrationDate)
    }
    
}
