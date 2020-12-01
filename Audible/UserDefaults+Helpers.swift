//
//  UserDefaults+Helpers.swift
//  Audible
//
//  Created by mac on 27/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

enum UserDefaultsKeys: String {
    case isLoggedIn
}

extension UserDefaults {
    func setIsLoggedIn(value: Bool) {
        set(false, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
