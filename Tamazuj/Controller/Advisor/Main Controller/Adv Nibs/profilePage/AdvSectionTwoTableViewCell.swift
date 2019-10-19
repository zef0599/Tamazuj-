//
//  AdvSectionTwoTableViewCell.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AdvSectionTwoTableViewCell: UITableViewCell {
    
    var tableData:[tabledata] = [
        tabledata(icon: #imageLiteral(resourceName: "attach.png"), title: "المرفقات"),
        tabledata(icon: #imageLiteral(resourceName: "document.png"), title: "إثبات الهوية"),
        tabledata(icon: #imageLiteral(resourceName: "document.png"), title: "المؤهلات"),
        tabledata(icon: #imageLiteral(resourceName: "document.png"), title: "السيرة الذاتية")]
    
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
        
        
    }
}
extension AdvSectionTwoTableViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as thirdTableViewCell
        
        cell.attachButton.isHidden = false
        let obj = tableData[indexPath.row]
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.iconImage.image = obj.icon
        cell.titleLabel.text = obj.title
        cell.attachButton.imageView?.image = #imageLiteral(resourceName: "attachblack")
        if indexPath.row == 0 {
            cell.roundCorners(.top, radius: 16)
            cell.attachButton.isHidden = true
            
        }
        if indexPath.row == 3 {
            cell.roundCorners(.bottom, radius: 16)
            
        }
        switch indexPath.row {
        case 0 :
            cell.titleLabel.text = "المرفقات"
        case 1 :
            cell.titleLabel.text = "إثبات الهوية"
        case 2 :
            cell.titleLabel.text = "المؤهلات"
        case 3 :
            cell.titleLabel.text = "السيرة الذاتية"
        default:
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
