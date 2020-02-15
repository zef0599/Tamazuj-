//
//  PaymentStatus.swift
//  Tamazuj
//
//  Created by yousef Omar on 11/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation

struct PaymentStatus:Codable {
    var result:result?
    var buildNumber:String?
    var timestamp:String?
    var ndc:String?
}
struct result:Codable {
    var code:String?
    var description:String?
}
