//
//  NotificationsViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 15/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    let data = [["NewNotefiction","NewNotefiction","NewNotefiction","NewNotefiction","NewNotefiction","NewNotefiction"],["OldNotefiction","OldNotefiction","OldNotefiction","OldNotefiction","OldNotefiction"
        ]]
    let headerTitles = ["التنبيهات الجديدة","التنبيهات القديمة"]
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false

        
        
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
    
    
    
    
}

extension NotificationsViewController : UITableViewDelegate , UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsCell", for: indexPath) as! NotificationsTableViewCell
        
        
      
        let cellText = data[indexPath.section][indexPath.row]
          cell.NotificationText.text = cellText

        
        cell.selectionStyle = .none
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    
        view.tintColor = UIColor.white
        let heder = view as! UITableViewHeaderFooterView
            //heder.textLabel?.sizeThatFits(12)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return data[section].count
    }
    
    
    
    
    
    
}
