//
//  FavoriteVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/11/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher
class FavoriteVC: UIViewController {
    
    var bestConsultantdata : [BestConsultant] = []
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "المستشارون المميزون"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-Regular", size: 16)!,NSAttributedString.Key.foregroundColor : UIColor.black]
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ConsultationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ConsultationCollectionViewCell")
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3318987191, green: 0.7690466642, blue: 0.812379837, alpha: 1)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}
extension FavoriteVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestConsultantdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConsultationCollectionViewCell", for: indexPath) as! ConsultationCollectionViewCell
        let object = self.bestConsultantdata[indexPath.row]
        
        cell.image.kf.setImage(with: URL(string: object.photo!))
        cell.titel.text = object.name!
        
        // MAKR:- object.category
        //TODO:- object.category MOHAMMEDERBIA98
        if let catogery = object.category {
            for i in catogery{
                cell.subTitel.text = i.name_ar ?? "-"
            }
        }
//        for i in object.category{
//            cell.subTitel.text = i.name_ar ?? "-"
//        }
        
        
        //        cell.subTitel.text = object.phone!
        cell.subTitel.textColor = #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1)

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.bounds.width - 106 )/3
        return CGSize(width: width, height: 183)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let stprybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = stprybord.instantiateViewController(withIdentifier: "abuteConsltentViewControllerX") as! abuteConsltentViewControllerX
        let object = self.bestConsultantdata[indexPath.row]
        vc.id = object.id!
        self.navigationController!.pushViewController(vc, animated: true)
    }
    

    
}
