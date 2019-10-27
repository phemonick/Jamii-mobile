//
//  UserDefaults+Extension.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 27/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import Foundation


extension UserDefaults{
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    
    
    func saveUser(user : User){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: UserDefaultsKeys.user.rawValue)
        }
    }
    
    func getUser() -> User?{
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: UserDefaultsKeys.user.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: savedPerson) {
                return user
            }
        }
        return nil
    }
}

enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
    case user
}
