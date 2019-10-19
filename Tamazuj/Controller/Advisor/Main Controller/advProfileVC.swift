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


    var profileData:Profile?
    
    override func viewDidLoad() {
        nav = self.navigationController
        self.navigationController?.navigationBar.isHidden = true
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCellNib(cellClass: FirstTableViewCell.self)
        tableView.registerCellNib(cellClass: SecondTableViewCell.self)
        tableView.registerCellNib(cellClass: thirdTableViewCell.self)
        tableView.registerCellNib(cellClass: SectionTableViewCell.self)
        tableView.registerCellNib(cellClass: SectionTwoTableViewCell.self)
        self.showIndeterminateHUD()
        Operation.getProfile(Authorization: "Bearer \(helper.getApiToken()!)", lang: "test2") { (error, result) in
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
            let cell = tableView.dequeue() as FirstTableViewCell
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
            let cell = tableView.dequeue() as SecondTableViewCell
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 2 {
            let cell = tableView.dequeue() as SectionTableViewCell
            cell.selectionStyle = .none
            
            return cell
        }else if indexPath.section == 3 {
            let cell = tableView.dequeue() as SectionTwoTableViewCell
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
            return 215
        }else{
            return 0
        }
        return CGFloat()
    }
    
    
}

//MARK- extention to UITableView

// to make it easy to nib


