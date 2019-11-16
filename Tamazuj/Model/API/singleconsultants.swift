//
//  singleconsultants.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 15/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
import Alamofire


// MARK:- Single Consultants
class oprition {
    class func singleconsultants(id : Int,handler : @escaping ( _ error : Error?, _ ruselt : Singleconsultants<Alldata>?)-> Void){
        let headers : HTTPHeaders = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"
        ]
        Alamofire.request("http://salahalimohamed.website/tmajog/api/v1/consultants/\(id)", method: .post, parameters: nil, headers: headers)
            .responseJSON { (response) in
//                         print(response.result.value)
                do{
                    var data = try JSONDecoder().decode(Singleconsultants<Alldata>.self, from: response.data!)
                    handler(nil,data)
//                    print(data.data)
//                     print("category",data.data?.category)
//                    print("languages",data.data?.languages)
                }catch{
                    handler(error,nil)
                }
                
             
        }
    
    }
    class func feedback (id : Int , handler: @escaping (_ error:Error?,_ ruselt: FeedBack?)-> Void){
        let headers : HTTPHeaders = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"
        ]
        Alamofire.request("http://salahalimohamed.website/tmajog/api/v1/consultants/\(id)/feedback", method: .post, parameters: nil, headers: headers)
            .responseJSON { (response) in
//                    print(response.result.value)
                do{
                    var data = try JSONDecoder().decode(FeedBack.self, from: response.data!)
                    handler(nil,data)
//                    print("hhhhhhhhhhhhhh\(data)")
                    //                     print("category",data.data?.category)
                    //                    print("languages",data.data?.languages)
                }catch{
                    handler(error,nil)
                }
                
                
        }
    }

}

