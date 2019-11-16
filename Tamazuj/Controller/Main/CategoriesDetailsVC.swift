//
//  chooseConsaltVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/17/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher

class CategoriesDetailsVC: UIViewController {
    
    var DataConsultant : [Category.Consultant]?
    var navTitle:String?
    
    @IBOutlet var nav: UINavigationItem!
    @IBOutlet weak var navToMyConsaltion: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nav.title = navTitle

        self.navigationItem.title = navTitle
        
        collectionView.register(UINib(nibName: "sliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sliderCollectionViewCell")

        collectionView.delegate = self
        collectionView.dataSource = self
        print(DataConsultant as Any)
        if DataConsultant?.count == 0 {
            showHUD(title: "عذرا", details: "لا يوجد مستشارين في هذا التصنيف", hideAfter: 1.5)
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func filter(_ sender: Any) {
//        showFilterVC()
    }
    @IBAction func backNavItem(_ sender: Any) {
      self.navigationController?.popViewController(animated: true)
    }
}


extension CategoriesDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if DataConsultant == nil  {
            return 0
        }else{
            return DataConsultant!.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCollectionViewCell", for: indexPath) as! sliderCollectionViewCell
        let object = DataConsultant![indexPath.row]
        cell.requestConsaltation.addTarget(self, action: #selector(Askadviceactione), for: .touchUpInside)

        cell.imageView.kf.setImage(with: URL(string: object.photo!))
        cell.titel.text = object.name ?? "name Error"//object.name!
        cell.descriptioN.text =  object.biography ?? "biography Error" //object.email! + "\n" + object.phone!
//        > 0 ? 3 : 0
        return cell
        
    }
    @objc func Askadviceactione (){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RequistConsaltationVC") as! RequistConsaltationVC
        self.navigationController!.pushViewController(vc, animated: true)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellWidth = view.bounds.width
        return CGSize(width: cellWidth, height: 170)
    }
   
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let stprybord = UIStoryboard(name: "Main", bundle: nil)
            let vc = stprybord.instantiateViewController(withIdentifier: "RequistConsaltationVC") as! RequistConsaltationVC
            self.navigationController?.pushViewController(vc, animated: true)
    }

}
