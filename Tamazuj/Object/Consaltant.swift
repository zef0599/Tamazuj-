//
//  Consaltant.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/7/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
struct Consaltant:Codable {
    
    enum CodingKeys: String, CodingKey {
        case  meta
        case  ConsaltantData = "data"
    }
    var ConsaltantData:[ConsaltantData]?
    var meta:meta?
}

struct ConsaltantData:Codable {
    var id:Int?
    var name:String?
//    var email:String?
    var phone:String?
//    var gender:String?
//    var nationality:String?
//    var age:String?
//    var date_of_birth:String?
//    var degree:String?
//    var current_job:String?
//    var social_status:String?
//    var country_of_residence:String?
//    var city_of_residence:String?
//    var educational_status:String?
    var biography:String?
//    var means_of_communication:String?
//    var account_status:String?
    var photo:String?
//    var category:[category]?
//    var rating:Int?
    
}
struct category:Codable {
    var id:Int?
    var name_en:String?
    var name_ar:String?
    var image:String?

}
