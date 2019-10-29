//
//  AdvisorSelectionVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/18/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher

class AdvisorSelectionVC: UIViewController {
    
//    @IBOutlet weak var collectionView: UICollectionView!

    var consaltantData:[data]?
    var indexpathCategory:Int?
    var indexPathSubCat:Int?
    var DataConsultant:sup_category?

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var containar: UIView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3318987191, green: 0.7690466642, blue: 0.812379837, alpha: 1)
        containar.alpha=0
        collectionView.register(UINib(nibName: "sliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sliderCollectionViewCell")
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
        self.navBar.title = "\(DataConsultant?.name_ar ?? "تصنيف")";


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.isNavigationBarHidden = true

    }
    @IBAction func exitNavItem(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //un wind segue
    @IBAction func unwindToConsSelect(segue:UIStoryboardSegue) {
        containar.alpha=0

    }

    

}

extension AdvisorSelectionVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if indexPathSubCat == nil{
            return (DataConsultant?.consultant!.count)!
        }else{
            if (DataConsultant?.consultant!.count) == 0 {
                showHUD(title: "عذرا", details: "لا يوجد مستشارين في هذا التصنيف", hideAfter: 1.5)
            }else{
                return (DataConsultant?.consultant!.count)!

            }
            

        }
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCollectionViewCell", for: indexPath) as! sliderCollectionViewCell
        if indexPathSubCat == nil{
            if let obj = DataConsultant {
                cell.titel.text = obj.consultant![indexPath.row].name
                cell.descriptioN.text = obj.consultant![indexPath.row].biography ?? "no bio"
                cell.imageView.kf.setImage(with: URL(string: obj.consultant![indexPath.row].photo!))
            }
        }else{
            if let obj = DataConsultant?.consultant {
                cell.titel.text = obj[indexPath.row].name
                cell.descriptioN.text = obj[indexPath.row].biography ?? "no bio"
                cell.imageView.kf.setImage(with: URL(string: obj[indexPath.row].photo!))
            }
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellWidth = view.bounds.width
        return CGSize(width: cellWidth, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        containar.alpha=1

    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let stprybord = UIStoryboard(name: "Main", bundle: nil)
//        let vc = stprybord.instantiateViewController(withIdentifier: "AboutAdvisorVC") as! UIViewController
//        UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
//    }
    
    
    
    
}
