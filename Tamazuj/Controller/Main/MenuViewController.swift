//
//  MenuViewController.swift
//  Tamazuj
//
//  Created by Saadi on 9/6/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var uesrEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImge: UIImageView!

    @IBOutlet weak var tableView: UITableView!
    fileprivate var txtMenu = ["حسابي", "التنبيهات", "سجل استشاراتي", "عن التطبيق", "الاعدادات","تسجيل الخروج"]
    fileprivate var imgMenu = ["menu_img_1", "menu_img_2", "menu_img_3", "menu_img_4", "menu_img_5","logout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        userImge.layer.cornerRadius = userImge.b
        
        NotificationCenter.default.addObserver(self, selector: #selector(testobserv), name: NSNotification.Name("backgrund"), object: nil)
        
        
        
        tableView.tableFooterView = UIView()
        Operation.getProfile(Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar") { (error, result) in
            if let result = result {
//                self.Data = result
                
                print("\(result.data)")
                
                
                self.uesrEmail.text = result.data?.email ?? "error email"
//                print(self.uesrEmail.text)
                self.userName.text = result.data?.name ?? "error name"
//                let photoURL =  result.data?.photo
                self.userImge.kf.setImage(with:URL(string: (result.data?.photo)!))
            }else{
                print("error")
                self.showHUD(title: "", details: error?.localizedDescription ?? "توجد مشكلة في عرض تفاصيل المستخدم ", hideAfter: 3)
            }
            
            
        }
    }
    @objc func testobserv(sender : NSNotification){
        let userInfo = sender.userInfo
        let aps = userInfo!["aps"] as! [String:Any]
        let alert = aps["alert"] as! [String:Any]
        let titles =  alert["title"] as? String
        
        
        guard let title = titles else {return}
        
        let alerts = UIAlertController(title: "test", message: "\(title)", preferredStyle: .alert)
        alerts.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alerts, animated: true, completion: nil)
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
            let vc = stprybord.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            let vc = stprybord.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController
            navigationController?.pushViewController(vc, animated: true)
        case 2 :
            let vc = stprybord.instantiateViewController(withIdentifier: "ConsultHistoryViewController") as! ConsultHistoryViewController
            vc.navHave = self.navigationController
            self.navigationController!.pushViewController(vc, animated: true)
        case 3 :
            let vc = stprybord.instantiateViewController(withIdentifier: "aboutapp") as! aboutAppVC
            self.navigationController!.pushViewController(vc, animated: true)
        case 4:
            let vc = stprybord.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            navigationController?.pushViewController(vc, animated: true)

            break
        case 5:
            let alert = UIAlertController(title: "هل تود فعلا تسجيل الخروج", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler:{ action in
                helper.logout()
                
            }))
            alert.addAction(UIAlertAction(title: "لا", style: .cancel, handler: nil))
            self.present(alert, animated: true)

        default:
            break
        }
        
          }
    
    
}
