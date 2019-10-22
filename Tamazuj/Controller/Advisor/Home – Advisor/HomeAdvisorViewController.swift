//
//  HomeAdvisorViewController.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 19/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher
class HomeAdvisorViewController: UIViewController {
    
    var data : [AdvdataHome] = []
    var category_id : [category_id] = []
    var session_time : [session_time] = []
    var dataisEmpty : Bool?
    var nilldata : String = ""
    @IBOutlet var tabel: UITableView!
    @IBOutlet var ViewWarning: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTitel()
        loadData()
        //        ViewWarning.isHidden = true
        tabel.register(UINib(nibName: "dataNillTableViewCell", bundle: nil), forCellReuseIdentifier: "dataNillTableViewCell")
        tabel.register(UINib(nibName: "AdvisorTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvisorTableViewCell")
        
        
        
        print("my first commet")
        
    }
    @IBAction func completeData(_ sender: Any) {
        let stprybord = UIStoryboard(name: "Advisor", bundle: nil)
        let vc = stprybord.instantiateViewController(withIdentifier: "advProfileVC") as! advProfileVC
        navigationController?.pushViewController(vc, animated: true)

    }
    
    func loadData(){
        self.showIndeterminateHUD()
        advOprition.advhome { (err, result) in
            ///
            
            if let result = result{
                
                if (result.data?.isEmpty)!{
                    self.dataisEmpty = true
                    self.nilldata = "لايوجد لديك طلبات استشارة"
                    self.tabel.reloadData()
                }else{
                    for i in result.data!{
                        self.data.append(i)
                        self.category_id.append(i.category_id!)
                        self.session_time.append(i.session_time!)
                        self.tabel.reloadData()
                    }
                }
                
                self.hideHUD()
            }else{
                self.showHUD(title: "", details: err?.localizedDescription ?? "some Error", hideAfter: 3)
            }
        }
    }
    
    fileprivate func imageTitel() {
        let imageView = UIImageView(frame: (CGRect(x: 0, y: 0, width: 35, height:
            35)))
        imageView.contentMode = .scaleAspectFill
        let image = UIImage(named: "logo")
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
}
extension HomeAdvisorViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count > 0 ? self.data.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView == tabel {
            
        case self.data.isEmpty , self.dataisEmpty == true :
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataNillTableViewCell", for: indexPath) as! dataNillTableViewCell
            
            cell.label.text = nilldata
            cell.label.font =  UIFont(name: "Cairo-Bold", size: 18)
            cell.selectionStyle = .none
            return cell
            
        case self.data.count > 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorTableViewCell", for: indexPath) as! AdvisorTableViewCell
            cell.selectionStyle = .none
            let objectT = self.session_time[indexPath.row]
            let objectC = self.category_id[indexPath.row]
            let objectD = self.data[indexPath.row]
            
            
            cell.timeCons.text = objectT.time ?? "error objectT.time"
            cell.imageCons.kf.setImage(with: URL(string: objectC.image!))
            cell.typeConslt.text = objectC.name_ar! ?? "error objectC.name_ar"
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 137
    }
    
}
