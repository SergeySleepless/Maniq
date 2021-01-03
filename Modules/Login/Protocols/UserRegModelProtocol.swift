//
//  UserRegModelProtocol.swift
//  Login
//
//  Created by Сергей Гаврилов on 1/3/21.
//  Copyright © 2021 Сергей Гаврилов. All rights reserved.
//

import Foundation

protocol UserRegModelProtocol {
    var phoneNumber: String? { get set }
    var username: String? { get set }
    var email: String? { get set }
}
