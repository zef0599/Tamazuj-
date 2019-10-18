//
//  AdvMainViewController.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 19/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AdvMainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var txtMenu = ["حسابي", "التنبيهات", "سجل استشاراتي", "عن التطبيق", "الاعدادات"]
    fileprivate var imgMenu = ["menu_img_1", "menu_img_2", "menu_img_3", "menu_img_4", "menu_img_5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
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
            let vc = stprybord.instantiateViewController(withIdentifier: "navUser1") as! UINavigationController
            UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
        case 1:
            let vc = stprybord.instantiateViewController(withIdentifier: "NavNotfcation") as! UINavigationController
            UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
        //        present(vc, animated: true, completion: nil)

        default:
            break
        }
        

    }
    
    
}
