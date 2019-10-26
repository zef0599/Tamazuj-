//
//  API_Operation.swift
//  Tamazuj
//
//  Created by osama abu dahi on 30/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
import Alamofire

class Operation {
    //MARK: - Get Category
    
    class func getCategory(completion:@escaping (_ error:Error?,_ result:Categories?)->Void){
        Alamofire.request(URLs.category, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        let data = try JSONDecoder().decode(Categories.self, from: response.data!)
                        if let categories = data.data {
                            completion(nil,data)
                        }
                    }catch{
                        print(error)
                        print("that's the error up")
                        completion(error,nil)
                        
                    }
                case .failure(let error):
                    print(error)
                    completion(error,nil)
                }
        }
    }
    // MARK: - Login
    
    class func login(email:String,password:String,completion:@escaping ( logIn? , _ error:Error?)->Void){
        let data = [
            "email"    :email,
            "password" : password]
        
        Alamofire.request(API.login, method: .post, parameters: data, encoding: URLEncoding.default)
            .responseJSON { (response) in
                
                switch response.result{
                    
                case.success(let value):
                    do {
                        
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(logIn.self, from: response.data!)
                        
                        
                        let token = data.token
                        print(token)
                        
                        if token != nil {
                          helper.saveUserToken(token: token!)
                            print(token!)
                        }
                        let state = data.status
                        
                        completion(data , nil)
                        
                    }
                    catch let jsonError{
                        print(jsonError)
                        
                    }
                    
                case .failure(let error):
                    completion(nil , error)
                }
                
        }
    }
    
    // MARK: - Register
    
    // name , email , phone , password
    class func Register( name:String, email:String,phone:String, password:String,completion:@escaping ( Ath? , _ error:Error?)->Void){
        
        let data = [
            "name"     : name,
            "email"    : email,
            "phone"    : phone,
            "password" : password
        ]
        
        Alamofire.request(API.Register, method: .post, parameters: data, encoding: URLEncoding.default)
            .responseJSON { (response) in
                
                switch response.result{
                    
                case.success( _):
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(Ath.self, from: response.data!)
                        let masseg = data.message
                        print(masseg)
                        
                        completion(data , nil)
                        
                    }
                    catch let jsonError{
                        print(jsonError)
                        
                        
                    }
                    
                case .failure(let error):
                    print("error")
                    //   completion(nil , error)
                }
                
        }
    }
    
    
    class func updatePasswored(lang : String ,Authorization : String,oldPassword:String,newPass:String , ConfPass:String,
                               completion:@escaping (_ error:Error?,_ result:UpatePass?)->Void){
        
        let headers : HTTPHeaders = [
            "lang" : lang,
            "Authorization" : Authorization
        ]
        
        
        let data = [
            "old_password"       :oldPassword ,
            "new_password"       :newPass ,
            "confirmed_password" : ConfPass
            
        ]
        
        
        Alamofire.request(API.UpdatPass, method: .post, parameters: data, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
                
                switch response.result{
                    
                case.success( _):
                    do {
                        
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(UpatePass.self, from: response.data!)
                        
                        let masseg = data.message
                        print(masseg)
                        
                    }
                    catch let jsonError{
                        print(jsonError)
                        
                    }
                    
                case .failure(let error):
                    print("error")
                    //   completion(nil , error)
                }
                
        }
        
        
    }
    
    // MARK: - profile
    
    // Authorization,lang
    
    class func getProfile(Authorization:String, lang:String,completion:@escaping (_ error:Error?,_ result:Profile?)->Void){
        let header = [
            "Authorization": Authorization,
            "lang":"ar"]
        Alamofire.request(URLs.profile, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        let data = try JSONDecoder().decode(Profile.self, from: response.data!)
                        
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
    class func changeProfile(Authorization:String, lang:String, name:String, gender:String, nationality:Int, work_status:String, social_status:String, educational_status:String, photo:String, fcm_token:String, os_type:Int, date_of_birth:String, completion:@escaping (_ error:Error?,_ result:Profile?)->Void){
        let header = [
            "Authorization": Authorization,
            "lang":"ar"]
        
        let parameters = [
            "name":name,
            "gender":gender,
            "nationality": nationality,
            "work_status":work_status,
            "social_status":social_status,
            "educational_status":educational_status,
            "photo":"",
            "fcm_token":"fghgfghjhg",
            "os_type": os_type ,
            "date_of_birth":date_of_birth
            ] as [String : Any]
        
        Alamofire.request(URLs.updateProfile, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        let data = try JSONDecoder().decode(Profile.self, from: response.data!)
                        
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
    
    // get consaltants
                    
    class func getConsaltants(completion:@escaping (_ error:Error?,_ result:Consaltant?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        Alamofire.request(URLs.Consaltant, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            switch response.result
            {
            case .success(let value):
                do{
                    let data = try JSONDecoder().decode(Consaltant.self, from: response.data!)
                    
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
    
    
    class func getconsultation(Authorization:String, lang:String,completion:@escaping ( ConsultationRequset? , _ error:Error?)->Void){
        let header : HTTPHeaders = [
            "Authorization" : "Bearer \(helper.getUserToken()!)",
            //            "lang":"ar",
            //            "Content-Type":"application/x-www-form-urlencoded"
        ]
        
        Alamofire.request(API.consultation, method: .get, parameters: nil,encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                //                print("hhhhhhhhhhhh",response.data?.debugDescription )
                
                
                do {
                    let mm = try JSONDecoder().decode(ConsultationRequset.self, from: response.data!)
                    print(mm.data)
                    
                    //                    for i in mm.data!{
                    //                        print(i.id!)
                    ////                        for i in i.consultant_id!{
                    ////                            print("hhhhhhhhhhhh",i.name!)
                    ////                        }
                    //
                    //                    }
                    //                    completion(mm , nil)
                }catch let erre1{
                    print("Error",erre1.localizedDescription)
                    completion(nil,erre1)
                }
                
        }
    }
    
    //MARK: logout
    
    class func logout(Authorization:String,completion:@escaping (_ error:Error?,_ result:logOut?)->Void){
        let header = [
            "Authorization": Authorization]
        Alamofire.request(API.logout, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        
                        let data = try JSONDecoder().decode(logOut.self, from: response.data!)
                      //  data.status ==
                        completion(nil,data)
                        
                    }catch{
                        print(error)
                        
                        completion(error,nil)
                        
                    }
                case .failure(let error):
                    print(error)
                    completion(error,nil)
                }
        }
    }
    
    


}

