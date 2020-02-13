//
//  VKAuth.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 13.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation
import VK_ios_sdk

protocol VKAuthDelegate {
    func authShouldShow(_ viewController: UIViewController)
    func authSignIn()
    func authDidSignInFail()
}

protocol VKAuthInterface {
    func wakeUpSession()
}

final class VKAuth: NSObject {
    
    private let VK_APP_ID = "7319530"
    private let vkSdk: VKSdk
    
    var delegate: VKAuthDelegate?
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: VK_APP_ID)
        super.init()
        
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
}

extension VKAuth: VKAuthInterface {
    func wakeUpSession() {
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { (state, error) in
            if state == .authorized {
                self.delegate?.authSignIn()
            } else if state == .initialized {
                VKSdk.authorize(scope)
            } else if state == .error {
                self.delegate?.authDidSignInFail()
            }
        }
    }
}

extension VKAuth: VKSdkDelegate {
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        delegate?.authSignIn()
    }
    
    func vkSdkUserAuthorizationFailed() {
    }
}

extension VKAuth: VKSdkUIDelegate {
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        delegate?.authShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
    }
}
