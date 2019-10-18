//
//  abuteConsltentViewController.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 16/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher

class abuteConsltentViewController: UIViewController {
    var id : Int?
    var dataisEmpty : Bool!
    
    var data : [Alldata] = []
    var feedback : [dataFedback] = []
    @IBOutlet var Coment: UIButton!
    @IBOutlet var advisor: UIButton!
//    @IBOutlet var abutAdvView: UIView!
//    @IBOutlet var commentView: UIView!
    
    @IBOutlet var abutAdvView: UIView!
    @IBOutlet var commentView: UIView!
    @IBOutlet var Askadvice: UIButton!
    
    /////  category
    @IBOutlet var Categ1: UILabel!
    @IBOutlet var Categ2: UILabel!
    @IBOutlet var Categ3: UILabel!
//
    @IBOutlet var name: UILabel!
    @IBOutlet var rating: UILabel!
    @IBOutlet var biography: UILabel!
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var table1: UITableView!
    @IBOutlet var table2: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backImage = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage

        
        table2.register(UINib(nibName: "AdvisorCell", bundle: nil), forCellReuseIdentifier: "AdvisorCell")
        table2.register(UINib(nibName: "dataNillTableViewCell", bundle: nil), forCellReuseIdentifier: "dataNillTableViewCell")
        
        
        commentView.isHidden = false
        abutAdvView.isHidden = true
        
        self.advisor.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 0.12)
        self.advisor.clipsToBounds = true
        self.advisor.layer.cornerRadius = 12
        self.advisor.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), for: .normal)
        self.advisor.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        Askadvice.layer.shadowColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 0.3835616438)
        Askadvice.layer.shadowOpacity = 1
        Askadvice.layer.shadowRadius = 15
        Askadvice.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        Askadvice.layer.cornerRadius = 15
//        Askadvice.layer.masksToBounds = true
        loadData()
        

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    func loadData(){
        self.showIndeterminateHUD()
        oprition.singleconsultants(id: self.id!) { (err, result) in
            if let result = result{
                self.data.append((result.data)!)
                self.hideHUD()
                for i in self.data{
                        self.name.text = i.name ?? ""
                        self.rating.text = "\(i.rating!)%"
                        self.biography.text = i.biography ?? "لم يضيف المستشارة تفاصيل خاصة به"
                        self.image.kf.setImage(with: URL(string: i.photo!))
                    
//                    if i.category!.count == 1{
//
////                        self.Categ1.text =
//                    }
//                    for i in i.category!{
//
//                    }
                    
                    }
            }else{
                self.showHUD(title: "", details: err?.localizedDescription, hideAfter: 3)
            }
        }
        oprition.feedback(id: self.id!) { (err, result) in
            if result?.meta!.status! == 1 {
                if let result = result{
                    if result.data?.isEmpty == true {
                        self.dataisEmpty = true
                    }
                    for i in result.data!{
                        
                      self.feedback.append(i)
                        self.table2.reloadData()
                    }
                }
            }else{
                self.showHUD(title: "", details: err?.localizedDescription ?? "", hideAfter: 3)
            }
            
        }
        
    }
    

    @IBAction func aboutAdvisor(_ sender: Any) {
        
//        if self.feedback.isEmpty{
//            self.showHUD(title: "", details: "لم يحصل الاستشاري على تقيم بعد", hideAfter: 3)
//        }
        commentView.isHidden = false
        abutAdvView.isHidden = true
        
        
        advisor.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 0.12)
        advisor.clipsToBounds = true
        advisor.layer.cornerRadius = 12
        advisor.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), for: .normal)
        advisor.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        
        Coment.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        Coment.clipsToBounds = true
        Coment.layer.cornerRadius = 12
        Coment.tintColor = #colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1)
        Coment.setTitleColor(#colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1), for: .normal)
        Coment.titleLabel?.font = UIFont(name: "Cairo-Regular", size: 14)
        
    }
    
    
    
    @IBAction func commentButton(_ sender: Any) {
        
        commentView.isHidden = true
        abutAdvView.isHidden = false
        
        
        self.Coment.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 0.12)
        self.Coment.clipsToBounds = true
        self.Coment.layer.cornerRadius = 12
        self.Coment.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), for: .normal)
        self.Coment.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        
        self.advisor.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.advisor.clipsToBounds = true
        self.advisor.layer.cornerRadius = 12
        self.advisor.tintColor = #colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1)
        self.advisor.setTitleColor(#colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1), for: .normal)
        self.advisor.titleLabel?.font = UIFont(name: "Cairo-Regular", size: 14)
   
    }

}
extension abuteConsltentViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == table1{
            return 4
        }else if tableView == table2{
            if self.feedback.count > 0 {
                return self.feedback.count
            }else{
                return 1
            }
            
            ////            return self.feedback.count > 0 ? self.feedback.count : 1
            //        }
            //        else{
            //            return self.feedback.count
            //        }
            
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == table1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! abutelableTableViewCell
            //        let objecr = [indexPath.row]
            //        cell.lable.text = ""
            cell.selectionStyle = .none
            
            return cell
        }
            switch tableView == table2{
                
            case self.feedback.count > 0 :
                let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorCell", for: indexPath) as! AdvisorCell
                
                cell.selectionStyle = .none
                
                //            if self.feedback.count > 0 {
                let object = self.feedback[indexPath.row]
                cell.imageUser.kf.setImage(with: URL(string: object.photo!))
                cell.name.text = object.name!
                cell.feedback.text = object.feedback!
                
                
                return cell
                
            case self.feedback.isEmpty , self.dataisEmpty == true :
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "dataNillTableViewCell", for: indexPath) as! dataNillTableViewCell
                
                cell.label.text = "لم يحصل الاستشاري على تقيم بعد"
                cell.label.font =  UIFont(name: "Cairo-Bold", size: 18)
                cell.selectionStyle = .none
//                cell.imageUser.isHidden = true
//                cell.stackreat.isHidden = true
//                cell.stacknametime.isHidden = true
//                cell.feedback.text = "لم يحصل الاستشاري على تقيم بعد"
//                cell.feedback.font =  UIFont(name: "Cairo-Bold", size: 18)
                
                return cell
            default:
                return UITableViewCell()
            }
            
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if tableView == table1{
            if(indexPath.row % 2 == 0) {
                cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9764705882, blue: 0.9803921569, alpha: 1)
            }else {
                cell.backgroundColor = UIColor.white
            }
            
            
            let verticalPadding: CGFloat = 8
            
            let maskLayer = CALayer()
            maskLayer.cornerRadius = 15
            maskLayer.backgroundColor = UIColor.black.cgColor
            maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
            cell.layer.mask = maskLayer
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == table1{
            return 44
        }else{
            return 110
        }
    }
   
    
}
