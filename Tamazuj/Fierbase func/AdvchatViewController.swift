//
//  AdvchatViewController.swift
//  cahtTese
//
//  Created by Mohammed Erbia on 11/11/2019.
//  Copyright © 2019 Mohammed Erbia. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManager
class AdvchatViewController: UIViewController {

    var id :Int!
    
    var data : [Showsingleconsultation.data] = []
    var Allmasseges : [Messages] = []
    
    @IBOutlet var massegTF: UITextField!
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
     
    }
    func observeMasseges(){
        for i in data{
            guard let consultant = i.consultant_id?.phone,
                let user = i.user?.phone else {return}
            self.showIndeterminateHUD()
            FirebaseRealTime.getMessagesBetweenConversation(numberConsaltnt: consultant, numberUser: user) { (OK, data) in
                if OK{
                    guard let dataresult = data else {return}
                    for i in dataresult{
                        if i.body == "."{
                            continue
                        }else{
                            self.Allmasseges.append(i)
                        }
                        
                    }
                    self.hideHUD()
                    self.tableview.reloadData()
                    print("count masseg",self.Allmasseges.count)
                    if self.Allmasseges.count > 5{
                        let indexPath = NSIndexPath(row: self.Allmasseges.count-1, section: 0)
                        self.tableview.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)
                    }
                    
                }else{
                    self.showHUD(title: "Error", details: "Some error in show masseg", hideAfter: 3)
                }
            }
        }
    }
    
    func loadData(){
        
        self.showIndeterminateHUD()
        guard let id = self.id else {return}
        advOprition.showsingleconsultation(id: id) { (error, result) in
            if let result = result {
                self.data.append(result.data!)
                guard let consultant = result.data?.consultant_id, let user = result.data?.user  else {return}
                
                
                FirebaseRealTime.addmasseges(numberConsaltnt: consultant.phone!, numberUser: user.phone!, masseg: ".", recipientName: "test", senderName: "test", compltion: { (ok) in
                    if ok{
                        self.observeMasseges()
                    }else{
                        self.showHUD(title: "error", details: "some error in show massege", hideAfter: 3)
                    }
                })
                
                
                //                self.hideHUD()
            }else{
                self.showHUD(title: "error", details: "some error in show massege", hideAfter: 3)
            }
            
        }
        
    }


    @IBAction func back(_ sender: Any) {
        dismiss(animated: true) {
            ///// show 
            
        }
    }
    @IBAction func sendmasseg(_ sender: Any) {
        
        guard let massegTF = self.massegTF.text , massegTF.isEmpty == false else {
            //            self.desplayError(errormasseg: "some erorr in send you masseg ...!")
            self.showHUD(title: "Add Data", details: "please add masseg", hideAfter: 3)
            return
        }
        for i in self.data{
            guard let user =  i.user?.phone,
                let consultant = i.consultant_id?.phone,
                let recipent = i.user?.name,
                let  sender = i.consultant_id?.name
                else {return}
            
            
            
            FirebaseRealTime.addmasseges(numberConsaltnt: consultant, numberUser: user, masseg: massegTF, recipientName: recipent, senderName: sender) { (OK) in
                if OK{
                    self.massegTF.text = ""
                }else{
                    print("error in (OK)")
                }
            }
            
        }
    }



}
extension AdvchatViewController : UITableViewDataSource,UITableViewDelegate{
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
        
        let object = Allmasseges[indexPath.row]
        
       
        cell.masseg.text = object.body
        cell.time.text = Since1970toHHMM(object.date!)
        for i in self.data{
            if i.consultant_id?.name == object.senderName{
                cell.massegtype(type: .outgoing)
                cell.username.text = i.consultant_id?.name ?? "nill name"
                cell.userimageleaging.kf.setImage(with: URL(string: i.consultant_id?.photo ?? ""), placeholder: UIImage(named:"userl" ))
            }else{
                
                cell.massegtype(type: .income)
                cell.username.text = i.user?.name ?? "nill name"
                cell.userimageleaging.kf.setImage(with: URL(string: i.user?.photo ?? ""), placeholder: UIImage(named:"userb" ))
                
            }
        }
        
        return cell
}
}
