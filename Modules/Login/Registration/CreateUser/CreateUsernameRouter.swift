//
//  CreateUsernameRouter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

@objc protocol CreateUsernameRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol CreateUsernameDataPassing {
    var dataStore: CreateUsernameDataStore? { get }
}

class CreateUsernameRouter: NSObject {
    
    weak var viewController: CreateUsernameViewController?
    var dataStore: CreateUsernameDataStore?
    
    // MARK: Navigation
    
//    func navigateToSomewhere(source: CreateUsernameViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }
    
}

extension CreateUsernameRouter: CreateUsernameRoutingLogic {
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

extension CreateUsernameRouter: CreateUsernameDataPassing {
//    func passDataToSomewhere(source: CreateUsernameDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
