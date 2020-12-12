//
//  LoginModels.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

enum Login {
    
    enum Login {
        struct Request {
            let login: String
            let password: String
        }
        struct Response {
            let error: Error?
        }
        struct ViewModel {
            let error: Error?
        }
    }
    
}
