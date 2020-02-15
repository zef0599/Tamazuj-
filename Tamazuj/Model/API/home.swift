//
//  home.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 02/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
import Alamofire


//   MARK:- Home Data
class HomeData {
    class func homedataload(lang : String ,Authorization : String,completion:@escaping (_ error:Error?,_ result:T?)->Void){
        
        let headers : HTTPHeaders = [
            "lang" : lang,
            "Authorization" : Authorization
        ]
        
        Alamofire.request(API.home, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
                //                            print("hhhhhhhhh",response.result.value)
                do {
                    let homedata = try JSONDecoder().decode(T.self, from: response.data!)
                    completion(nil,homedata)
                }catch{
                    print("qqqqqqqq Error")
                    completion(error,nil)
                }
                
        }}
    
    class func home(lang : String ,Authorization : String,completion:@escaping (_ error:Error?,_ result:Home?)->Void){
        
        let headers : HTTPHeaders = [
            "lang" : lang,
            "Authorization" : Authorization
        ]
        
        Alamofire.request(API.home, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
//                            print("hhhhhhhhh",response.result.value)
                do {
                    let homedata = try JSONDecoder().decode(Home.self, from: response.data!)
                    
                    completion(nil,homedata)
                    
                    
                    //                    for i in home{
                    //                        print(i)
                    //                    }
                    //                    if let categories = home {
                    //                        completion(nil,categories)
                    //                    }
                }catch{
                    print("Error")
                    completion(error,nil)
                }
                
        }}
    
    //MARK:- activateCode
    class func activateCode(phone: String,activate: String ,completion:@escaping (_ error:Error?,_ result:ActivateCode?)->Void){

        let headers : HTTPHeaders = [
            "lang" : "ar"
        ]
        let parameters : Parameters = [
            "phone":phone,
            "activate": activate
        ]
        
        Alamofire.request(API.activateCode, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
                //            print(response.result.value)
                do {
                    let activateCod = try JSONDecoder().decode(ActivateCode.self, from: response.data!)
                    completion(nil,activateCod)
                }catch{
                    print("Error")
                    completion(error,nil)
                }
                
        }}
}


