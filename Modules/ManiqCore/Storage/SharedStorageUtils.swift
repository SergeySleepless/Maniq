//
//  SharedStorageUtils.swift
//  ManiqCore
//
//  Created by Сергей Гаврилов on 12/12/20.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import Foundation

public final class SharedStoragesUtils {

    private static var bundle: Bundle {
        return Bundle.main
    }

    private static var bundleId: String {
        return bundle.bundleIdentifier ?? ""
    }

    private static var appIdentifierPrefix: String {
        return bundle.infoDictionary?["AppIdentifierPrefix"] as? String ?? ""
    }

    public static var keychainAccessGroup: String {
        return "\(appIdentifierPrefix)\(bundleId)"
    }

    public static var userDefaultsSuiteName: String {
        return "group.\(bundleId)"
    }
}
