//
//  CategoriesVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/14/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher

struct collectionData {
    var image:UIImage
    var title:String
}

class CategoriesVC: UIViewController {
    //MARK:- Proprites
    var dataArray:[collectionData] = [
        collectionData(image: #imageLiteral(resourceName: "category_menu_icon3"), title: "استشارات نفسية"),
        collectionData(image: #imageLiteral(resourceName: "category_menu_icon3"), title: "استشارات نفسية"),
        collectionData(image: #imageLiteral(resourceName: "category_menu_icon3"), title: "استشارات نفسية"),
        collectionData(image: #imageLiteral(resourceName: "category_menu_icon3"), title: "استشارات نفسية"),
        collectionData(image: #imageLiteral(resourceName: "category_menu_icon3"), title: "استشارات نفسية"),
        collectionData(image: #imageLiteral(resourceName: "category_menu_icon3"), title: "استشارات نفسية"),
        collectionData(image: #imageLiteral(resourceName: "category_menu_icon3"), title: "استشارات نفسية"),
        collectionData(image: #imageLiteral(resourceName: "category_menu_icon3"), title: "استشارات نفسية"),
        collectionData(image: #imageLiteral(resourceName: "category_menu_icon3"), title: "استشارات نفسية")]
    var CategoriesData = [data]()
    var performing:Bool?
//    var DataConsultant : [data.Consultant] = []

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "مجالات الاستشارة"
        
        
        navTransparent()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.showIndeterminateHUD()
        Operation.getCategory { (error, result) in
            
            if let result = result {
                self.CategoriesData.append(contentsOf: result.data!)
                
                
                
                self.collectionView.reloadData()
                self.hideHUD()
            }else{
                self.showHUD(title: "Error", details: "Some Error", hideAfter: 3)
            }
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "مجالات الاستشارة"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    @IBAction func profileUser(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK:- functions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        if self.performing! {
            if segue.identifier == "tosup" {
                let vc = segue.destination as! SubCategoryVC
                let indexPath = collectionView.indexPathsForSelectedItems?.first
                let cons = self.CategoriesData
                vc.consaltantData = cons
                vc.indexpathCategory = indexPath?.row
            }
        }

    }

    
    // for navigation transperant
    func navTransparent(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    //shadow to cell
    func cellShadow(cell:UICollectionViewCell) {
        cell.layer.cornerRadius = 7
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOpacity = 0.19
        cell.layer.shadowRadius = 3
        
    }
    
    
    //MARK:- Handler
}
extension CategoriesVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return CategoriesData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if CategoriesData[indexPath.item].sup_category.isEmpty{
            self.performing = false
        }else{
            self.performing = true
            
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as!  CategoriesCollectionVCell
        
        let obj = CategoriesData[indexPath.item]
        cellShadow(cell:cell)
        cell.imageView.kf.setImage(with:URL(string: obj.image!))
        cell.titleLabel.text = obj.name_ar
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (view.bounds.width - 60)/3
        return CGSize(width:cellWidth , height:cellWidth )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if CategoriesData[indexPath.item].sup_category.isEmpty{

            let stprybord = UIStoryboard(name: "Main", bundle: nil)
            let object = self.CategoriesData[indexPath.row]
            
            let vc = stprybord.instantiateViewController(withIdentifier: "CategoriesDetailsVC") as! CategoriesDetailsVC
            
            vc.DataConsultant = object.consultant!
            //        let m = object.consultant!//object.consultant!
            UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
        }else{
            self.performing = true
        }

    }
    
}
