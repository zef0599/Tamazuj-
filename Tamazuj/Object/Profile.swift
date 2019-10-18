//
//  Profile.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/4/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
struct Profile:Codable {
    let data:ProfileData?
    let meta:meta
}

struct ProfileData:Codable {
    let id:Int?
    let name:String?
    let email:String?
    let phone:String?
    let gender:String?
    let nationality:String?
    let work_status:String?
    let social_status:String?
    let educational_status:String?
    let photo:String?
    let status:String?
    let date_of_birth:String?

}
