//
//  MyConsultion.swift
//  Tamazuj
//
//  Created by osama abu dahi on 17/11/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//


/*


"id": 1,
"name": "test",
"photo": "http://salahalimohamed.website/tmajog/public/admin/img/setting/d0405c06-e028-4a47-9fa3-35f29ba74ca0.jpg",
"category": [],

 */
import Foundation

struct MyConsultation:Codable{
    var data:[MyCon]
}


struct MyCon: Codable {
    var name:String?
    var photo:String?
    var category : [Ctg]?
   
   
}
struct Ctg: Codable {
    
    var name_en: String?
    var name_ar : String?
    
    
    
}
