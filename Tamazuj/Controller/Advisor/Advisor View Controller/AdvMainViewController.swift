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
    var profileData:AdvProfile?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileEmail: UILabel!
    fileprivate var txtMenu = ["حسابي", "التنبيهات", "سجل استشاراتي", "عن التطبيق", "الاعدادات","تسجيل الخروج"]
    fileprivate var imgMenu = ["menu_img_1", "menu_img_2", "menu_img_3", "menu_img_4", "menu_img_5","logout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        showIndeterminateHUD()
        Operation.advgetProfile(Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar") { (error, result) in
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
    
    override func viewWillAppear(_ animated: Bool) {
        showIndeterminateHUD()
        Operation.advgetProfile(Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar") { (error, result) in
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
//            vc.profileData = self.profileData
            navigationController?.pushViewController(vc, animated: true)

        case 1:
//            let vc = stprybord.instantiateViewController(withIdentifier: "AdvNotificationsVC") as! AdvNotificationsVC
//            navigationController?.pushViewController(vc, animated: true)
            let de = UIApplication.shared.delegate as! AppDelegate
            if let tabBarController = de.window?.rootViewController as? UITabBarController {
                tabBarController.selectedIndex = 1
            }
        case 2:
            let vc = stprybord.instantiateViewController(withIdentifier: "AdvConsultHistoryVC") as! AdvConsultHistoryVC
            //    var navHave:UINavigationController?
//            vc.navHave = self.navigationController
            self.navigationController!.pushViewController(vc, animated: true)
        case 4:
            let vc = stprybord.instantiateViewController(withIdentifier: "AdvEditProfaileVC") as! AdvEditProfaileVC
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            let alert = UIAlertController(title: "هل تود فعلا تسجيل الخروج", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler:{ action in
                helper.logout()
                
            }))
            alert.addAction(UIAlertAction(title: "لا", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            break
        default:
            break
        }
        

    }
    
    
}
