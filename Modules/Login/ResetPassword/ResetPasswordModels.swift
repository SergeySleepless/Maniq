//
//  ResetPasswordModels.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

enum ResetPassword {
    
    enum ResetPassword {
        struct Request {
            let login: String
        }
        struct Response {
            let error: Error?
        }
        struct ViewModel {
            let error: Error?
        }
    }
    
}
