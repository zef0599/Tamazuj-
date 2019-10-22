//
//  UserProfilVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/6/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class UserProfilVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var profileData:Profile?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        tableView.registerCellNib(cellClass: FirstTableViewCell.self)
        tableView.registerCellNib(cellClass: UserSectionTableViewCell.self)

        Operation.getProfile(Authorization:"Bearer \(helper.getUserToken()!)", lang: "test2") { (error, result) in
            if let result = result {
                self.profileData = result
                self.tableView.reloadData()
                self.hideHUD()
                
            }
        }
    }
    


}
extension UserProfilVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeue() as FirstTableViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
//            cell.nav = self.navigationController
            if let obj = profileData?.data {
                cell.nameLabel.text = obj.name
                cell.emailLabel.text = obj.email
                cell.profileImage.kf.setImage(with:URL(string: (obj.photo)!))
            }else{
                cell.nameLabel.text = "some one"
            }
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeue() as UserSectionTableViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 192
        }else if indexPath.section == 1 {
            return 320
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
