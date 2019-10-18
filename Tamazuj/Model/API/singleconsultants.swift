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
            "Authorization": "Bearer \(helper.getApiToken()!)",
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
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImM2OTMxZDNkM2U3ZTViYzEwZDg0NDhmNDBlODQ3NTBmYWRmNGI5MTNmODA5NGQ2NmM1ZjhlMDAwYjdmYzgxM2MwODNmZDdjNGRhMjk4MzczIn0.eyJhdWQiOiIxIiwianRpIjoiYzY5MzFkM2QzZTdlNWJjMTBkODQ0OGY0MGU4NDc1MGZhZGY0YjkxM2Y4MDk0ZDY2YzVmOGUwMDBiN2ZjODEzYzA4M2ZkN2M0ZGEyOTgzNzMiLCJpYXQiOjE1Njc5OTE0NDcsIm5iZiI6MTU2Nzk5MTQ0NywiZXhwIjoxNTk5NjEzODQ3LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.Tfw3ex_BnGdr26Vr4U9X2jcsBa2kKddf8xf-Go0kALnQn1PJpqJuXoxou9WjRtODtRUDvwPoW3U4vn0EpTzZVU6udBxi9J7MaiDqKL3QTlt1OHLoby9T8pSoHMl0PMTlfg28mSthoAf8O0jijaO4Nb1_btKzcTS5-dro2g_jATTmw_RuVQGsG1nXgHvUm6H3hlQyA8WNA17OraOUzOk8oadTXDcT5X7aO5avk8skxLH_rA9-4FfgyzVY_HGSxFmbva3LJ0KCVkXWt9IbkdssBd2L3f0kkc8UkuC3tL5SioG_IjaO1lkmdL6bR_LdD9gELe1V9u1aJR6wab3LjrEh1zcXVaiJfEUVwJuMNs3PQ6-BaUVbcKQTo98MtrgmnoUGNCkBcFqINPIBxiVo3EfK_pajuHpQx6X83Gp4XakXqG6lu4hyPRWyEUvJXeJPM6t3ElAs6jffbnOz9p3sD53NtCpbKeC4v7LVcwxfGTYY4cjei0ShJyhsxPT05Lx6JZ564Rm4QTRsMaSwr262y1X6pe0vMGBk4TcA5FZ5IbbzD3-pmxE9H-INiLf2kpMX93WH6cd1vei16mvjcO8IGyR3bI2_omKPHmRD3qxAYxavMlpStVR7UAA35zBuS5eVqIJne4xP6f0Ekl9q9doIhBhz9LgmuCJ1_jyoXOgZsYSgDbU",
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

