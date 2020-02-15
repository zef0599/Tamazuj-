//
//  ViewController.swift
//  Tamazuj
//
//  Created by Saadi on 9/5/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import MBProgressHUD
import IQKeyboardManager
import Firebase


class MainViewController: UIViewController {
    var nav : UINavigationController?
    var bestRatingdata : [BestRating] = []
    var categorydata : [Category] = []
    var bestConsultantdata : [BestConsultant] = []
//    var yousefCategorydata : [data] = []
    @IBOutlet var mainTabel: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        HomeData.homedataload(lang: "ar", Authorization:"Bearer \(helper.getUserToken()!)" ) { (error, result) in
//            ////
//            print("hhhhh \n result:",result)
//        }
        
        Operation.testS { (error, test) in
            print("test",test)
        }
//        let data = ["122":"cwewcew","233":"ececwec"]
//        Database.database().reference().child("testMohammed").setValue(data)
//
        InstanceID.instanceID().instanceID { (result, error) in
            if let error = error {
                print("Error fetching remote instance ID: \(error)")
            } else if let result = result {
                print("Remote instance ID token: \(result.token)")
//                self.instanceIDTokenMessage.text  = "Remote InstanceID token: \(result.token)"
            }
        }
        ////e_dhUuMAKl0:APA91bGT1MpPTm00C2Wd3CwjU1ESFGE7WH2uNmq9VnctiBCQ0TotfJHCZeXk1XFPoYOX8gIIZXLuklEdhWxztF165SwiDkO4ktioFDRGOSL2aqk-bGQkB2p7Y937AipFSReoVc6E6e9z
        
        ///dCKiPcPyZq4:APA91bE44hBlAiyee-Vx7kwLvc0tN_wJBTfDErUebgwQUN-4tI0YwTTtkVqzyLf07lXJR7skfOfiE5fhfniBoCTR9l_DG9cScsIdYoxnG95JGKf0FLX87aJO5L754-5MGf1934xE1R1-
//        InstanceID.instanceID().instanceID { (result, error) in
//            if let error = error {
//
//                print("Error fetching remote instance ID: \(error)")
//            } else if let result = result {
//                print("Remote instance ID token: \(result.token)")
////                self.instanceIDTokenMessage.text  = "Remote InstanceID token: \(result.token)"
//            }
//        }
        
//        NotificationCenter.default.addObserver(self, selector: #selector(testobserv), name: NSNotification.Name("open"), object: nil)
        
        
        nav = self.navigationController
        
        //        self.navigationController?.isNavigationBarHidden = false
        LoadDataHome()
        imageTitel()
        
        mainTabel.backgroundColor = .clear
        mainTabel.register(UINib(nibName: "SliderCollictionTableViewCell", bundle: nil), forCellReuseIdentifier: "SliderCollictionTableViewCell")
        mainTabel.register(UINib(nibName: "CounselingTableViewCell", bundle: nil), forCellReuseIdentifier: "CounselingTableViewCell")
        mainTabel.register(UINib(nibName: "adviserfavorsTableViewCell", bundle: nil), forCellReuseIdentifier: "adviserfavorsTableViewCell")
    
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

//        self.navigationController?.isNavigationBarHidden
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    @IBAction func serch(_ sender: Any) {
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    fileprivate func imageTitel() {
        let imageView = UIImageView(frame: (CGRect(x: 0, y: 0, width: 35, height:
            35)))
        imageView.contentMode = .scaleAspectFill
        let image = #imageLiteral(resourceName: "logo.png")
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    @IBAction func search(_ sender: Any) {
        self.showSearchPopup()
    }
    
    @IBAction func profileUser(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier:"ProfileVC" ) as! ProfileVC

//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK:- LoadDataHome
//    let token = "Bearer" + helper.getApiToken()!
    func LoadDataHome() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.removeFromSuperViewOnHide = true
        HomeData.home(lang: "ar", Authorization:"Bearer \(helper.getUserToken()!)" ) {[weak self, weak hud] (error, result) in
            
            guard let result = result else {
                hud?.mode = .text
                hud?.label.text = "Erorr ?!"
                hud?.detailsLabel.text = error?.localizedDescription ?? "Some Error"
                hud?.hide(animated: true, afterDelay: 4.0)
                return
            }
            for i in result.bestRating!{
                self?.bestRatingdata.append(i)
//                print("hhhhhData",i)
            }
            
            for i in result.category!{
                self?.categorydata.append(i)
//                self?.yousefCategorydata.append(i)
            }
            for i in result.bestConsultant!{
                self?.bestConsultantdata.append(i)
            }
            hud?.hide(animated: true)
            self?.mainTabel.reloadData()
//             print("hhhhhData",result)
        }
        
    }
}
extension MainViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bestRatingdata.count  > 0 ? 3	 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier:"AboutAdvisorVC" ) as! AboutAdvisorVC
            let cell = tableView.dequeueReusableCell(withIdentifier: "SliderCollictionTableViewCell", for: indexPath) as! SliderCollictionTableViewCell
            cell.nav = self.nav!
            cell.bestRatingdata = self.bestRatingdata
            cell.selectionStyle = .none
            cell.collectionView.reloadData()
            cell.backgroundColor = .clear
            cell.storyBoardVC = vc
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "CounselingTableViewCell", for: indexPath) as! CounselingTableViewCell
            
            cell.Goconsataione.addTarget(self, action: #selector(GoConsaltion), for: .touchUpInside)
            cell.nav = self.nav!
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.categorydata = self.categorydata
            cell.collection.reloadData()
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "adviserfavorsTableViewCell", for: indexPath) as! adviserfavorsTableViewCell
            cell.nav = self.nav!
            cell.arrowButton.addTarget(self, action: #selector(goFavorit), for: .touchUpInside)

            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.bestConsultantdata = self.bestConsultantdata
            cell.collection.reloadData()
            return cell
        }
        
        
        
    }
    @objc func GoConsaltion (){
        let de = UIApplication.shared.delegate as! AppDelegate
        if let tabBarController = de.window?.rootViewController as? UITabBarController {
            tabBarController.selectedIndex = 1
        }
    }
    
    @objc func goFavorit (){
        let stprybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = stprybord.instantiateViewController(withIdentifier: "FavoriteVC") as! FavoriteVC
        self.navigationController?.pushViewController(vc, animated: true)
        vc.bestConsultantdata = self.bestConsultantdata

        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250
        case 1:
            return 155
        case 2:
            return 250
        default:
            return 0
        }
        
    }
    
    
    
}

