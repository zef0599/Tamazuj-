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
        var type : Int?
        var message : String?
        var id_consulting : Int?
        var seen : Int?
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
                                print(response.result.value)
            
            
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
                    print("QQQQQQQQQQ",response.result.value)
                
                
                do {
                    let data = try JSONDecoder().decode(DeleteAllNotifiction.self, from: response.data!)
                    completion(nil,data)
                }catch{
                    print("Error")
                    completion(error,nil)
                }
                
        }}
    //1/change
    //TODO: userchangeSeen
    static func userchangeSeen(id : Int,completion:@escaping (_ error:Error?,_ result:ChangeSeen?)->Void){
        let headers : HTTPHeaders = [
            "lang" : "ar",
            "Authorization" : "Bearer \(helper.getUserToken()!)"
        ]
        Alamofire.request(URLs.userchangeSeen+"\(id)/change", method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
                //                        print(response.result.value)
                
                
                do {
                    let data = try JSONDecoder().decode(ChangeSeen.self, from: response.data!)
                    completion(nil,data)
                }catch{
                    print("Error")
                    completion(error,nil)
                }
                
        }}
    //TODO: advchangeSeen
    static func advchangeSeen(id : Int,completion:@escaping (_ error:Error?,_ result:ChangeSeen?)->Void){
        let headers : HTTPHeaders = [
            "lang" : "ar",
            "Authorization" : "Bearer \(helper.getUserToken()!)"
        ]
        Alamofire.request(URLs.advchangeSeen+"\(id)/change", method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
                
                print(response.result.value)
                
                
                do {
                    let data = try JSONDecoder().decode(ChangeSeen.self, from: response.data!)
                    completion(nil,data)
                }catch{
                    print("Error")
                    completion(error,nil)
                }
                
        }}
    
    
}
struct ChangeSeen : Codable {
    var message : String?
    var status : Int?
}


struct DeleteAllNotifiction : Codable {
    var message : String?
    var status : Int?
}
