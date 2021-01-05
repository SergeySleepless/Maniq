//
//  UsernameRouter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

@objc protocol UsernameRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol UsernameDataPassing {
    var dataStore: UsernameDataStore? { get }
}

class UsernameRouter: NSObject {
    
    weak var viewController: UsernameViewController?
    var dataStore: UsernameDataStore?
    
    // MARK: Navigation
    
//    func navigateToSomewhere(source: UsernameViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }
    
}

extension UsernameRouter: UsernameRoutingLogic {
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

extension UsernameRouter: UsernameDataPassing {
//    func passDataToSomewhere(source: UsernameDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
