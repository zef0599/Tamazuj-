//
//  AdvMainViewController.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 19/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher
class AdvMainViewController: UIViewController {
    var profileData:Profile?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileEmail: UILabel!
    fileprivate var txtMenu = ["حسابي", "التنبيهات", "سجل استشاراتي", "عن التطبيق", "الاعدادات"]
    fileprivate var imgMenu = ["menu_img_1", "menu_img_2", "menu_img_3", "menu_img_4", "menu_img_5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        showIndeterminateHUD()
        Operation.getProfile(Authorization: "Bearer \(helper.getApiToken()!)", lang: "test2") { (error, result) in
            if let result = result {
                self.profileData = result
                self.tableView.reloadData()
                self.hideHUD()
                self.profileImage.kf.setImage(with: URL(string: (result.data?.photo)!))
                self.profileName.text = result.data?.name
                self.profileEmail.text = result.data?.email
            }
            self.hideHUD(animated: true)
        }

    }
}

extension AdvMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return txtMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        
        let object = imgMenu[indexPath.row]
        
        cell.imgMenu.image = UIImage(named: object)
        cell.txtMenu.text = txtMenu[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stprybord = UIStoryboard(name: "Advisor", bundle: nil)
        switch indexPath.row {
        case 0:
            let vc = stprybord.instantiateViewController(withIdentifier: "advProfileVC") as! advProfileVC
            navigationController?.pushViewController(vc, animated: true)

        case 1:
            let vc = stprybord.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = stprybord.instantiateViewController(withIdentifier: "ConsultHistoryViewController") as! ConsultHistoryViewController
            //    var navHave:UINavigationController?
            vc.navHave = self.navigationController
            self.navigationController!.pushViewController(vc, animated: true)
        case 4:
            let vc = stprybord.instantiateViewController(withIdentifier: "EditProfailUserViewController") as! EditProfailUserViewController
            navigationController?.pushViewController(vc, animated: true)

        default:
            break
        }
        

    }
    
    
}
/*
 let vc = stprybord.instantiateViewController(withIdentifier: "EditProfailUserViewController") as! EditProfailUserViewController
 navigationController?.pushViewController(vc, animated: true)

 */
