//
//  home.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 01/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation

struct Home: Codable {
    var bestRating : [BestRating]?
    var category : [Category]?
    var bestConsultant : [BestConsultant]?
    var message : String?
    var status : Int?
}

struct BestRating  : Codable {
    var id: Int?
    var name: String?
    var email : String?
    var phone : String?
    var category : [Ctgory]?
    var photo : String?
    var biography : String?
    var rating : Int?
    
    //    var sup_category : String?
    
    //  var nationality, workStatus: String
    //  var socialStatus: JSONNull?
    //  var educationalStatus: String
    //  var status, dateOfBirth: String
    
    struct Ctgory: Codable {
        var id: Int?
        var name_en: String?
        var name_ar : String?
        var created_at: String?
        var updated_at: String?
        
        
    }
}
protocol PassData {
    func Data(Category :Category.Consultant)
}

struct Category : Codable {
    var id: Int?
    var name_en: String?
    var name_ar : String?
    var image : String?
    var consultant : [Consultant]?
    var sup_category: [sup_category]?
    
    struct Consultant : Codable {
        var nationality : String?
        var id: Int?
        var name: String?
        var email : String?
        var phone : String?
        var photo : String?
        var biography : String?
        var country_of_residence : String?
    }
}
struct BestConsultant : Codable {
    var id: Int?
    var name: String?
    var email : String?
    var phone : String?
    var photo : String?
    var category : [category]?
    
    struct category : Codable {
        var id : Int?
        var name_en : String?
        var name_ar : String?
        var image : String?
    }

    
}

struct ActivateCode : Codable {
    var token: String?
    var message: String?
    var status: Int?

}