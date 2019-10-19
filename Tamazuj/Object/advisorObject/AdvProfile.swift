//
//  AdvProfile.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/20/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
struct AdvProfile:Codable {
    let data:AdvProfileData?
    let meta:meta
}

struct AdvProfileData:Codable {
    let id:Int?
    let name:String?
    let email:String?
    let phone:String?
    let gender:String?
    let nationality:String?
    let age:String?
    let date_of_birth:String?
    let degree:String?
    let current_job:String?
    let social_status:String?
    let country_of_residence:String?
    let city_of_residence:String?
    let biography:String?
    let means_of_communication:String?
    let account_status:String?
    let photo:String?
    let status:String?
    let Wallet:String?
    
}
