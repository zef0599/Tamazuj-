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
        ViewWarning.isHidden = true
        imageTitel()
        loadData()
        tabel.register(UINib(nibName: "dataNillTableViewCell", bundle: nil), forCellReuseIdentifier: "dataNillTableViewCell")
        tabel.register(UINib(nibName: "AdvisorTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvisorTableViewCell")
        
        ViewWorningShow()
    }
    override func viewWillAppear(_ animated: Bool) {
        ViewWorningShow()
        
    }
    fileprivate func ViewWorningShow() {
        Operation.advgetProfile(Authorization: "Bearer \(helper.getAdvisorToken()!)", lang: "ar") { (error, result) in
            if let result = result {
//                print("Bearer \(helper.getAdvisorToken()!)")
                if result.meta.status == 1{
                    if result.data?.status == "الحساب غير مفعل" && result.data?.account_status == "0"{
                        self.ViewWarning.isHidden = false
                    }else{
                        self.ViewWarning.isHidden = true
                    }
                }
            }
        }
    }
    @IBAction func completeData(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "advProfileVC") as! advProfileVC
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
                }else{
                    for i in result.data!{
                        
                        self.data.append(i)
                        self.category_id.append(i.category_id!)
                        self.session_time.append(i.session_time!)
                        
                    }
                }
                self.tabel.reloadData()
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
extension HomeAdvisorViewController : UITableViewDataSource,UITableViewDelegate,AdvisorTableViewCellDelgat{
    
    func advisorTableViewCellDelegat(_ Cell: AdvisorTableViewCell) {
        
        if let indexPath = tabel.indexPath(for: Cell){
            let object = data[indexPath.row]
            advOprition.cancellation(id: object.id!) { (err, result) in
                if let result = result{
                    //                    print(result.message ?? "لم يتم الغاء الاستشارة بعد ")
                    if result.status! == 1{
                        self.data.remove(at: indexPath.row)
                        self.tabel.beginUpdates()
                        self.tabel.deleteRows(at: [indexPath], with: .fade)
                        self.tabel.endUpdates()
                        self.showHUD(title: "", details: result.message ?? "لم يتم الغاء الاستشارة بعد ", hideAfter: 2)
                        
                    }
                    
                }else{
                    self.showHUD(title: "", details: err?.localizedDescription ?? "some Error", hideAfter: 3)
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        switch tableView == tabel {
//        case self.data.count > 0:
//            return data.count
//        case self.dataisEmpty == true:
//            return 0
//        default:
//            return 0
//        }
        return self.data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView == tabel {
            
//        case self.data.isEmpty , self.dataisEmpty == true :
//            let cell = tableView.dequeueReusableCell(withIdentifier: "dataNillTableViewCell", for: indexPath) as! dataNillTableViewCell
//
//            cell.label.text = nilldata
//            cell.label.font =  UIFont(name: "Cairo-Bold", size: 18)
//            cell.selectionStyle = .none
//            cell.backgroundColor = .clear
//
//            return cell
            
        case self.data.count > 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorTableViewCell", for: indexPath) as! AdvisorTableViewCell
            cell.selectionStyle = .none
            let objectT = self.session_time[indexPath.row]
            let objectC = self.category_id[indexPath.row]
            //            let objectD = self.data[indexPath.row]
            
            
            
            cell.timeCons.text = objectT.time ?? "error objectT.time"
            cell.imageCons.kf.setImage(with: URL(string: objectC.image!))
            cell.typeConslt.text = objectC.name_ar ?? "error objectC.name_ar"
            
            //            cell.cancellation.tag = indexPath.row
            cell.delegat = self
            
            //            cell.cancellation.addTarget(self, action: #selector(cancellation), for: .touchUpInside)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if dataisEmpty == true , self.data.count == 0 {
            
            return "لايوجد لديك طلبات استشارة"
        }else{
            return ""
        }   
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 137
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       

            if editingStyle == .delete{
                
                if tableView == self.tabel{
                    let object = data[indexPath.row]
                    advOprition.cancellation(id: object.id!) { (err, result) in
                        if let result = result{
                            //                    print(result.message ?? "لم يتم الغاء الاستشارة بعد ")
                            if result.status! == 1{
                                self.data.remove(at: indexPath.row)
                                self.tabel.beginUpdates()
                                self.tabel.deleteRows(at: [indexPath], with: .bottom)
                                self.tabel.endUpdates()
                                
                                self.showHUD(title: "", details: result.message ?? "لم يتم الغاء الاستشارة بعد ", hideAfter: 2)
                            
                            }
                            
                            
                        }else{
                            self.showHUD(title: "", details: err?.localizedDescription ?? "some Error", hideAfter: 3)
                        }
                    }
                }
                
            }
        
//        }
//
    }
    
    
}
