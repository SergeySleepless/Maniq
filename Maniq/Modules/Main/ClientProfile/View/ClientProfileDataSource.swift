//
//  ClientProfileDataSource.swift
//  Maniq
//
//  Created by Сергей Гаврилов on 15.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import UIKit

protocol ClientProfileDataSourceProtocol {
    func getNumbersOfRowsInSection(_ section: Int) -> Int
    func getNumberOfSections() -> Int
    func getProfileDataCell(_ tableView: UITableView) -> ClientProfileDataCell
    func getFeaturesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

class ClientProfileDataSource: NSObject {
    
    let user: ClientData!
    
    init(user: ClientData) {
        self.user = user
    }
    
}

extension ClientProfileDataSource: ClientProfileDataSourceProtocol {
    
    func getNumbersOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return user.features.isEmpty ? 1 : user.features.count
        case 2: return 0
        default: return 0
        }
    }
    
    func getNumberOfSections() -> Int {
        return 3
    }
    
    func getProfileDataCell(_ tableView: UITableView) -> ClientProfileDataCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientProfileDataCell") as! ClientProfileDataCell
        cell.avatarImageView.image = user.avatar
        cell.ageLabel.text = user.getAge()
        cell.fullNameLabel.text = user.getFullName()
        cell.emailButton.setTitle(user.email, for: .normal)
        cell.phoneButton.setTitle(user.phoneNumber, for: .normal)
        cell.registrationDateLabel.text = user.getRegistrationDate()
        return cell
    }
    
    func getFeaturesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if user.features.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClientProfileDataFeaturesEmpty") as! ClientProfileDataFeaturesEmpty
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClientProfileFeaturesCell") as! ClientProfileFeaturesCell
            let index = indexPath.row
            let feature = user.features[index]
            cell.titleLabel.text = feature.title
            cell.iconImageView.image = feature.icon
            return cell
        }
    }
    
}

extension ClientProfileDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getNumbersOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return getProfileDataCell(tableView)
        }
        //if indexPath.section == 1 {
            return getFeaturesCell(tableView, cellForRowAt: indexPath)
        //}
    }
    
}

extension ClientProfileDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
