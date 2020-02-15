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
    
    
    let ref = UIRefreshControl()
    
    @IBOutlet var tabel: UITableView!
    @IBOutlet var ViewWarning: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewWorningShow()
        

        tabel.rowHeight = UITableView.automaticDimension
        tabel.estimatedRowHeight = 100
        ViewWarning.isHidden = true
        imageTitel()
        loadData(true)
        tabel.register(UINib(nibName: "dataNillTableViewCell", bundle: nil), forCellReuseIdentifier: "dataNillTableViewCell")
        tabel.register(UINib(nibName: "AdvisorTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvisorTableViewCell")
        
    
        ref.addTarget(self, action: #selector(relodDatat), for: .valueChanged)
        tabel.addSubview(ref)
        
    }
    @objc func relodDatat(){
        
        loadData(false)
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        ViewWorningShow()
//
//        let vc = UIStoryboard(name: "Advisor", bundle: nil).instantiateViewController(withIdentifier: "AdvchatViewController")as! AdvchatViewController
////        let object = self.data[indexPath.row]
//        vc.id = 3
////        let nav =
////        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "AdvchatViewController") as! AdvchatViewController
////        let navController = UINavigationController(nibName: "chat", bundle: nil) // Creating a navigation controller with VC1 at the root of the navigation stack.
//        self.present(vc, animated:true, completion: nil)
//        
//
////        self.present(vc, animated: true) {
//
////        }
//    }
    fileprivate func ViewWorningShow() {
        Operation.advgetProfile(Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar") { (error, result) in
            if let result = result {
//                print("Bearer \(helper.getAdvisorToken()!)")
                if result.meta.status == 1{
                    if result.data?.status == "غير مأكد ملفات الثبوتية" && result.data?.account_status == "0"{
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
    
    func loadData(_ showIndeterminateHUD : Bool){
        if showIndeterminateHUD{
            self.showIndeterminateHUD()
        }
        advOprition.advhome { (err, result) in
            ///
            
            if let result = result{
                self.hideHUD()
                if (result.data?.isEmpty)!{
                    self.hideHUD()
                    self.dataisEmpty = true
                   // self.nilldata = "لايوجد لديك طلبات استشارة"
                }else{
                    for i in result.data!{
                        
                        self.data = [i]
                        self.category_id = [i.category_id!]
                        guard let time = i.session_time else { return }
                        self.session_time = [time]
                        
                    }
                    self.tabel.reloadData()
                    self.ref.endRefreshing()
                }
                
            }else{
                self.hideHUD()
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
    func acceptConsaltentadvisorTableViewCellDelegat(_ Cell: AdvisorTableViewCell) {
        
        
        if let indexPath = tabel.indexPath(for: Cell){
            print("d,s;,dl")
//            let vc = UIStoryboard(name: "Advisor", bundle: nil).instantiateViewController(withIdentifier: "AdvchatViewController")as! AdvchatViewController
//            let object = self.data[indexPath.row]
//            vc.id = 3//object.id!
            //        vc.string2 = "2139902320"
            //        vc.string1 = "0592216486"
            //
            
//            self.present(vc, animated: true) {
//
//            }
//            print("indexpath : - ",indexPath.row)
            
        }
    }
    
    
    func advisorTableViewCellDelegat(_ Cell: AdvisorTableViewCell) {
        print("index delet :-indexPath")
        
        if let indexPath = tabel.indexPath(for: Cell){
            let object = data[indexPath.row]
            
            advOprition.cancellation(id: object.id!) { (err, result) in
                if let result = result{
                    //           print(result.message ?? "لم يتم الغاء الاستشارة بعد ")
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
            
//        case true :
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
        if self.data.count == 0 {

            return "لايوجد لديك طلبات استشارة"
        }else{
            return nil
        }
        //return "nil"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.data.count == 0 {
            
            return 45//"لايوجد لديك طلبات استشارة"
        }else{
            return 0
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
