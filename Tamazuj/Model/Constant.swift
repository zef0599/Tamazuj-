//
//  Constant.swift
//  Tamazuj
//
//  Created by osama abu dahi on 30/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
         //////http://tamazuj.sa/api/v1
 var advURL = "http://tamazuj.sa"



struct API {
    
    // Post (email , password)
//singleconsultants feedback
    static let showallconsultation     = advURL+"/api/v1/consultant/consultation"
    static let showsingleconsultation     = advURL+"/api/v1/consultant/consultation/"
    static let cancellation               = advURL+"/api/v1/consultant/consultation/"
    static let advhome                    = advURL+"/api/v1/consultant/home"
    static let feedback                   = advURL+"/api/v1/consultants/"
    static let singleconsultants          = advURL+"/api/v1/consultants/"
    static let home                       = advURL+"/api/v1/user/home"
    static let login                      = advURL+"/api/v1/user/login"
    static let Register                   = advURL+"/api/v1/user/register"
    static let UpdatPass                  = advURL+"/api/v1/user/updatePassword"
    static let consultation               = advURL+"/api/v1/user/consultation"
//    static let consultations              = advURL+"/api/v1/user/consultation/18"
    static let AdRegister                 = advURL+"/api/v1/consultant/register"
    static let Adlogin                    = advURL+"/api/v1/consultant/login"
    static let activetcodeCons            = advURL+"/api/v1/consultant/activateCode"
    static let logout                     = advURL+"/api/v1/user/logout"
    static let Adupdatpaas                = advURL+"/api/v1/consultant/updatePassword"
    static let Adlogout                   = advURL+"/api/v1/consultant/logout"
    static let search                     = advURL+"/api/v1/search"
    static let bestReting                 = advURL+"/api/v1/user/best-rating"
    static let bestCon                    = advURL+"/api/v1/user/best-consultant"
    static let filter0                    = advURL+"/api/v1/filter/0"
    static let filter1                    = advURL+"/api/v1/filter/1"
    static let filter2                    = advURL+"/api/v1/filter/2"
    static let sitting                    = advURL+"/api/v1/setting"
    static let activateCode               = advURL+"/api/v1/user/activateCode"
    
}

class URLs {
    static var category      = advURL+"/api/v1/category-of-consultations"
    static var profile       = advURL+"/api/v1/user/profile"
    static var updateProfile = advURL+"/api/v1/user/updateProfile"
    static var Consaltant    = advURL+"/api/v1/consultants"
    
    //MARK:- advisor links
//    static var advURL = "http://tamazuj.sa"
    
    static var advProfile                 = advURL+"/api/v1/consultant/profile"
    
    static var advUpdateProfile           = advURL+"/api/v1/consultant/updateProfile"
    static var changeStats                = advURL+"/api/v1/consultant/status"
    static var allConsultants             = advURL+"/api/v1/consultants"
    static var askConsultation            = advURL+"/api/v1/user/consultation"
    static var userNotifiction            = advURL+"/api/v1/user/notification/"
    static var advNotifiction             = advURL+"/api/v1/consultant/notification/"
    static var advdeleteAllNotifiction    = advURL+"/api/v1/consultant/notifications/deleteAll"
    static var userdeleteAllNotifiction   = advURL+"/api/v1/user/notifications/deleteAll"
    static var checkout                   = advURL+"/api/v1/user/checkout?amount=100"
    static var paymentStatus              = advURL+"/api/v1/user/paymentStatus/"
    static var bill                       = advURL+"/api/v1/user/bill"
    static var Rating                     = advURL+"/api/v1/user/consultation/"
    static var userchangeSeen             = advURL+"/api/v1/user/notification/"
    static var advchangeSeen              = advURL+"/api/v1/consultant/notification/"
    static var Adcon                      = advURL+"/api/v1/consultant/consultation"
}

/*
 
test@gmail.com  123456
 
 "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc3ZGZjMTUwYjJhNmY2NDYwYzBlY2E0MTNiMGI4NDkwYjgyZGUwYzdhZjFiYzA3Y2NmNjA3M2YxZTZjNmViY2MxOTE4OTY5ZGI1MGM2YWY5In0.eyJhdWQiOiIxIiwianRpIjoiNzdkZmMxNTBiMmE2ZjY0NjBjMGVjYTQxM2IwYjg0OTBiODJkZTBjN2FmMWJjMDdjY2Y2MDczZjFlNmM2ZWJjYzE5MTg5NjlkYjUwYzZhZjkiLCJpYXQiOjE1NzYwOTYyODYsIm5iZiI6MTU3NjA5NjI4NiwiZXhwIjoxNjA3NzE4Njg2LCJzdWIiOiIxOSIsInNjb3BlcyI6W119.iAYIf2n-SUTzpKrM6X400yfER0WWxAL0psXY8wed1lWweQp4LDupQvjsB_CLLjlN6kCNPykhP6AMJnxWM8SJc7Pd-GHadUll3uv_kSx9hl-DiIG6v0wDIkxRjvTdU3N7GBhXAFMmKuXLkf9Fj7WmFVkQ00-mXM0J0mmCNHwNaEmaimQrOEQ5foaBhtNVyIK7QrV2T6ReRFa-7oyEw7-62-6lHaI_dFnQT2z_8s7154Po0EXwN5Z72-6_LGXQmTdtn0iRuUrpVauQrToA-sXoa_GjdT40GDgyKRwnJABBmEcaBTOgWH1HptdYIM4a18KR49V01-bLtwzcgovTDjIz1LmhvS_0xtQ0RbICnelHRaioswdO0B-ePZTgMMUdGWYzuVeI0Yj4oVsv4l59gVoj0th6fr40LpYFkU6hF9APctLBngWC2k02p8CZYuWgGOvhzsmKcx-9m7aBft4XSLJQ8E0G_zB_H-e9vFgwS8xC9jmjTJWiCCZ8hHa2Snz2-lVJCRvRroPMPAGl7m2RtdrWCQRoxNHA9iqKwsFz_j2mShFEY0usV5LE5xSj6BK67UgoBRj2X_tnvGCcf6oPO7jBpICgf_kZ1O6fM2mFPA1rUTlhEx1Gqdpbxf0w2Q11gYhSXck6x93N8VGu8C49W3GVq0aLLd7b-OPpwJ4i60alm50"
 */
