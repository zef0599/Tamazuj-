//
//  AdvisorAPI.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
import Alamofire
extension Operation {
    // MARK: - Advprofile
    // Authorization,lang
    class func advgetProfile(Authorization:String, lang:String,completion:@escaping (_ error:Error?,_ result:AdvProfile?)->Void){
        let header = [
            "Authorization": Authorization,
            "lang":"ar"]
        Alamofire.request(URLs.advProfile, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        let data = try JSONDecoder().decode(AdvProfile.self, from: response.data!)
                        
                        completion(nil,data)
                        
                    }catch{
                        print(error)
                        print("that's the error up profile")
                        completion(error,nil)
                        
                    }
                case .failure(let error):
                    print(error)
                    completion(error,nil)
                }
        }
    }
    
    
    // MARK: -  edite profile
    class func AdvEditeProfile(Authorization:String, lang:String, name:String, gender:String, nationality:String, work_status:String, social_status:String, educational_status:String, photo:String, fcm_token:String, os_type:Int, date_of_birth:String, completion:@escaping (_ error:Error?,_ result:AdvProfile?)->Void){
        let header = [
            "Authorization": Authorization,
            "lang":"ar"]
        
        let parameters = [
            "name":name,
            "age":"18",
            "gender":gender,
            "degree":"BC",
            "biography":"biography",
            "nationality": nationality,
            "current_job":work_status,
            "social_status":social_status,
            "date_of_birth":date_of_birth,
            "city_of_residence":"alex",
            "country_of_residence":1,
            "means_of_communication":"video",
            "fcm_token":"",
            "educational_status":educational_status,
            "photo":"",
            "os_type": os_type ,
            ] as [String : Any]
        
        Alamofire.request(URLs.advUpdateProfile, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        let data = try JSONDecoder().decode(AdvProfile.self, from: response.data!)
                        
                        completion(nil,data)
                        
                    }catch{
                        print(error)
                        print("that's the error up profile")
                        completion(error,nil)
                        
                    }
                case .failure(let error):
                    print(error)
                    completion(error,nil)
                }
        }
    }
    



    
}
