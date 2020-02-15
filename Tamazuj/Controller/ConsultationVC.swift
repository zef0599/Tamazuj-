//
//  ConsultationVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/15/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher
class ConsultationVC: UIViewController {
    static var FilterType:Int = 0
    fileprivate var data : [MyCon] = []
    fileprivate var categorydata : [Ctg] = []
    
    var alert = UIAlertController(title: "الفلتر", message: nil, preferredStyle: .actionSheet)
    @IBOutlet weak var ConsulationCollection: UICollectionView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(ConsultationVC.FilterType)
        ConsulationCollection.register(UINib(nibName: "ConsultationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ConsultationCollectionViewCell")
        
               filter2()
    }
    func filter0(){
        data.removeAll()
        showIndeterminateHUD()
        Operation.filter0 { (error, con) in
            if con != nil{
                for i in con!.data{
                    
                    self.data.append(i)
                    self.ConsulationCollection.reloadData()
                    
                }
            }
        }
        self.hideHUD()
    }
    func filter1(){
        data.removeAll()
        showIndeterminateHUD()
        Operation.filter1 { (error, con) in
            if con != nil{
                for i in con!.data{
                    
                    self.data.append(i)
                    self.ConsulationCollection.reloadData()
                    
                }
              }
            }
        self.hideHUD()
         }
    func filter2(){
        data.removeAll()
        showIndeterminateHUD()
        Operation.filter2 { (error, con) in
            if con != nil{
                for i in con!.data{
                    
                    self.data.append(i)
                    self.ConsulationCollection.reloadData()
                    
                }
            }
        }
        self.hideHUD()
    }

    @IBAction func filter(_ sender: Any) {
        
        let actionSheetController: UIAlertController = UIAlertController(title: "الفلتر", message: nil, preferredStyle: .actionSheet)
        
        // create an action
        let bestRating: UIAlertAction = UIAlertAction(title: "الاكثر تقيما", style: .default) { action -> Void in
         
            print("First Action pressed")
            self.filter0()
        }
        
        let bestcon: UIAlertAction = UIAlertAction(title: "المستشارون المميزون", style: .default) { action -> Void in
            self.filter1()
            print("Second Action pressed")
        }
        let filter: UIAlertAction = UIAlertAction(title: "ترتيب حسب الاسم", style: .default) { action -> Void in
            self.filter2()
            print("Second Action pressed")
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        
        // add actions
        actionSheetController.addAction(bestRating)
        actionSheetController.addAction(bestcon)
          actionSheetController.addAction(filter)
        actionSheetController.addAction(cancelAction)
        
         // present an actionSheet...
        present(actionSheetController, animated: true) {
            print("option menu presented")
        }
        
       
      //   present(actionSheetController, animated: true, completion: nil)   // doesn't work for iPad
        
      //  actionSheetController.popoverPresentationController?.sourceView = ConsultationVC // works for both iPhone & iPad
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func profileUser(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}


extension ConsultationVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConsultationCollectionViewCell", for: indexPath) as! ConsultationCollectionViewCell
        let object = data[indexPath.row]
        cell.titel.text = object.name
        cell.image.kf.setImage(with:URL(string:object.photo!))
//        cell.subTitel.text = object.category
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = ((view.bounds.width - 60)/3)
        return CGSize(width: cellWidth, height: 183)
    }
    
    
}

