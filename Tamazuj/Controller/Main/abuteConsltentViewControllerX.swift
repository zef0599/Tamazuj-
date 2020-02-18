//
//  abuteConsltentViewController.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 16/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher




class abuteConsltentViewControllerX: UIViewController {
    
    
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RequistConsaltationVCX") as! RequistConsaltationVCX

    
    let source = ["استشارات تعليمي","استشارات تعليمي"]
    
    
    var id : Int?
    var consaltantRating : Int?
    var reqData:Single?
    
    
    var dataisEmpty : Bool!
//    var category : [Single] = []
    var data : [ConsaltantData] = []
    var Alldata : [ConsaltantData] = []
    var feedback : [dataFedback] = []
    @IBOutlet var Coment: UIButton!
    @IBOutlet var advisor: UIButton!
    
    @IBOutlet var abutAdvView: UIView!
    @IBOutlet var commentView: UIView!
    @IBOutlet var Askadvice: UIButton!
    
    @IBOutlet var iconCountry: UIImageView!
    @IBOutlet var nameLanguage: UILabel!
    /////  category
    @IBOutlet var collectionConsaltent: UICollectionView!
    //// constraint collection
    @IBOutlet var constraintcollection: NSLayoutConstraint!
    
    //
    @IBOutlet var name: UILabel!
    @IBOutlet var rating: UILabel!
    @IBOutlet var biography: UITextView!
    @IBOutlet var image: UIImageView!
    
    //    @IBOutlet var table1: UITableView!
    @IBOutlet var table2: UITableView!
    
    
    ///// stack language
    @IBOutlet var stackArabec: UIStackView!
    @IBOutlet var stackEnglish: UIStackView!
    @IBOutlet var stackgermany: UIStackView!
    
    
    
    func configure(with arr: [String]) {
    }
    
    //    let layout = CustomFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.id,"iddddddddddd")
        collectionConsaltent.register(UINib(nibName: "abutAdvCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "abutAdvCollectionViewCell")
        self.stackArabec.isHidden = true
        self.stackEnglish.isHidden = true
        self.stackgermany.isHidden = true
        
        
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
        print(reqData)
        configure(with: ["1","2"])
        
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
        guard  let id = self.id else {return}
        Operation.getSingle(id:id) {[weak self] (error,result) in
            guard let self = self else { return }
            if let resultt = result {
                self.reqData = resultt
                self.vc.reqData = resultt
                print(self.reqData?.data.category?.count,"self.reqData?.data.category")
                self.name.text = self.reqData?.data.name ?? "--"
                self.rating.text = "\(self.consaltantRating ?? 0)%"
                self.biography.text = self.reqData?.data.biography ?? "لم يضيف المستشارة تفاصيل خاصة به"
                self.image.kf.setImage(with: URL(string: (self.reqData?.data.photo!)!))
                self.collectionConsaltent.reloadData()
                print(self.reqData,"sadasdasd")

            }
            self.hideHUD()

        }
        
        oprition.feedback(id: self.id!) { (err, result) in
            if result?.meta!.status! == 1 {
                
                if let result = result{
                    if result.data?.isEmpty == true {
                        self.dataisEmpty = true
                    }else{
                        for i in result.data!{
                            self.feedback.append(i)
                            self.table2.reloadData()
                        }
                    }
                    
                }
            }else{
                self.showHUD(title: "", details: err?.localizedDescription ?? "", hideAfter: 3)
            }
            
        }
        
    }
    // askConaltion
    @IBAction func askConaltion(_ sender: Any) {
        
        vc.reqData = self.reqData
        vc.Alldata = self.Alldata
        vc.data = self.data
        vc.selectedConsaltantId = self.id
        if reqData?.data.category?.count == 0 {
            print(reqData?.data.category,"category = nil")
        }else{
            vc.fillData()
        }

        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // aboutAdvisor
    @IBAction func aboutAdvisor(_ sender: Any) {
        
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
    
    
    // commentButton
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
extension abuteConsltentViewControllerX : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == table2{
            if self.feedback.count > 0 {
                return self.feedback.count
            }else{
                return 1
            }
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView == table2{
            
        case self.feedback.count > 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorCell", for: indexPath) as! AdvisorCell
            
            cell.selectionStyle = .none
            
            
            let object = self.feedback[indexPath.row]
            cell.imageUser.kf.setImage(with: URL(string: object.photo!))
            cell.name.text = object.name!
            cell.feedback.text = object.feedback!
            cell.time.text = object.time_rating
            
            switch object.ratting {
            case 0:
                cell.icon.image = #imageLiteral(resourceName: "zero")
                cell.nameicon.text = "سيئ"
            case 1:
                cell.icon.image = #imageLiteral(resourceName: "zero")
                cell.nameicon.text = "سيئ"
            case 2:
                cell.icon.image = #imageLiteral(resourceName: "deslike")
                cell.nameicon.text = "عادي"
            case 3:
                cell.icon.image = #imageLiteral(resourceName: "Group 1379")
                cell.nameicon.text = "جيد"
            case 4:
                cell.icon.image = #imageLiteral(resourceName: "like")
                cell.nameicon.text = "جيد جدا"
            case 5:
                cell.icon.image = #imageLiteral(resourceName: "perfect")
                cell.nameicon.text = "ممتاز"
            default:
                break
            }
            
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
    //    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    //    {
    ////        if tableView == table1{
    ////            if(indexPath.row % 2 == 0) {
    ////                cell.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9803921569, blue: 0.9843137255, alpha: 1)
    ////            }else {
    ////                cell.backgroundColor = UIColor.white
    ////            }
    ////
    ////
    ////            let verticalPadding: CGFloat = 8
    ////
    ////            let maskLayer = CALayer()
    ////            maskLayer.cornerRadius = 15
    ////            maskLayer.backgroundColor = UIColor.black.cgColor
    ////            maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
    ////            cell.layer.mask = maskLayer
    ////        }
    //    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
}

extension abuteConsltentViewControllerX:UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        guard  let count = self.reqData?.data.category?.count else {return 0}
        if let count = self.reqData?.data.category?.count {
            print(count,"/n/n/n/n the count")
            return (count)//self.category.count

        }else{
            return 0

        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "abutAdvCollectionViewCell", for: indexPath) as! abutAdvCollectionViewCell
        
        //        cell.setData(data: source[indexPath.item])
        cell.titel.text = self.reqData?.data.category?[indexPath.row].name_ar
        
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        switch self.source.count {
        case 1,2:
            self.constraintcollection.constant = 40
        case 3,4:
            self.constraintcollection.constant = 75
        case 5,6:
            self.constraintcollection.constant = 95
        default:
            self.constraintcollection.constant = 10
        }
    }
    
}






