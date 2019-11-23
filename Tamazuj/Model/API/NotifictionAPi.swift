//
//  NotifictionAPi.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 19/11/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
import Alamofire

struct Notifiction : Codable {
    var data : [Notifiction.data]?
    var meta : Notifiction.meta?
    
    struct data:Codable {
        var id :Int?
        var type : String?
        var message : String?
        var id_consulting : String?
        var seen : String?
        var created : String?
    }
    struct meta:Codable {
        var status :Int?
        var message : String?
    }
}


class APINotifiction{
    
    static func advNotifiction(id : Int,completion:@escaping (_ error:Error?,_ result:Notifiction?)->Void){
        let headers : HTTPHeaders = [
        "lang" : "ar",
        "Authorization" : "Bearer \(helper.getUserToken()!)"
        ]
        Alamofire.request(URLs.advNotifiction+"\(id)", method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers)
        .responseJSON { (response) in
//                                print(response.result.value)
            
            
        do {
        let data = try JSONDecoder().decode(Notifiction.self, from: response.data!)
        completion(nil,data)
        }catch{
        print("Error")
        completion(error,nil)
        }
        
        }}
    
    static func userNotifiction(id : Int,completion:@escaping (_ error:Error?,_ result:Notifiction?)->Void){
        let headers : HTTPHeaders = [
            "lang" : "ar",
            "Authorization" : "Bearer \(helper.getUserToken()!)"
        ]
        Alamofire.request(URLs.userNotifiction+"\(id)", method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
                                        print("9999999999",response.result.value)
                
                
                do {
                    let data = try JSONDecoder().decode(Notifiction.self, from: response.data!)
                    completion(nil,data)
                }catch{
                    print("Error")
                    completion(error,nil)
                }
                
        }}
    

    static func userdeleteAllNotifiction(completion:@escaping (_ error:Error?,_ result:DeleteAllNotifiction?)->Void){
        let headers : HTTPHeaders = [
            "lang" : "ar",
            "Authorization" : "Bearer \(helper.getUserToken()!)"
        ]
        Alamofire.request(URLs.advdeleteAllNotifiction, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
                //                        print(response.result.value)
                
                
                do {
                    let data = try JSONDecoder().decode(DeleteAllNotifiction.self, from: response.data!)
                    completion(nil,data)
                }catch{
                    print("Error")
                    completion(error,nil)
                }
                
        }}
    
    static func advdeleteAllNotifiction(completion:@escaping (_ error:Error?,_ result:DeleteAllNotifiction?)->Void){
        let headers : HTTPHeaders = [
            "lang" : "ar",
            "Authorization" : "Bearer \(helper.getUserToken()!)"
        ]
        Alamofire.request(URLs.advdeleteAllNotifiction, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
                //                        print(response.result.value)
                
                
                do {
                    let data = try JSONDecoder().decode(DeleteAllNotifiction.self, from: response.data!)
                    completion(nil,data)
                }catch{
                    print("Error")
                    completion(error,nil)
                }
                
        }}
    
}
struct DeleteAllNotifiction : Codable {
    var message : String?
    var status : Int?
}
