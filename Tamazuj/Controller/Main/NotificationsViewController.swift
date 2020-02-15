//
//  NotificationsViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 15/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//


import UIKit

class NotificationsViewController: UIViewController {
    
    
    
    var notifiction : [Notifiction.data] = []
    
//    var data  = [[Notifiction.data].self,[Notifiction.data].self]
    var seenNotifiction : [Notifiction.data] = []
    
//    let data = [["NewNotefiction","NewNotefiction","NewNotefiction","NewNotefiction","NewNotefiction","NewNotefiction"],["OldNotefiction","OldNotefiction","OldNotefiction","OldNotefiction","OldNotefiction"
//        ]]
    let headerTitles = ["التنبيهات الجديدة","التنبيهات القديمة"]
    
    @IBOutlet weak var tableview: UITableView!
    
    
    let ref = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.estimatedRowHeight = 100
        self.tableview.rowHeight = UITableView.automaticDimension
        
        self.navigationController?.isNavigationBarHidden = false
        
        
        loadData()
        ref.addTarget(self, action: #selector(relodDatat), for: .valueChanged)
        tableview.addSubview(ref)
        
    }
    @objc func relodDatat(){
        
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
        APINotifiction.userNotifiction(id: 1) { (error, result) in
            
            if result?.meta?.status == 1 , let result = result{
                var data : [Notifiction.data] = []
                for i in result.data!{
                    data.append(i)
                    self.seenNotifiction = data
                    
                }
                if result.data?.count == 0{
                    self.showHUD(title: "", details: "لا يوجد لديك اشعارات ", hideAfter: 3)
                }
            }else{
                self.showHUD(title: "error", details: error?.localizedDescription ?? "some error in show notifiction", hideAfter: 3)
                
            }
//            self.hideHUD()
//            self.tableview.reloadData()
//            if self.notifiction.count == 0{
//                self.showHUD(title: "", details: "لا يوجد لديك اشعارات ", hideAfter: 3)
//            }
        }
        
        APINotifiction.userNotifiction(id: 0) { (error, result) in
            
            if result?.meta?.status == 1 , let result = result{
                var data : [Notifiction.data] = []
                for i in result.data!{
                    data.append(i)
                    self.notifiction = data
                    
                }
                if result.data?.count == 0{
                    self.showHUD(title: "", details: "لا يوجد لديك اشعارات ", hideAfter: 3)
                }
            }else{
                self.showHUD(title: "error", details: error?.localizedDescription ?? "some error in show noyifiction", hideAfter: 3)
                
            }
            self.hideHUD()
            self.tableview.reloadData()
            self.ref.endRefreshing()
            if self.notifiction.count == 0{
                self.showHUD(title: "", details: "لا يوجد لديك اشعارات ", hideAfter: 3)
            }
        }
        
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        showIndeterminateHUD()
        APINotifiction.userdeleteAllNotifiction { (error, result) in
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


extension NotificationsViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.notifiction.count > 0 ? self.notifiction.count : 0
        }else if section == 1 {
            return self.seenNotifiction.count > 0 ? self.seenNotifiction.count : 0
        }else{
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        let data = self.data[indexPath.section][indexPath.row]
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsCell", for: indexPath) as! NotificationsTableViewCell
            cell.selectionStyle = .none
            let cellText = notifiction[indexPath.row]
            cell.NotificationText.text = cellText.message
            cell.NotificationTime.text = cellText.created
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsCell", for: indexPath) as! NotificationsTableViewCell
            cell.selectionStyle = .none
            let cellText = seenNotifiction[indexPath.row]
            cell.NotificationText.text = cellText.message
            cell.NotificationTime.text = cellText.created
            
            return cell
            
        default:
            return UITableViewCell()
        }
        

    }
    
        func numberOfSections(in tableView: UITableView) -> Int {
//            if self.notifiction.count > 0 || self.seenNotifiction.count > 0 {
                return headerTitles.count
//            }else{
//                return 0
//            }
            
        }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.notifiction.count > 0 || self.seenNotifiction.count > 0 {
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
