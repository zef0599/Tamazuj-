//
//  SingleConsultantS.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 15/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation


// MARK:- Model Single consultants

struct Singleconsultants <T : Codable>: Codable {
    
    var data : Alldata?
}
struct Alldata : Codable {
    var id: Int?
    var rating : Int?
    var name: String?
    var email : String?
    var phone : String?
    var photo : String?
    var gender : String?
    var nationality : String?
    var biography : String?
    var city_of_residence : String?
    var means_of_communication : String?
    var category : [category]?
    var languages : [languages]?
    
    struct languages : Codable {
        var id :Int?
        var name_ar : String?
        var name_en : String?
    }
    struct category : Codable {
        var id: Int?
        var name_en: String?
        var name_ar : String?
        var created_at: String?
        var updated_at: String?
        var image : String?
    }
}


//MARK:- FeedBack

struct FeedBack : Codable {
    var data : [dataFedback]?
    var meta : metafedback?
}

struct dataFedback : Codable {
    var feedback :String?
    var ratting : String?
    var name : String?
    var photo : String?
    var time_rating : String?
    var time_minutes : Int?
}
struct metafedback : Codable {
    var message : String?
    var status : Int?
}
