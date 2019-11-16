//
//  chatViewController.swift
//  cahtTese
//
//  Created by Mohammed Erbia on 11/11/2019.
//  Copyright © 2019 Mohammed Erbia. All rights reserved.
//

import UIKit
import Firebase
class chatViewController: UIViewController {
//    var room : Room?
    
    var Allmasseges : [Messages] = []
    @IBOutlet var massegTF: UITextField!
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        observeMasseges()
//        guard let nameroom = room?.room else{return}
//        title = nameroom
//        tableview.scroll
        getmasseges()
        
        
        
        
    }
    
    func getmasseges(){
        self.showIndeterminateHUD()
        FirebaseRealTime.getMessagesBetweenConversation(numberConsaltnt: "+9720597776576", numberUser: "0597776576") { (OK, data) in
            if OK{
                guard let dataresult = data else {return}
                self.Allmasseges.append(contentsOf: dataresult)
                self.hideHUD()
                self.tableview.reloadData()
                let indexPath = NSIndexPath(row: self.Allmasseges.count-1, section: 0)
                self.tableview.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)
            }else{
                self.showHUD(title: "Error", details: "Some error in show masseg", hideAfter: 3)
            }
        }
    }
    
//
//    func getuserwithID(userID : String , complition : @escaping (_ userName : String?)-> Void){
//        let rf = Database.database().reference()
//        rf.child("Users").child(userID).child("username").observeSingleEvent(of: .value) { (dataSnapshot) in
//            if let username = dataSnapshot.value as? String {
//                complition(username)
//            }else{
//                complition(nil)
//            }
//        }
//    }
//
//
//    func sendmassege (text : String , completion : @escaping ((_ isSuccss : Bool)->Void)){
//        guard  let userID = Auth.auth().currentUser?.uid else{return}
//            self.getuserwithID(userID: userID, complition: { (userName) in
//                if let userName = userName{
//                    if let roomid = self.room?.roomID{
//                        let timestamp = NSDate().timeIntervalSince1970
//                        let masseg : [String: Any] =  ["sendname":userName,"text":text , "userid" : userID , "timesend" : timestamp]
//                        let rf = Database.database().reference()
//                        rf.child("rooms").child(roomid).child("masseges").childByAutoId().setValue(masseg, withCompletionBlock: { (error, databaseReference) in
//                            if error == nil{
//                                completion(true)
//                           //  MARK:- updit last masseg in room
//                                Database.database().reference().child("rooms").child(roomid).updateChildValues(["lastmasseg" : text], withCompletionBlock: { (error, datasnapshot) in
//                                    if error == nil{
//                                        print("update is sucsses")
//                                    }else{
//                                        print("update is error")
//                                    }
//                                })
//
//
//
//                                self.massegTF.text? = ""
//
//                            }else{
//                                completion(false)
//                            }
//                        })
//                    }
//                }else{
//                    self.desplayError(errormasseg: "some erorr in send you masseg ... in USER NAME!")
//                }
//            })
//    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true) {
            ///// show 
            
        }
    }
    @IBAction func sendmasseg(_ sender: Any) {
        
        guard let massegTF = self.massegTF.text , massegTF.isEmpty == false else {
//            self.desplayError(errormasseg: "some erorr in send you masseg ...!")
            return
        }
        FirebaseRealTime.addmasseges(numberConsaltnt: "+9720597776576", numberUser: "0597776576", masseg: massegTF, recipientName: "test", senderName: "mohammed erbia") { (OK) in
            if OK{
                self.massegTF.text = ""
            }else{
                print("error in (OK)")
            }
        }
        
//        sendmassege(text: massegTF) { (succsess) in
//            if succsess{
//                print("send masseg is succsess :)")
//            }else{
//                self.desplayError(errormasseg: "some erorr in sending masseg );")
//            }
//        }
    }
//    func observeMasseges(){
//        guard  let roomID = self.room?.roomID else{return}
//        Database.database().reference().child("rooms").child(roomID).child("masseges").observe(.childAdded) { (dataSnapshot) in
//            if let snapshot =  dataSnapshot.value as? [String:Any]{
//            if let sendname = snapshot["sendname"] as? String , let textmasseg = snapshot["text"] as? String , let userId = snapshot["userid"] as? String , let timesend = snapshot["timesend"] as? Double {
//                let masseg = Masseg(uid: dataSnapshot.key, sendname: sendname, text: textmasseg, userId: userId, time: timesend)
//                    self.masseges.append(masseg)
//                    self.tableview.reloadData()
//
//                let indexPath = NSIndexPath(row: self.masseges.count-1, section: 0)
//                self.tableview.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)
//                }
//            }else{
//                self.desplayError(errormasseg: "some erorr in send this masseg :-));")
//            }
//        }
//    }

}
extension chatViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Allmasseges.count
    }
    func Since1970toHHMM(_ Since1970 : Double)-> String{
        let myTimeInterval = TimeInterval(Since1970)
        let time = NSDate(timeIntervalSince1970: TimeInterval(myTimeInterval))
        let dateFormatter = DateFormatter()
//        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        //        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "h:mm a" //Specify your format that you want
     return  dateFormatter.string(from: time as Date)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! chatTVC
        
         cell.massegtype(type: .outgoing)
        
        let object = Allmasseges[indexPath.row]
        cell.username.text = object.senderName
        cell.masseg.text = object.body
        cell.time.text = Since1970toHHMM(object.date!)
//        if let uid = Auth.auth().currentUser?.uid{
//            if object.userId == uid {
//                cell.massegtype(type: .income)
//            }else{
//                cell.massegtype(type: .outgoing)
//            }
//        }else{
//            self.desplayError(errormasseg: "some error in show masseg")
//        }
        
        
        return cell
}
}
