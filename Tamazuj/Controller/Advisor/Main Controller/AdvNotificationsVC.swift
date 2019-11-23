//
//  AdvNotificationsVC.swift
//  Tamazuj
//  AdvNotificationsVC
//  Created by yousef Omar on 10/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//
import UIKit

class AdvNotificationsVC: UIViewController {
    
    
    
    var notifiction : [Notifiction.data] = []
    
//    let data = [["NewNotefiction","NewNotefiction","NewNotefiction","NewNotefiction","NewNotefiction","NewNotefiction"],["OldNotefiction","OldNotefiction","OldNotefiction","OldNotefiction","OldNotefiction"
//        ]]
    let headerTitles = ["التنبيهات الجديدة","التنبيهات القديمة"]
    
    @IBOutlet weak var tableview: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        loadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func  loadData(){
        
        showIndeterminateHUD()
        APINotifiction.advNotifiction(id: 1) { (error, result) in
    
            if result?.meta?.status == 1 , let result = result{
                for i in result.data!{
                    self.notifiction.append(i)
                }
                if result.data?.count == 0{
                    self.showHUD(title: "", details: "لا يوجد لديك اشعارات ", hideAfter: 3)
                }
            }else{
                self.showHUD(title: "error", details: error?.localizedDescription ?? "some error in show noyifiction", hideAfter: 3)
                
            }
            self.hideHUD()
            self.tableview.reloadData()
        }
    }
    @IBAction func deleteAll(_ sender: Any) {
        showIndeterminateHUD()
        APINotifiction.advdeleteAllNotifiction { (error, result) in
            if result?.status == 1 , let result = result{
                self.notifiction.removeAll()
                self.tableview.reloadData()
                self.hideHUD()
                self.showHUD(title: "", details: result.message ?? "error \(error?.localizedDescription)", hideAfter: 3)
            }else{
                self.showHUD(title: "", details: error?.localizedDescription ?? "some error", hideAfter: 3)
            }
            
        }
    }
    
    
}


extension AdvNotificationsVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notifiction.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsCell", for: indexPath) as! NotificationsTableViewCell
        
        
        
        let cellText = notifiction[indexPath.row]
        cell.NotificationText.text = cellText.message
        cell.NotificationTime.text = cellText.created
        
        cell.selectionStyle = .none
        return cell
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return notifiction.count
//    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor.white
//        let heder = view as! UITableViewHeaderFooterView
        //heder.textLabel?.sizeThatFits(12)
    }
    
    

    
    
    
    
    
    
}
