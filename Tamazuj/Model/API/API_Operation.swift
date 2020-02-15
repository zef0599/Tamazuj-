//
//  API_Operation.swift
//  Tamazuj
//
//  Created by osama abu dahi on 30/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
import Alamofire

struct testSc : Codable {
    var data : [dataT]
    var meta : meta
}
struct dataT :Codable {
    var id : Int
    
}

class Operation {
    //MARK: - Get Category
    
    class func testS(completion:@escaping (_ error:Error?,_ result:testSc?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        
        Alamofire.request(API.search, method : .post, parameters: nil,headers : header)
            .responseJSON { (response) in
                
                print("response.result",response.result)
                switch response.result
                {
                case .success(_):
                    do{
                        let data = try JSONDecoder().decode(testSc.self, from: response.data!)
//                        if let categories = data.data {
                completion(nil,data)
//                        }
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
                     //   print(masseg)
                        
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

        // get Single

        class func getSingle(id:Int, completion:@escaping (_ error:Error?,_ result:Single?)->Void){
            
            let header = [
                "Authorization": "Bearer \(helper.getUserToken()!)",
                "lang":"ar"]
            Alamofire.request(URLs.Consaltant+"/\(id)", method: .post, parameters: nil, encoding: URLEncoding.queryString, headers: header).responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        let data = try JSONDecoder().decode(Single.self, from: response.data!)
                        completion(nil,data)
    //                    print("single data :",json)
                        print(data)
    //                    print("single data :",data)
                        
                    }catch{
                        print(error.localizedDescription)
                        print("that's the error up profile")
                        completion(error,nil)
                        
                    }
                case .failure(let error):
                    print(error)
                    completion(error,nil)
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
    class func changeProfile(Authorization:String, lang:String, name:String, gender:String, nationality:String, work_status:String, social_status:String, educational_status:String, photo:String, fcm_token:String, os_type:Int, date_of_birth:String, completion:@escaping (_ error:Error?,_ result:Profile?)->Void){
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
            "lang":"ar"
            //            "Content-Type":"application/x-www-form-urlencoded"
        ]
        
        Alamofire.request(API.consultation, method: .get, parameters: nil,encoding: URLEncoding.default, headers: header)
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
            
            print("hhhhhhh",response.value)
            
            switch response.result
            {
            case .success:
                do{
                    let data = try JSONDecoder().decode(Consaltant.self, from: response.data!)
                    print("wwww",data)
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
    class func askConsalt(communication:String, problem:String, time:Int, categoryId:Int, consultantId:Int, subCategoryId:String?, status:Int?, completion:@escaping (_ error:Error?,_ result:askConsaltation?)->Void) {
        let header:HTTPHeaders = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        
        let parameters = [
            "means_of_communication":" \(communication)",
            "summary_problem": "\(problem)",
            "session_time_id": "\(time)",
            "category_id":"\(categoryId)",
            "consultant_id":"\(consultantId)",
            "sub_category_id": subCategoryId ?? "",
            "status":"4"] as [String : Any]
        Alamofire.request(URLs.askConsultation, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            switch response.result
            {
            case .success(let value):
                do{
                    print("sucess the ask consaltation")
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
    
    class func getCon(completion:@escaping (_ error:Error?,_ result:MyConsultation?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        Alamofire.request(API.bestReting, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            switch response.result
            {
            case .success(let value):
                do{
                    let data = try JSONDecoder().decode(MyConsultation.self, from: response.data!)
                    
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
    class func search (completion:@escaping (_ error:Error?,_ result:searchModel?)->Void) {
        let header =  [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        // let parameters = ["name": textSearch]
//        var parameters : Parameters = ["name":""]
        //     parameters: parameters  textSearch:String?   parameters: parameters,
        
        Alamofire.request(API.search, method: .post,parameters: nil, headers: header).responseJSON { (response) in
            print("response.result",response.result)
            
            switch response.result
            {
            case .success(_):
                do{
                    
                    let data = try JSONDecoder().decode(searchModel.self, from: response.data!)
                    completion(nil,data)
                }
                catch {
                    completion(error,nil)
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(error,nil)
            }
            
            
        }
        
    }
    
    class func getbestCon(completion:@escaping (_ error:Error?,_ result:MyConsultation?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        Alamofire.request(API.bestCon, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            switch response.result
            {
            case .success(let value):
                do{
                    let data = try JSONDecoder().decode(MyConsultation.self, from: response.data!)
                    
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
    
    class func filter0(completion:@escaping (_ error:Error?,_ result:MyConsultation?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        Alamofire.request(API.filter0, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            switch response.result
            {
            case .success(let value):
                do{
                    let data = try JSONDecoder().decode(MyConsultation.self, from: response.data!)
                    
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
    class func filter1(completion:@escaping (_ error:Error?,_ result:MyConsultation?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        Alamofire.request(API.filter1 , method: .post, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            switch response.result
            {
            case .success(let value):
                do{
                    let data = try JSONDecoder().decode(MyConsultation.self, from: response.data!)
                    
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
    class func filter2(completion:@escaping (_ error:Error?,_ result:MyConsultation?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        Alamofire.request(API.filter2, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            print("responseDATAT",response.data)
            switch response.result
            {
            case .success(let value):
                do{
                    let data = try JSONDecoder().decode(MyConsultation.self, from: response.data!)
                    
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
    
    class func setting(completion:@escaping (_ error:Error?,_ result:settingData?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        Alamofire.request(API.sitting, method: .post, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            switch response.result
            {
            case .success(let value):
                do{
                    let data = try JSONDecoder().decode(settingData.self, from: response.data!)
                    
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
    
    //MARK: - Get checkout id
    
    class func geCheckout(amount:Int, completion:@escaping (_ error:Error?,_ result:Checkout?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        let parameters = ["amount":"100"] as [String : Any]

        Alamofire.request(URLs.checkout, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        let data = try JSONDecoder().decode(Checkout.self, from: response.data!)
                            completion(nil,data)
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
    // payment status
    class func gePaymentStatus(amount:Int, completion:@escaping (_ error:Error?,_ result:PaymentStatus?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        let parameters = ["amount":"100"] as [String : Any]
        
        Alamofire.request(URLs.paymentStatus, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        let data = try JSONDecoder().decode(PaymentStatus.self, from: response.data!)
                        completion(nil,data)
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

    // bill
    /**
     Frame and construction style.
     - price: For price.
     - consulting_id: the id of the consaltation .
     - payment_method: payment_method (visa-mada..).
     */

    class func bill(price:Int, consulting_id:Int, payment_method:String, completion:@escaping (_ error:Error?,_ result:Bill?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        let parameters = ["price":price,
                          "consulting_id":consulting_id,
                          "payment_method":"visa"] as [String : Any]
        
        Alamofire.request(URLs.bill, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        let data = try JSONDecoder().decode(Bill.self, from: response.data!)
                        completion(nil,data)
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
    //ConsultationRequset
    // Rating update
    /**
     Frame and construction style.
     - price: For price.
     - consulting_id: the id of the consaltation .
     - payment_method: payment_method (visa-mada..).
     */
    
    class func Rating(rating:String, note:String,consaltationId:Int, completion:@escaping (_ error:Error?,_ result:updateConsultation?)->Void){
        let header = [
            "Authorization": "Bearer \(helper.getUserToken()!)",
            "lang":"ar"]
        let parameters = ["rating":rating,
                          "note":note] as [String : Any]
        let ratingURL = URLs.Rating+"\(consaltationId)/update"
        Alamofire.request(ratingURL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header)
            .responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    do{
                        let data = try JSONDecoder().decode(updateConsultation.self, from: response.data!)
                        completion(nil,data)
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

}

