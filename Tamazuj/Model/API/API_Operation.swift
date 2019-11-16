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
    
    // get consaltations
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
    
    
    // get All Consaltants
    
    class func getAllConsaltants(completion:@escaping (_ error:Error?,_ result:Consaltant?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        Alamofire.request(URLs.allConsultants, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
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
    // langugePost
    
    class func langugePost(completion:@escaping (_ error:Error?,_ result:Categories?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        Alamofire.request(URLs.allConsultants, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            switch response.result
            {
            case .success(let value):
                do{
                    
                    let data = try JSONDecoder().decode(Categories.self, from: response.data!)
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
    
    // askConsaltation
    class func askConsalt(communication:String, problem:String, time:Int, categoryId:Int, consultantId:Int, subCategoryId:Int?, status:Int?, completion:@escaping (_ error:Error?,_ result:askConsaltation?)->Void) {
        let header : HTTPHeaders = [
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImM2OTMxZDNkM2U3ZTViYzEwZDg0NDhmNDBlODQ3NTBmYWRmNGI5MTNmODA5NGQ2NmM1ZjhlMDAwYjdmYzgxM2MwODNmZDdjNGRhMjk4MzczIn0.eyJhdWQiOiIxIiwianRpIjoiYzY5MzFkM2QzZTdlNWJjMTBkODQ0OGY0MGU4NDc1MGZhZGY0YjkxM2Y4MDk0ZDY2YzVmOGUwMDBiN2ZjODEzYzA4M2ZkN2M0ZGEyOTgzNzMiLCJpYXQiOjE1Njc5OTE0NDcsIm5iZiI6MTU2Nzk5MTQ0NywiZXhwIjoxNTk5NjEzODQ3LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.Tfw3ex_BnGdr26Vr4U9X2jcsBa2kKddf8xf-Go0kALnQn1PJpqJuXoxou9WjRtODtRUDvwPoW3U4vn0EpTzZVU6udBxi9J7MaiDqKL3QTlt1OHLoby9T8pSoHMl0PMTlfg28mSthoAf8O0jijaO4Nb1_btKzcTS5-dro2g_jATTmw_RuVQGsG1nXgHvUm6H3hlQyA8WNA17OraOUzOk8oadTXDcT5X7aO5avk8skxLH_rA9-4FfgyzVY_HGSxFmbva3LJ0KCVkXWt9IbkdssBd2L3f0kkc8UkuC3tL5SioG_IjaO1lkmdL6bR_LdD9gELe1V9u1aJR6wab3LjrEh1zcXVaiJfEUVwJuMNs3PQ6-BaUVbcKQTo98MtrgmnoUGNCkBcFqINPIBxiVo3EfK_pajuHpQx6X83Gp4XakXqG6lu4hyPRWyEUvJXeJPM6t3ElAs6jffbnOz9p3sD53NtCpbKeC4v7LVcwxfGTYY4cjei0ShJyhsxPT05Lx6JZ564Rm4QTRsMaSwr262y1X6pe0vMGBk4TcA5FZ5IbbzD3-pmxE9H-INiLf2kpMX93WH6cd1vei16mvjcO8IGyR3bI2_omKPHmRD3qxAYxavMlpStVR7UAA35zBuS5eVqIJne4xP6f0Ekl9q9doIhBhz9LgmuCJ1_jyoXOgZsYSgDbU)",
            "lang":"ar"]
        
        let parameters  : Parameters = [
            "means_of_communication": "vedio",
            "summary_problem": "problem",
            "session_time_id": "30",
            "category_id": "1",
            "consultant_id": "1",
            "sub_category_id": "1",
            "status":4]
        
//        let parameters  : Parameters = [
//            "means_of_communication": "\(communication)",
//            "summary_problem": "\(problem)",
//            "session_time_id": "\(time)",
//            "category_id": "\(categoryId)",
//            "consultant_id": "\(consultantId)",
//            "sub_category_id": "\(subCategoryId)",
//            "status":4]
//
        
        Alamofire.request(URLs.askConsultation, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header).responseJSON { (response) in

//            print("medomedo",response.value)
            
            switch response.result
            {
                
            case .success(let value):
                do{
                    
                    let data = try JSONDecoder().decode(askConsaltation.self, from: response.data!)
                    completion(nil,data)
                    
                }catch{
                    print(error)
                    print("that's the error up askConsaltation")
                    completion(error,nil)
                    
                }
            case .failure(let error):
                print(error)
                completion(error,nil)
            }
            
            
        }
        
    }
    

}

