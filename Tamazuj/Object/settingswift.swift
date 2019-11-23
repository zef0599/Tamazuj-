//
//  settingswift.swift
//  Tamazuj
//
//  Created by osama abu dahi on 19/11/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
/*
"about_app": " Because it is still an alternative and temporary
"privacy_app": "<html>\r\n<head>\r\n\t<title></title>\r\n</head>\r\n<body>\r\n<h1 dir=\"rtl\"
"condition": "<html>\r\n<head>\r\n\t<title></title>\r\n</head>\r\n<body>\r\n<h1 dir=\"rtl\"
"facebook": "facebook",
"tweeter": "tweeter",
"instagram": "instagram",
"watsapp": "watsapp",
"message": "تم العرض بنجاح",
"status": 1
*/

struct settingData:Codable {
    var about_app:String?
    var privacy_app:String?
    var condition:String?
    var status:Int?
}
