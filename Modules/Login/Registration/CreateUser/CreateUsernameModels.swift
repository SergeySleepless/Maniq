//
//  CreateUsernameModels.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

enum CreateUsername {
    
    enum SendUsername {
        struct Request {
            let username: String
        }
        struct Response {
            let error: String?
        }
        struct ViewModel {
            let error: String?
        }
    }
    
}
