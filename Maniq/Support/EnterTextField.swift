//
//  EnterTextField.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 13.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

class EnterTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        delegate = self
    }
    
    func setError() {
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.borderColor = UIColor.red.cgColor
    }
    
    func cleanError() {
        layer.borderWidth = 0
    }
}

extension EnterTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cleanError()
    }
}
