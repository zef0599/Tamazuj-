//
//  MenuViewController.swift
//  Tamazuj
//
//  Created by Saadi on 9/6/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var txtMenu = ["حسابي", "التنبيهات", "سجل استشاراتي", "عن التطبيق", "الاعدادات"]
    fileprivate var imgMenu = ["menu_img_1", "menu_img_2", "menu_img_3", "menu_img_4", "menu_img_5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    @IBAction func profileUser(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return txtMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        
        let object = imgMenu[indexPath.row]
        cell.selectionStyle = .none
        cell.imgMenu.image = UIImage(named: object)
        cell.txtMenu.text = txtMenu[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stprybord = UIStoryboard(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0:
            let vc = stprybord.instantiateViewController(withIdentifier: "EditProfailUserViewController") as! EditProfailUserViewController
            navigationController?.pushViewController(vc, animated: true)
            
            //            let vc = stprybord.instantiateViewController(withIdentifier: "NavUserprofaile") as! UINavigationController
        //            UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
        case 1:
            let vc = stprybord.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController
            navigationController?.pushViewController(vc, animated: true)
            //
            //            let vc = stprybord.instantiateViewController(withIdentifier: "NavNotifications") as! UINavigationController
            //            UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
        //
        case 2 :
            let vc = stprybord.instantiateViewController(withIdentifier: "ConsultHistoryViewController") as! ConsultHistoryViewController
            vc.navHave = self.navigationController
            self.navigationController!.pushViewController(vc, animated: true)
        case 4:
            let vc = stprybord.instantiateViewController(withIdentifier: "EditProfailUserViewController") as! EditProfailUserViewController
          //  self.navigationController = self.navigationController
            navigationController?.pushViewController(vc, animated: true)

            break
        default:
            break
        }
        
          }
    
    
}
