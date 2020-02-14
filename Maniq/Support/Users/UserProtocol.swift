//
//  UserProtocol.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 15.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol UserProtocol {
    var avatar: UIImage? { get }
    var firstName: String? { get }
    var lastName: String? { get }
    var birthDate: Date? { get }
    var registrationDate: Date! { get }
    var phoneNumber: String! { get }
    var email: String! { get }
    var features: [UserFeatures] { get }
    
    func getFullName() -> String?
    func getAge() -> String?
    func getRegistrationDate() -> String
}
