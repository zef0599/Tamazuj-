//
//  adv_operation.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 18/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
import Alamofire
import Firebase



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
    var price : Int?
    var created_at : String?
    var updated_at : String? 
}

struct Cancellation : Codable{
    var status : Int?
    var message : String?
}
class advOprition{
    
//    InstanceID.instanceID().instanceID { (result, error) in
//    if let error = error {
//
//    print("Error fetching remote instance ID: \(error)")
//    } else if let result = result {
//    print("Remote instance ID token: \(result.token)")
//    //                self.instanceIDTokenMessage.text  = "Remote InstanceID token: \(result.token)"
//    }
//    }
    
    
        class func advhome(completion:@escaping (_ error:Error?,_ result:AdvHome?)->Void){
//            let url = URL(string:"http://salahalimohamed.website/tmajog")!
            
            let headers : HTTPHeaders = [
                "lang" : "ar",
                "Authorization" : "Bearer \(helper.getUserToken()!)"
                
                
                
            ]
            Alamofire.request(API.advhome, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers)
                .responseJSON { (response) in
//                    print("qqqqqqq",response.value)
                    do {
                        let data = try JSONDecoder().decode(AdvHome.self, from: response.data!)
                        completion(nil,data)
                        print("111111",data)
                    }catch{
                        print("Error")
                        completion(error,nil)
                    }
                    
            }}
    // MARK:- cancellation consultation
    class func cancellation(id : Int,handler : @escaping ( _ error : Error?, _ ruselt : Cancellation?)-> Void){
        let headers : HTTPHeaders = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"
        ]
                                                            
        Alamofire.request(API.cancellation+"\(id)/cancellation", method: .post, parameters: nil, headers: headers)
            .responseJSON { (response) in
                //                    print("hhhhhhh",response.result.value)
                do{
                    let data = try JSONDecoder().decode(Cancellation.self, from: response.data!)
                    //                    print("ffffffff",data)
                    handler(nil,data)
                    
                }catch{
                    print("Error")
                    handler(error,nil)
                }
                
                
        }
        
    }
    
    
    // MARK:- show single consultation
    class func showsingleconsultation(id : Int,handler : @escaping ( _ error : Error?, _ ruselt : Showsingleconsultation?)-> Void){
        let headers : HTTPHeaders = [
            "Authorization": "Bearer \(helper.getUserToken()!)" ,
            "lang":"ar"
        ]
        Alamofire.request(API.showsingleconsultation+"\(id)", method: .post, parameters: nil, headers: headers)
            .responseJSON { (response) in
                //                    print("hhhhhhh",response.result.value)
                do{
                    var data = try JSONDecoder().decode(Showsingleconsultation.self, from: response.data!)
                    //                    print("ffffffff",data)
                    handler(nil,data)
                    
                }catch{
                    print("Error")
                    handler(error,nil)
                }
                
                
        }
        
    }
    
    
    class func getconsultation(Authorization:String, lang:String,completion:@escaping ( ConsultationRequset? , _ error:Error?)->Void){
        let header : HTTPHeaders = [
            "Authorization" : "Bearer \(helper.getUserToken()!)",
            "lang":"ar"
            //            "Content-Type":"application/x-www-form-urlencoded"
        ]
        
        Alamofire.request(URLs.Adcon , method: .get, parameters: nil,encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                // print("hhhhhhhhhhhh",response.data?.debugDescription )
                
                
                do {
                    let data = try JSONDecoder().decode(ConsultationRequset.self, from: response.data!)
                    completion(data,nil)
                    
                    
                }catch let erre1{
                    print("Error",erre1.localizedDescription)
                    completion(nil,erre1)
                }
                
        }
    }
    
}

//advOprition.showsingleconsultation(id: 8) { (error, result) in
//    //            self.showIndeterminateHUD()
//    if let result = result , result.meta?.status == 1{
//        print("qqqqqqqqqqq",result.data?.consultant_id)
//
//    }else{
//
//    }
//}

struct Showsingleconsultation : Codable{
    var data : data?
    var meta : meta?
    
    struct data : Codable{
        var id : Int?
        var status : String?
        var session_time : session_time?
        var consultant_id : consultant_id?
        var user : user?
    }
    
    struct session_time : Codable {
        var id : Int?
        var time : String?
        var price : String?
        var created_at : String?
        var updated_at : String?
    }
    struct consultant_id: Codable {
        var id : Int?
        var email : String?
        var phone : String?
        var photo : String?
        var name : String?

    }
    struct user:Codable {
        var id : Int?
        var email : String?
        var phone : String?
        var photo : String?
        var name : String?
    }
    struct meta : Codable{
        var message : String?
        var status : Int?
    }
}

