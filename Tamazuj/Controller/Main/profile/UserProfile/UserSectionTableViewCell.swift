//
//  SectionTableViewCell.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/4/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
class UserSectionTableViewCell: UITableViewCell {

    var tableData:[tabledata] = [
    tabledata(icon: #imageLiteral(resourceName: "male.png"), title: "ذكر"),
    tabledata(icon: #imageLiteral(resourceName: "national.png"), title: "سعودي"),
    tabledata(icon: #imageLiteral(resourceName: "calender.png"), title: "06/05/1989"),
    tabledata(icon: #imageLiteral(resourceName: "learn.png"), title: "بكالوريس"),
    tabledata(icon: #imageLiteral(resourceName: "spcifec.png"), title: "دكتور أمراض نفسية"),
    tabledata(icon: #imageLiteral(resourceName: "relation.png"), title: "متزوج"),
    tabledata(icon: #imageLiteral(resourceName: "gps.png"), title: "المملكة العربية السعودية"),
    tabledata(icon: #imageLiteral(resourceName: "lange.png"), title: "العربية -الانجليزية")]
    var profileData:Profile?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewForShadow: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCellNib(cellClass: thirdTableViewCell.self)
        viewForShadow.shadowColor = #colorLiteral(red: 0.8823529412, green: 0.9098039216, blue: 0.9215686275, alpha: 0.53)
        viewForShadow.shadowOffset = CGSize(width: 0, height: 1)
        viewForShadow.shadowOpacity = 9
        viewForShadow.shadowRadius = 16
        Operation.getProfile (Authorization: "Bearer \(helper.getUserToken()!)", lang: "test2") { (error, result) in
            if let result = result {
                self.profileData = result
                self.tableView.reloadData()
            }
        }

    }
}
extension UserSectionTableViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as thirdTableViewCell
        cell.attachButton.isHidden = true
        let obj = tableData[indexPath.item]
        cell.titleLabel.text = obj.title
        cell.iconImage.image = obj.icon
        if indexPath.row == 0 {
            cell.roundCorners(.top, radius: 16)
        }
        if indexPath.row == 5 {
            cell.roundCorners(.bottom, radius: 16)
        }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if let obj = profileData?.data {
            switch indexPath.row {
            case 0 :
                cell.titleLabel.text = "\(obj.gender)"
            case 1 :
                cell.titleLabel.text = "\(String(describing: obj.nationality))"
            case 2 :
                cell.titleLabel.text = "\(obj.date_of_birth)"
            case 3 :
                cell.titleLabel.text = "\(obj.educational_status)"
            case 4 :
                cell.titleLabel.text = "\(obj.work_status)"
            case 5 :
                cell.titleLabel.text = "\(obj.social_status)"
            case 6 :
                cell.titleLabel.text = "\(obj.nationality)"
            case 7 :
                cell.titleLabel.text = "العربيه"
            default:
                return cell
            }
        }else{
            cell.titleLabel.text = "some one"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
