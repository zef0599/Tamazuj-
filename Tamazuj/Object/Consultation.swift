//
//  Consultation.swift
//  Tamazuj
//
//  Created by osama abu dahi on 14/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
/*
  "data": {
        "id": 21,
        "means_of_communication": "video",
        "summary_problem": "test test",
        "rating": "4",
        "status": "الاستشارة مكتملة",
        "session_time": {
             "id": 1,
             "time": "30",
             "price": "50.00",
             "created_at": "2019-09-18 19:05:17",
             "updated_at": "2019-09-18 19:05:17",
             "deleted_at": null
             },
        "start_session": "2019-09-28 15:08:17",
        "end_session": "2019-09-28 15:08:17",
        "category_id": {
             "id": 1,
             "name_ar": "استشارات نفسية",
             "name_en": "Psychological counseling",
             "image": "http://salahalimohamed.website/tmajog/public/admin/img/setting/no-image.jpg",
*/


struct ConsultationRequset:Codable {
    var data : [ConsultationData]?
    
    
    
    struct ConsultationData:Codable {
        
        
        var id:Int?
        var means_of_communication:String?
        var rating:String?
        var note:String?
        var summary_problem:String?
        var status:String?
        var session_time:session_time?
        var consultant_id:consultant_id?
        
        struct session_time:Codable {
            var id:Int?
            var time:String?
            var price:Int?
        }
        
        struct consultant_id:Codable{
            var name:String?
            var photo:String?
        }
        
    }
    
    
}

struct updateConsultation:Codable {
    var data : ConsultationData?
    
    
    
    struct ConsultationData:Codable {
        var id:Int?
        var means_of_communication:String?
        var rating:String?
        var note:String?
        
    }
    
    
}
