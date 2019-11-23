//
//  Search.swift
//  Tamazuj
//
//  Created by osama abu dahi on 13/11/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
/*
 "id": 2,
 "name": "mahmoud zo",
 "account_status": "1",
 "category": [
     {
     "id": 1,
     "name_en": "Psychological counseling",
     "name_ar": "استشارات نفسية",
     "image": "leadership.png",
     "created_at": "2019-08-27 01:22:49",
     "updated_at": "2019-10-28 05:37:44",
     "deleted_at": null
     }
 ],
 */


/*struct searchData:Codable {
    let  data:[data]?
    

struct data:Codable {
    let name:String?}
//   let category:Category
//    let id:Int?
//}
//    struct category:Codable {
//        var name_ar:String?
//        var name_en:String?
//
//
//    }
}

*/
struct searchModel: Codable {
    
    var data : [searchdata]?
    var photo:String?
}
struct searchdata : Codable {
    var name: String?
    var category : [category]?
    
    struct category : Codable {
     
        var name_en: String?
        var name_ar : String?
        
    }
}

