//
//  CheckCodeRouter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

@objc protocol CheckCodeRoutingLogic {
    func routeToUsername()
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol CheckCodeDataPassing {
    var dataStore: CheckCodeDataStore? { get }
}

class CheckCodeRouter: NSObject {
    
    weak var viewController: CheckCodeViewController?
    var dataStore: CheckCodeDataStore?
    
    // MARK: Navigation
    
//    func navigateToSomewhere(source: CheckCodeViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }
    
}

extension CheckCodeRouter: CheckCodeRoutingLogic {
    
    func routeToUsername() {
        let storyboard = UIStoryboard(name: "CreateUsername", bundle: bundle)
        guard let viewController = storyboard.instantiateInitialViewController() as? CreateUsernameViewController
        else {
            return
        }
        self.viewController?.show(viewController, sender: nil)
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

extension CheckCodeRouter: CheckCodeDataPassing {
//    func passDataToSomewhere(source: CheckCodeDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
