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
    var data:[MyCon] = []
   static var MyData:[MyCon] = []
    var bestRatingdata : [MyCon] = []
    var categorydata : [Ctg] = []
    
    @IBOutlet weak var ConsulationCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data = FilterViewController.data
        print(data)
        ConsulationCollection.register(UINib(nibName: "ConsultationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ConsultationCollectionViewCell")
       
        Operation.getCon { (error, con) in
            if let con = con{
                
                for i in con.data{
                    self.data.append(i)
                    self.ConsulationCollection.reloadData()
                }
            }
        }
        

    }
    
//    viewWillAppear
    override func viewDidAppear(_ animated: Bool) {
      
    }
    
    
//  public  func bestRating(){
//        Operation.getCon { (error, con) in
//            if con != nil{
//                for i in con!.data{
//
//                    self.data.append(i)
//                    self.ConsulationCollection.reloadData()
//
//                }
//                print(con)
//
//            }
//        }
//
//    }
//
//  public  func bestCon()  {
//        Operation.getbestCon { (error, con) in
//            if con != nil{
//                for i in con!.data{
//
//                    self.data.append(i)
//                    self.ConsulationCollection.reloadData()
//
//                }
//        }
//        }
//
//    }
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
    
    //MARK:- functions
    // for navigation transperant

}
extension ConsultationVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConsultationCollectionViewCell", for: indexPath) as! ConsultationCollectionViewCell
        let object = data[indexPath.row]
        let object1 = data[indexPath.row]
          cell.image.kf.setImage(with:URL(string: (object1.photo)!))
          cell.titel.text = object.name
      //  let gat =
//        cell.subTitel.text = object.category
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = ((view.bounds.width - 60)/3)
        return CGSize(width: cellWidth, height: 183)
    }
    
    
}

