//
//  PhoneEnterRouter.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 12/6/20.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

@objc protocol PhoneEnterRoutingLogic {
    func routeToCheckCode()
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PhoneEnterDataPassing {
    var dataStore: PhoneEnterDataStore? { get }
}

class PhoneEnterRouter: NSObject {
    
    weak var viewController: PhoneEnterViewController?
    var dataStore: PhoneEnterDataStore?
    
}

extension PhoneEnterRouter: PhoneEnterRoutingLogic {
    func routeToCheckCode() {
        let storyboard = UIStoryboard(name: "CheckCode", bundle: bundle)
        guard let viewController = storyboard.instantiateInitialViewController() as? CheckCodeViewController,
              var destinationDS = viewController.router?.dataStore,
              let dataStore = dataStore
        else {
            return
        }
        passDataToCheckCode(source: dataStore, destination: &destinationDS)
        self.viewController?.show(viewController, sender: nil)
    }
}

extension PhoneEnterRouter: PhoneEnterDataPassing {
    func passDataToCheckCode(source: PhoneEnterDataStore, destination: inout CheckCodeDataStore) {
        destination.verificationId = source.verificationId
        destination.userRegModel = source.userRegModel
    }
}
