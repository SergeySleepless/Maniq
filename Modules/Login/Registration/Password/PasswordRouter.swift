//
//  PasswordRouter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 05.01.2021.
//  Copyright (c) 2021 Сергей Гаврилов. All rights reserved.
//

import UIKit

@objc protocol PasswordRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PasswordDataPassing {
    var dataStore: PasswordDataStore? { get }
}

class PasswordRouter: NSObject {
    
    weak var viewController: PasswordViewController?
    var dataStore: PasswordDataStore?
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: PasswordViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
}

extension PasswordRouter: PasswordRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
}

extension PasswordRouter: PasswordDataPassing {
    //func passDataToSomewhere(source: PasswordDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
