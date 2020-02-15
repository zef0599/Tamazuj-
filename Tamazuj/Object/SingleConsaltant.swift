//
//  SingleConsaltant.swift
//  Tamazuj
//
//  Created by yousef Omar on 2/14/20.
//  Copyright © 2020 Tamazuj. All rights reserved.
//

import Foundation

// get Single test
// get Single test
struct Single:Codable {
    var data: datatestme

}
struct datatestme : Codable {
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var gender: String?
    var nationality: String?
    var nationality_id: String?
    var age: Int?
    var date_of_birth: String?
    var degree: String?
    var current_job: String?
    var social_status: String?
    var country_of_residence: String?
    var city_of_residence: String?
    var biography: String?
    var means_of_communication: String?
    var account_status: String?
    var photo: String?
    var languages: [Language]?
    var category:[datatestme.DataCategory]?
    var sup_category: [datatestme.supCategory]?
    var status:String?
    var cv:String?
    var qualifications:String?
    var proof_of_identity:String?
    var Wallet:Int?
    
    struct supCategory: Codable {
        var id: Int
        var name_ar: String?
        var name_en: String?
        var image: String?
        var category:datatestme.CategoryForSup

    }
    // MARK: - CategoryForSups
        struct CategoryForSup: Codable {
            var id: Int
            var name_ar: String?
            var name_en: String?
            var image: String
            var created_at: String?
            var updated_at: String?
            var deleted_at: String?
            var consultant: [datatestme.Consultant]?
        }
    // MARK: - DataCategory
    struct DataCategory: Codable {
        var id: Int
        var opened:Bool? = false
        var name_ar: String?
        var name_en: String?
        var image: String
        var sup_category: [datatestme.supCategory]?
        var consultant: [datatestme.Consultant]?
        var category: ConsultantCategory?

    }
    // MARK: - Consultant
    struct Consultant: Codable {
        var id: Int?
        var name: String?
        var email: String?
        var phone: String?
        var gender: String?
        var nationality: String?
        var nationality_id: String?
        var age: Int?
        var date_of_birth: String?
        var degree: String?
        var current_job: String?
        var work_status: String?
        var social_status: String?
        var country_of_residence: String?
        var city_of_residence: String?
        var educational_status: String?
        var biography: String?
        var means_of_communication: String?
        var account_status: String?
        var photo: String?
        var languages: [Language]
        var category, sup_category: [ConsultantCategory]
        var status: String?
        var rating: Int?

        
    }
    
}

// MARK: - ConsultantCategory
struct ConsultantCategory: Codable {
    var id: Int
    var nameEn: String?
    var nameAr: String?
    var image: String?
    var createdAt, updatedAt: String?
    var deletedAt: String?
    var categoeyId: Int?

}


// MARK: - Language
struct Language: Codable {
    var id: Int?
    var nameAr: String?
    var nameEn: String?

    
}

