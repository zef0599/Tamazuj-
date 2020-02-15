//
//  CounselingTableViewCell.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 16/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher
class CounselingTableViewCell: UITableViewCell {
    var nav : UINavigationController?
    var categorydata : [Category] = []
    
    
    let data = [
        (titel: "استشارات نفسية" , image : "icon-categ-1"),
        (titel: "استشارات أسرية" , image : "icon-categ-2"),
        (titel: "تطوير الذات" , image : "icon-categ-3"),
        (titel: "استشارات تعليمية" , image : "icon-categ-4"),
        (titel: "السمو بالنفس" , image : "icon-categ-5"),
        (titel: "الاستشارات التربوية" , image : "icon-categ-6"),
        (titel: "التمكين الوظيفي" , image : "icon-categ-7"),
        (titel: "التخلص من العادات السية" , image : "icon-categ-8"),
        (titel: "العلاج السلوكي" , image : "icon-categ-9")
        
    ]
    @IBOutlet var Goconsataione: UIButton!
    @IBOutlet var collection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collection.dataSource = self
        collection.delegate = self
    collection.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
extension CounselingTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource /*,UICollectionViewDelegateFlowLayout*/ {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorydata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        let object = self.categorydata[indexPath.row]
//        let object = data[indexPath.row]
        print(object)
//        #imageLiteral(resourceName: "icon-categ-2.png")
        cell.imageCell.kf.setImage(with: URL(string: object.image!))
        cell.labalCell.text = object.name_ar ?? "non name"
        return cell
    }
    
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if categorydata[indexPath.item].sup_category!.isEmpty{
        let object = self.categorydata[indexPath.row]
        let stprybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = stprybord.instantiateViewController(withIdentifier: "CategoriesDetailsVC") as! CategoriesDetailsVC
        vc.DataConsultant = object.consultant!
        self.nav?.pushViewController(vc, animated: true)
    }else{
        let object = self.categorydata[indexPath.row]
        let stprybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = stprybord.instantiateViewController(withIdentifier: "HomeSupCateVC") as! HomeSupCateVC
        vc.categorydata = self.categorydata
        vc.indexpathCategory = indexPath.item
        //        let m = object.consultant!//object.consultant!
        //        UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
        self.nav?.pushViewController(vc, animated: true)
    }
    

    
        
    }
    
}
