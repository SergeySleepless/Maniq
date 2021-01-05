//
//  User.swift
//  ManiqCore
//
//  Created by Сергей Гаврилов on 05.01.2021.
//  Copyright © 2021 Сергей Гаврилов. All rights reserved.
//

import

public class User: UserProtocol {
    
    public var avatarLink: URL?
    public var name: String
    public var birthDate: Date
    public var registrationDate: Date
    public var phoneNumber: String
    public var email: String
    public var features: [UserFeatures]
    public var isMaster: Bool
    
    public init?(dictionary: [String: Any]) {
        
    }
    
}
