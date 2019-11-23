//
//  Constant.swift
//  Tamazuj
//
//  Created by osama abu dahi on 30/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation

struct API {
    
    // Post (email , password)
 
    static let login            = "http://salahalimohamed.website/tmajog/api/v1/user/login"
    static let Register         = "http://salahalimohamed.website/tmajog/api/v1/user/register"
    static let UpdatPass        = "http://salahalimohamed.website/tmajog/api/v1/user/updatePassword"
    static let consultation     = "http://salahalimohamed.website/tmajog/api/v1/user/consultation"
    static let consultations    = "http://salahalimohamed.website/tmajog/api/v1/user/consultation/18"
    static let AdRegister       = "http://salahalimohamed.website/tmajog/api/v1/consultant/register"
    static let Adlogin          = "http://salahalimohamed.website/tmajog/api/v1/consultant/login"
    static let activetcodeCons  = "http://salahalimohamed.website/tmajog/api/v1/consultant/activateCode"
    static let logout           = "http://salahalimohamed.website/tmajog/api/v1/user/logout"
    static let Adupdatpaas      = "http://salahalimohamed.website/tmajog/api/v1/consultant/updatePassword"
    static let Adlogout         = "http://salahalimohamed.website/tmajog/api/v1/consultant/logout"
    static let search           = "http://salahalimohamed.website/tmajog/api/v1/search"
    static let bestReting       = "http://salahalimohamed.website/tmajog/api/v1/user/best-rating"
    static let bestCon          = "http://salahalimohamed.website/tmajog/api/v1/user/best-consultant"
    static let filter0 = "http://salahalimohamed.website/tmajog/api/v1/filter/0"
    static let filter1 = "http://salahalimohamed.website/tmajog/api/v1/filter/1"
    static let filter2 = "http://salahalimohamed.website/tmajog/api/v1/filter/2"
    static let sitting = "http://salahalimohamed.website/tmajog/api/v1/setting"
    
    
}

class URLs {
    static var category = "http://salahalimohamed.website/tmajog/api/v1/category-of-consultations"
    static var profile = "http://salahalimohamed.website/tmajog/api/v1/user/profile"
    static var updateProfile = "http://salahalimohamed.website/tmajog/api/v1/user/updateProfile"
    static var Consaltant = "http://salahalimohamed.website/tmajog/api/v1/consultants"
    
    //MARK:- advisor links
    static var advURL = "http://salahalimohamed.website"
    
    static var advProfile = advURL+"/tmajog/api/v1/consultant/profile"
    static var advUpdateProfile = advURL+"/tmajog/api/v1/consultant/updateProfile"
    static var changeStats = advURL+"/tmajog/api/v1/consultant/status"
    static var allConsultants = advURL+"/tmajog/api/v1/consultants"
    static var askConsultation = advURL+"/tmajog/api/v1/user/consultation"
    
    static var userNotifiction = advURL+"/tmajog/api/v1/user/notification/"
    static var advNotifiction = advURL+"/tmajog/api/v1/consultant/notification/"

    static var advdeleteAllNotifiction = advURL+"/tmajog/api/v1/consultant/notifications/deleteAll"
    static var userdeleteAllNotifiction = advURL+"/tmajog/api/v1/user/notifications/deleteAll"
}

/*
 
 osama@test.com  12345
 
 "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk1YTQ4YmRhY2EzMjQ4ZmFhZjI1YmE4NWMwYjkzMGZkNjY5MmEzYTNkOWU5Mjc2M2JiM2FhNDg0NzU5ODY1NDU3MmFhZTI1ZTI5NjNhMzdhIn0.eyJhdWQiOiIxIiwianRpIjoiOTVhNDhiZGFjYTMyNDhmYWFmMjViYTg1YzBiOTMwZmQ2NjkyYTNhM2Q5ZTkyNzYzYmIzYWE0ODQ3NTk4NjU0NTcyYWFlMjVlMjk2M2EzN2EiLCJpYXQiOjE1Njk4NTUwNDksIm5iZiI6MTU2OTg1NTA0OSwiZXhwIjoxNjAxNDc3NDQ5LCJzdWIiOiIxMyIsInNjb3BlcyI6W119.F16bqP5cIdV6BBVfK1hCurUvKY6z44S68U8YWLVEVBsx_UFqrCq9YGxQbdTWbdawxx5RY3A9xW-rW6T92maVXd9t9lbOHIFRiVkmjnOq5xNB1xvqfdyD0P17I4gZW6JF_W876jsvhSQyhNZkGXBqdDHrfCeJoFAMGw-BfIqdUwXTbbUz4YsmtGgELcFWkqpfktEy5lw3YB6dpwnA6XcpOs7GNoBjVsptesf8ED7qdvznRdq6ZGQkcL0YOUxhdEWWUuWe5pqFqkYJESQ9HOa7NvRyK8CsY9YEa9YVLOibq2K8jwSCcpOrG9PRuihzf4NgdDp1hFxIWtWSk0Nek8G57dQQENvKV0ToQRGzPhT13_S_bDZdkxBIqDZU2VEo7SXczGnF2VF-HeSP5_yNidI8jmKEvUA8J21fScUe507wry4uuIXl2i5YZjAfUQlR_n1Xv-ldODjRW3as82ht_cmFH-oheUOsTBfINHKYvRALsHEPSAfNlVAahNcwEGCXW70vVY2Yeqr_pb0IUtfp7lkXSbS8Cz3xAQ8PJIosIXLPyjY-Ti-Wvj4kJyEMsHye6loEK4UI4T-a9riJXXJLb9iCj00cgtrJ1eqpb1R6bkh9IBc9Wgo2kZyeHmJ4BBBSr5yeIknOGSXIFht7xgeLpangjIxNOgMVEqYvAqIU9UJaajA"
 */
