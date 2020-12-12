//
//  CheckCodeModels.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

enum CheckCode {
    
    enum Code {
        struct Request {
            let code: String
        }
        struct Response {
            let error: Error?
        }
        struct ViewModel {
            let error: Error?
        }
    }
    
}
