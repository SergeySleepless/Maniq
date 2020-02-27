//
//  ClientProfileViewController.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 14.02.2020.
//  Copyright (c) 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

final class ClientProfileViewController: UITableViewController {
    
    var user: ClientData!
    private var data: ClientProfileDataSource!

    // MARK: - Public properties -

    var presenter: ClientProfilePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func set(user: ClientData) {
        self.user = user
        data = ClientProfileDataSource(user: user)
        tableView.dataSource = data
        tableView.delegate = data
        setTitle(title: user.username)
    }
	
}

// MARK: - Extensions -

extension ClientProfileViewController: ClientProfileViewInterface {
}
