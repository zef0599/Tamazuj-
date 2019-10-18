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

class MainViewController: UIViewController {
    var nav : UINavigationController?
    var bestRatingdata : [BestRating] = []
    var categorydata : [Category] = []
    var bestConsultantdata : [BestConsultant] = []
    var yousefCategorydata : [data] = []
    @IBOutlet var mainTabel: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nav = self.navigationController
        
//        self.navigationController?.isNavigationBarHidden = false
        LoadDataHome()
        imageTitel()
        
        mainTabel.backgroundColor = .clear
        mainTabel.register(UINib(nibName: "SliderCollictionTableViewCell", bundle: nil), forCellReuseIdentifier: "SliderCollictionTableViewCell")
        mainTabel.register(UINib(nibName: "CounselingTableViewCell", bundle: nil), forCellReuseIdentifier: "CounselingTableViewCell")
        mainTabel.register(UINib(nibName: "adviserfavorsTableViewCell", bundle: nil), forCellReuseIdentifier: "adviserfavorsTableViewCell")
    
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    self.navigationController?.setNavigationBarHidden(true, animated: true)

//        self.navigationController?.isNavigationBarHidden
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
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
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK:- LoadDataHome
//    let token = "Bearer" + helper.getApiToken()!
    func LoadDataHome() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.removeFromSuperViewOnHide = true
        HomeData.home(lang: "ar", Authorization:"Bearer \(helper.getApiToken()!)" ) {[weak self, weak hud] (error, result) in
            
            guard let result = result else {
                hud?.mode = .text
                hud?.label.text = "Erorr ?!"
                hud?.detailsLabel.text = error?.localizedDescription ?? "Some Error"
                hud?.hide(animated: true, afterDelay: 4.0)
                return
            }
            for i in result.bestRating!{
                self?.bestRatingdata.append(i)
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
            
        }
        
    }
}
extension MainViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bestRatingdata.count  > 0 ? 3 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier:"AboutAdvisorVC" ) as! AboutAdvisorVC
            let cell = tableView.dequeueReusableCell(withIdentifier: "SliderCollictionTableViewCell", for: indexPath) as! SliderCollictionTableViewCell
            cell.nav = self.nav!
            cell.bestRatingdata = self.bestRatingdata
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
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

