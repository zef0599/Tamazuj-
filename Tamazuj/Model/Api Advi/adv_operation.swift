//
//  adv_operation.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 18/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
import Alamofire

struct AdvHome : Codable {
    var data : [AdvdataHome]?
//    var links : []?
//    var meta : []?
    
}
struct AdvdataHome : Codable {
    var id : Int?
    var means_of_communication : String?
    var summary_problem : String?
//    var rating : Int?
    var status : String?
    var session_time : session_time?
//    var start_session :
//    var end_session
//    var note
    var category_id : category_id?
    
}
struct category_id : Codable {
    var id : Int?
    var name_ar : String?
    var name_en : String?
    var image : String?
}
struct session_time : Codable {
    var id : Int?
    var time : String?
    var price : String?
    var created_at : String?
    var updated_at : String? 
}

struct Cancellation : Codable{
    var status : Int?
    var message : String?
}

class advOprition{
    
    
        class func advhome(completion:@escaping (_ error:Error?,_ result:AdvHome?)->Void){
            let url = URL(string:"http://salahalimohamed.website/tmajog/api/v1/consultant/home")!
            
            let headers : HTTPHeaders = [
                "lang" : "ar",
                "Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc0Y2JiYWJmMTIxNzcwNjQ2MDc5NzdiMDMzN2EzMTQ4ZTRlOTk5MTU0ZDkyMTE5YzY4ZDJhMTRiYWI1NDU3MjAzYTdhY2M3MTNlZDZiNjhkIn0.eyJhdWQiOiIxIiwianRpIjoiNzRjYmJhYmYxMjE3NzA2NDYwNzk3N2IwMzM3YTMxNDhlNGU5OTkxNTRkOTIxMTljNjhkMmExNGJhYjU0NTcyMDNhN2FjYzcxM2VkNmI2OGQiLCJpYXQiOjE1NzEzNTIxNDYsIm5iZiI6MTU3MTM1MjE0NiwiZXhwIjoxNjAyOTc0NTQ2LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.ndTix6e7KokeOJL6SypCbADnezOS3MyulgmRgY5ZCyh1aarKm0jrXkC2C63azOuVJoOuGmPtPuD9mv9D57TicVkYGCIKiJ42TVWuO7Xz__siJNoMADzTGbim6rVg0kLzgGfyUQbqBsNopcrfzolAv9XdIWloP0Gv5ZZpxz9q6_FaI0GxHdsguePbEBgqHD3F39GtyNFAFzwCdOwC4y72QD7ThsB7kIoxPO6VD1raM25ekoysMOIHHl8P-oNQFnQAjM0EzA9Mp53Ecq4GA5mlY3pZwe6wz9yLaPxZRhGvC3u_ztiLfMp6BaUc3Oz5zAfva-LkzMoF-C2IWCk2t_s5oTDcP-QdkRsry-X87OnkbTwKoJW8AabJzkZTGJahEs8qPavXhc-c1oEHMsKntaL2mDNuF2p5PlrnIRYDa3gCPNPiRu_rLzAUWiWRg79YRIFcIYLS6Kn0O5qbl2uUvqqk_EMmUCJYIRAFan5WPUfdb6pJgd_vZ12Sk8anKydnnCfDfGaGbbl3DFB-ZWLYMjadpV2LGG8kvpoj0AqARn7rCm_I7WhD3M5OBbGCmu0hXuxXuCO0ceE0L0SE-VYsm0TIk0JHTqV3VeripQAdwV4odPduIMTd0G8w3USx-A3Qd5g2nODetRu-2z-NyLZBi5DF4bSgQRy8a-tlDa6LbGKKRbA"
            ]
            Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers)
                .responseJSON { (response) in
//                        print(response.result.value)
                    do {
                        let data = try JSONDecoder().decode(AdvHome.self, from: response.data!)
                        completion(nil,data)
                    }catch{
                        print("Error")
                        completion(error,nil)
                    }
                    
            }}
    // MARK:- cancellation
    class func cancellation(id : Int,handler : @escaping ( _ error : Error?, _ ruselt : Cancellation?)-> Void){
        let headers : HTTPHeaders = [
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc0Y2JiYWJmMTIxNzcwNjQ2MDc5NzdiMDMzN2EzMTQ4ZTRlOTk5MTU0ZDkyMTE5YzY4ZDJhMTRiYWI1NDU3MjAzYTdhY2M3MTNlZDZiNjhkIn0.eyJhdWQiOiIxIiwianRpIjoiNzRjYmJhYmYxMjE3NzA2NDYwNzk3N2IwMzM3YTMxNDhlNGU5OTkxNTRkOTIxMTljNjhkMmExNGJhYjU0NTcyMDNhN2FjYzcxM2VkNmI2OGQiLCJpYXQiOjE1NzEzNTIxNDYsIm5iZiI6MTU3MTM1MjE0NiwiZXhwIjoxNjAyOTc0NTQ2LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.ndTix6e7KokeOJL6SypCbADnezOS3MyulgmRgY5ZCyh1aarKm0jrXkC2C63azOuVJoOuGmPtPuD9mv9D57TicVkYGCIKiJ42TVWuO7Xz__siJNoMADzTGbim6rVg0kLzgGfyUQbqBsNopcrfzolAv9XdIWloP0Gv5ZZpxz9q6_FaI0GxHdsguePbEBgqHD3F39GtyNFAFzwCdOwC4y72QD7ThsB7kIoxPO6VD1raM25ekoysMOIHHl8P-oNQFnQAjM0EzA9Mp53Ecq4GA5mlY3pZwe6wz9yLaPxZRhGvC3u_ztiLfMp6BaUc3Oz5zAfva-LkzMoF-C2IWCk2t_s5oTDcP-QdkRsry-X87OnkbTwKoJW8AabJzkZTGJahEs8qPavXhc-c1oEHMsKntaL2mDNuF2p5PlrnIRYDa3gCPNPiRu_rLzAUWiWRg79YRIFcIYLS6Kn0O5qbl2uUvqqk_EMmUCJYIRAFan5WPUfdb6pJgd_vZ12Sk8anKydnnCfDfGaGbbl3DFB-ZWLYMjadpV2LGG8kvpoj0AqARn7rCm_I7WhD3M5OBbGCmu0hXuxXuCO0ceE0L0SE-VYsm0TIk0JHTqV3VeripQAdwV4odPduIMTd0G8w3USx-A3Qd5g2nODetRu-2z-NyLZBi5DF4bSgQRy8a-tlDa6LbGKKRbA",
            "lang":"ar"
        ]
        Alamofire.request("http://salahalimohamed.website/tmajog/api/v1/consultant/consultation/\(id)/cancellation", method: .post, parameters: nil, headers: headers)
            .responseJSON { (response) in
                //                    print("hhhhhhh",response.result.value)
                do{
                    var data = try JSONDecoder().decode(Cancellation.self, from: response.data!)
                    //                    print("ffffffff",data)
                    handler(nil,data)
                    
                }catch{
                    handler(error,nil)
                }
                
                
        }
        
    }
        
    
    
    
}
