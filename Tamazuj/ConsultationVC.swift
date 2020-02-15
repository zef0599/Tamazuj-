//
//  ConsultationVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/15/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class ConsultationVC: UIViewController {

    @IBOutlet weak var ConsulationCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        ConsulationCollection.register(UINib(nibName: "ConsultationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ConsultationCollectionViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        //        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        //        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.isNavigationBarHidden = false
        
    }

    @IBAction func toProfile(_ sender: Any) {
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
//        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
   
    
    //MARK:- functions
    // for navigation transperant

}
extension ConsultationVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConsultationCollectionViewCell", for: indexPath) as! ConsultationCollectionViewCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = ((view.bounds.width - 60)/3)
        return CGSize(width: cellWidth, height: 183)
    }
    
    
}

