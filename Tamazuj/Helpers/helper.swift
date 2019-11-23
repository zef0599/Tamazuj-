//
//  helper.swift
//  Test-API
//
//  Created by osama abu dahi on 04/08/2019.
//  Copyright © 2019 Osama Emad. All rights reserved.
//

import Foundation


// To save APIToken in userdefaults (Local database)

class helper {
    
    static var userTyape:String = ""
    
    static func saveUserType(user: String) {
        
        let def = UserDefaults.standard
        
        struct Key{ fileprivate static let userType = "user"}
        
        def.setValue(user, forKey: Key.userType)
        def.synchronize()
    }
    static func saveUserToken(token: String) {
        
        let def = UserDefaults.standard
        
        struct Key{ fileprivate static let UserToken = "user_token"}
        
        def.setValue(token, forKey: Key.UserToken)
        def.synchronize()
    }

    static func getUserToken() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "user_token") as? String
    }
    
    static func deletUserToken(){
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
            
        }
    }
    static func getUserType() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "user") as? String
    }
    static func logout(){
        helper.deletUserToken()
        WindowManger.show(.account, animated: true)
        
    }
}

