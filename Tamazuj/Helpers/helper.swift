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
    
    
     static func saveApiToken(token: String) {
        
        let def = UserDefaults.standard
        
    struct Key{
        
       fileprivate static let apiToken = "user_token"
        
    }
    
        // save api token to UserDefaults
        def.setValue(token, forKey: Key.apiToken)
        def.synchronize()
    }
    
    static func getApiToken() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "user_token") as? String
    }
}
