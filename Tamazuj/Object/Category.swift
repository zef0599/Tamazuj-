//
//  Category.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/29/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//



import Foundation

struct Categories:Codable {
    var data:[data]?
    var meta:meta?

}
struct data:Codable {
    var id:Int?
    var name_ar:String?
    var name_en:String?
    var image:String?
    var opened:Bool? = false
    var consultant : [Category.Consultant]?
    var sup_category: [sup_category]
    
}

    struct sup_category:Codable {
        var id:Int?
        var name_ar:String?
        var name_en:String?
        var image:String?
        var category:category?
        var consultant:[Category.Consultant]?
    }

    struct meta:Codable {
        var message:String?
        var status:Int?

    }





