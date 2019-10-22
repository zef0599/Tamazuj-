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
    
    
    static func saveUserToken(token: String) {
        
        let def = UserDefaults.standard
        
        struct Key{ fileprivate static let UserToken = "user_token"}
        
        def.setValue(token, forKey: Key.UserToken)
        def.synchronize()
    }
    static func saveAdvisoerToken(token: String) {
        
        let def = UserDefaults.standard
        
        struct Key{ fileprivate static let AdvisorToken = "Advisor_token"}
        
       
        def.setValue(token, forKey: Key.AdvisorToken)
        def.synchronize()
    }
    
    static func getUserToken() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "user_token") as? String
    }
    
    static func getAdvisorToken() -> String? {
        let def = UserDefaults.standard
        
        return def.object(forKey: "Advisor_token") as? String
    }
    static func deletApiToken() -> String? {
        let def = UserDefaults.standard
        
        return def.object(forKey: "user_token") as? String
        def.removeObject(forKey:"user_token")
    }
    
}
