//
//  advProfileVC.swift
//  Tamazuj
// advProfileVC
//  Created by yousef Omar on 10/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher

class advProfileVC: UIViewController {
    

    var nav :UINavigationController?
    @IBOutlet weak var tableView: UITableView!


    var profileData:AdvProfile?
    
    override func viewDidLoad() {
        nav = self.navigationController
        self.navigationController?.navigationBar.isHidden = true
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCellNib(cellClass: AdvFirstTableViewCell.self)
        tableView.registerCellNib(cellClass: AdvSecondTableCell.self)
        tableView.registerCellNib(cellClass: AdvthirdTableViewCell.self)
        tableView.registerCellNib(cellClass: AdvSectionTableViewCell.self)
        tableView.registerCellNib(cellClass: AdvSectionTwoTableViewCell.self)
        self.showIndeterminateHUD()
        Operation.advgetProfile(Authorization: "Bearer \(helper.getAdvisorToken()!)", lang: "test2") { (error, result) in
            if let result = result {
                self.profileData = result
                self.tableView.reloadData()
                self.hideHUD()
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.showIndeterminateHUD()
        Operation.advgetProfile(Authorization: "Bearer \(helper.getAdvisorToken()!)", lang: "test2") { (error, result) in
            if let result = result {
                self.profileData = result
                self.tableView.reloadData()
                self.hideHUD()
            }
        }

        
    }
    
    
}
extension advProfileVC:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 1
        }else if section == 2 {
            return 1
        }else if section == 3 {
            return 1
        }
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeue() as AdvFirstTableViewCell
            cell.profileData = self.profileData
            cell.selectionStyle = .none
            cell.nav = self.nav!
            if let obj = profileData?.data {
                cell.nameLabel.text = obj.name
                cell.emailLabel.text = obj.email
                cell.profileImage.kf.setImage(with:URL(string: (obj.photo)!))
                
            }else{
                cell.nameLabel.text = "some one"
            }
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeue() as AdvSecondTableCell
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 2 {
            let cell = tableView.dequeue() as AdvSectionTableViewCell
            cell.selectionStyle = .none
            
            return cell
        }else if indexPath.section == 3 {
            let cell = tableView.dequeue() as AdvSectionTwoTableViewCell
            cell.selectionStyle = .none
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 192
        }else if indexPath.section == 1 {
            return 179.5
        }else if indexPath.section == 2 {
            return 417
        }else if indexPath.section == 3 {
            return 217
        }else{
            return 0
        }
        return CGFloat()
    }
    
    
}
