//
//  logIn.swift
//  Tamazuj
//
//  Created by osama abu dahi on 30/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation

struct logIn:Codable {
    
    let token:String?
    let status:Int?
    let message:String?

}
/*
 "message": "لا يوجد تشابه بين الرقم السري القديم مع الموجود",
 "status": "0"
 */
struct UpatePass:Codable {
    let message:String?
    let status:String?
}
