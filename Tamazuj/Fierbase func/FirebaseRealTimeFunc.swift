//
//  fierbaseFUNC.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 15/11/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
import Firebase

class FirebaseRealTime{
    
    
    
    static func addNewUser(number id: String,name :String  ,image : String?,email : String , compltion: @escaping (Bool)-> Void ){
        let newUser : [String:Any] = ["id":id,"inviteAble":false,"name":name,"nameToDisplay":name,"online":false,"selected":false,"status":"تمازج","typing":false,"image":image ?? "nil image" , "email" : email]
        Database.database().reference().child("users").child("\(id)").setValue(newUser) { (error, result) in
            if error != nil{
                print("compltion(true)")
                compltion(true)
            }else{
                compltion(false)
            }
        }
    }
    
    static func addmasseges(numberConsaltnt idC: String, numberUser idU: String,masseg : String ,recipientName nameR : String ,senderName nameS : String ,compltion: @escaping (Bool)-> Void ){
        let timestamp = NSDate().timeIntervalSince1970
        let newUser : [String:Any] = ["attachmentType":"6","body":masseg,"date":timestamp,"delivered":false,"recipientId":idU,"recipientImage":"","recipientName":nameR,"recipientStatus":"تمازج","selected":false,"senderId":idC ,"senderImage":"","senderName" : nameS , "sent": false]
        
        Database.database().reference().child("chats").child("\(idC)-\(idU)").childByAutoId().setValue(newUser) { (error, result) in
            if error == nil{
                compltion(true)
            }else{
                compltion(false)
            }
        }
    }
    
    static func getMessagesBetweenConversation(numberConsaltnt idC: String, numberUser idU: String ,_ complition: @escaping (_ OK : Bool, [Messages]?)->Void){

        Database.database().reference().child("chats").child("\(idC)-\(idU)").observe(.childAdded) { (dataSnapshot) in
                        if let dic =  dataSnapshot.value as? [String:Any]{
                            guard let attachmentType = dic["attachmentType"] as? String,
                            let body = dic["body"] as? String,
                            let date = dic["date"] as? Double,
                            let delivered = dic["delivered"] as? Bool,
                            let recipientId = dic["recipientId"] as? String,
                            let recipientName = dic["recipientName"] as? String,
                            let recipientImage = dic["recipientImage"] as? String,
                            let recipientStatus = dic["recipientStatus"] as? String,
                            let selected = dic["selected"] as? Bool,
                            let senderId = dic["senderId"] as? String,
                            let senderImage = dic["senderImage"] as? String,
                            let senderName = dic["senderName"] as? String,
                            let sent = dic["sent"] as? Bool else{return}
                            
                            let allmassege = Messages(attachmentType: attachmentType, body: body, date: date, delivered: delivered, recipientId: recipientId, recipientImage: recipientImage, recipientName: recipientName, recipientStatus: recipientStatus, selected: selected, senderId: senderId, senderImage: senderImage, senderName: senderName, sent: sent)
//                            complition([allmassege])
                            complition(true,[allmassege])
                        }else{
                            
                            complition(false,nil)
            }
        }
        
        ////////////////// if use ----->  observe (value) {(dataSnapshot) ....
        
        //            for snap in dataSnapshot.children{
        //                let value = snap as! DataSnapshot
        //                if let dic =  value.value as? [String:Any]{
        //
        //                    //            guard let dic =  value.value as? [String:Any] else {return print("some error in lod maseg")}
        //                    print("dic",dic)
        //                    let message = Message(dic: dic)
        //
        //                    print("mmmmm",message)
        //                    messages.append(message)
        //
        //
        //                }else{
        //                    print("some error in lod maseg")
        //                }
        //            }
        //            complition!(messages)
    }
}




