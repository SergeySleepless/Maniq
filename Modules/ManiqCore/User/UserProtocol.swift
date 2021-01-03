//
//  UserProtocol.swift
//  ManiqCore
//
//  Created by Сергей Гаврилов on 1/3/21.
//  Copyright © 2021 Сергей Гаврилов. All rights reserved.
//

import UIKit

public protocol UserProtocol: AutoMockable {
    var avatar: UIImage? { get }
    var name: String { get }
    var birthDate: Date { get }
    var registrationDate: Date { get }
    var phoneNumber: String { get }
    var email: String { get }
    var features: [UserFeatures] { get }
    var isMaster: Bool { get }
}
