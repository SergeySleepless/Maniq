//
//  PhoneEnterModels.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

enum PhoneEnter {
    
    enum FormatPhone {
        struct Request {
            let phone: String
        }
        struct Response {
            let phone: String
        }
        struct ViewModel {
            let formattedPhone: String
            let isValid: Bool
        }
    }
    
    enum SendCode {
        struct Request {
            let phone: String
        }
        struct Response {
            let error: Error?
        }
        struct ViewModel {
            let error: Error?
        }
    }
    
}
