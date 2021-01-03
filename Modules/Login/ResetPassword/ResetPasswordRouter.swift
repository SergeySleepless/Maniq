//
//  ResetPasswordRouter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

@objc protocol ResetPasswordRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ResetPasswordDataPassing {
    var dataStore: ResetPasswordDataStore? { get }
}

class ResetPasswordRouter: NSObject {
    
    weak var viewController: ResetPasswordViewController?
    var dataStore: ResetPasswordDataStore?
    
    // MARK: Navigation
    
//    func navigateToSomewhere(source: ResetPasswordViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }
    
}

extension ResetPasswordRouter: ResetPasswordRoutingLogic {
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

extension ResetPasswordRouter: ResetPasswordDataPassing {
//    func passDataToSomewhere(source: ResetPasswordDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
