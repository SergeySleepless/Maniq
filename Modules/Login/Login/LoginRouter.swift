//
//  LoginRouter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/5/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

@objc protocol LoginRoutingLogic {
    func routeToRegistration()
    func routeToForgotPassword()
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject {
    
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Navigation
    
//    func navigateToSomewhere(source: LoginViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }
    
}

extension LoginRouter: LoginRoutingLogic {
    
    func routeToRegistration() {
        let storyboard = UIStoryboard(name: "PhoneEnter", bundle: bundle)
        guard let viewController = storyboard.instantiateInitialViewController()
        else {
            return
        }
        self.viewController?.show(viewController, sender: nil)
    }
    
    func routeToForgotPassword() {
        //let storyboard = UIStoryboard(name: "PhoneEnter", bundle: bundle)
    }
//    func routeToSomewhere(segue: UIStoryboardSegue?) {
//        if let segue = segue {
//            let destinationVC = segue.destination as! SomewhereViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//        } else {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//            navigateToSomewhere(source: viewController!, destination: destinationVC)
//        }
//    }
}

extension LoginRouter: LoginDataPassing {
//    func passDataToSomewhere(source: LoginDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
