//
//  ResetPasswordPresenter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 13.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class ResetPasswordPresenter {
    
    // MARK: - Private properties -
    
    private unowned let view: ResetPasswordViewInterface
    private let interactor: ResetPasswordInteractorInterface
    private let wireframe: ResetPasswordWireframeInterface
    
    // MARK: - Lifecycle -
    
    init(view: ResetPasswordViewInterface, interactor: ResetPasswordInteractorInterface, wireframe: ResetPasswordWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    private func isFilledData(loginText: String) -> Bool {
        if loginText.isEmpty {
            wireframe.showErrorAlert(with: NotFilled.loginNotFilled.localizedDescription)
            return false
        }
        return true
    }
    
    private func isValid(phoneNumber: String) -> Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = phoneNumber.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return phoneNumber == filtered
    }
    
    func getFormatted(_ phoneNumber: String) -> String {
        let cleanPhoneNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+X (XXX) XXX-XX-XX"
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    private func restoreBy(username: String) {
        interactor.restoreBy(username: username) { (result) in
            self.view.loadingView(show: false)
            switch result {
            case .accept:
                self.wireframe.routeToSuccessController()
            case .failure(let error):
                self.wireframe.showErrorAlert(with: error.localizedDescription)
            }
        }
    }
    
    private func restoreBy(phoneNumber: String) {
        interactor.restoreBy(phoneNumber: phoneNumber) { (result) in
            self.view.loadingView(show: false)
            switch result {
            case .accept:
                self.wireframe.routeToSuccessController()
            case .failure(let error):
                self.wireframe.showErrorAlert(with: error.localizedDescription)
            }
        }
    }
    
}

// MARK: - Extensions -

extension ResetPasswordPresenter: ResetPasswordPresenterInterface {
    func send(login: String) {
        guard isFilledData(loginText: login) else {return}
        view.loadingView(show: true)
        if isValid(phoneNumber: login) {
            restoreBy(phoneNumber: getFormatted(login))
            return
        }
        restoreBy(username: login)
    }
    
}
