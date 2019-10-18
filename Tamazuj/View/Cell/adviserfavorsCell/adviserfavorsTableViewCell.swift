//
//  adviserfavorsTableViewCell.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 16/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher

class adviserfavorsTableViewCell: UITableViewCell {
    var nav : UINavigationController?
    var bestConsultantdata : [BestConsultant] = []
    @IBOutlet var collection: UICollectionView!
    @IBOutlet weak var arrowButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "ConsultationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ConsultationCollectionViewCell")
    }
    
    @IBAction func showAll(_ sender: Any) {
        let stprybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = stprybord.instantiateViewController(withIdentifier: "FavoriteVC") as! FavoriteVC
        vc.bestConsultantdata = self.bestConsultantdata
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension adviserfavorsTableViewCell : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.bestConsultantdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConsultationCollectionViewCell", for: indexPath) as! ConsultationCollectionViewCell
        let object = self.bestConsultantdata[indexPath.row]
        
        cell.image.kf.setImage(with: URL(string: object.photo!))
        cell.titel.text = object.name!
        
        for i in object.category!{
           cell.subTitel.text = i.name_ar!
        }
//        cell.subTitel.text = object.phone!
        cell.subTitel.textColor = #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1)
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let stprybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = stprybord.instantiateViewController(withIdentifier: "abuteConsltentViewController") as! abuteConsltentViewController
        let object = self.bestConsultantdata[indexPath.row]
        vc.id = object.id!
        self.nav?.pushViewController(vc, animated: true)
//        UIApplication.shared.keyWindow?.rootViewController?.navigationController?.pushViewController(vc, animated: true)
        
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let yourViewController = storyboard.instantiateViewController(withIdentifier: "id")  as! UINavigationController
//
//        let navigationController = self.window?.rootViewController as! UINavigationController
//        navigationController.pushViewController(yourViewController, animated: true)
//
        
        
        
    }

    
    
}
