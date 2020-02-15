//
//  PaymentPopupVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/18/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class PaymentPopupVC: UIViewController {

    var data:[UIImage] = [#imageLiteral(resourceName: "sadad"),#imageLiteral(resourceName: "mada"),#imageLiteral(resourceName: "visaCard"),#imageLiteral(resourceName: "monyGram")]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "paymenCollectionCell", bundle: nil), forCellWithReuseIdentifier: "paymenCollectionCell")
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    @IBAction func exiteButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    


}
extension PaymentPopupVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "paymenCollectionCell", for: indexPath) as! paymenCollectionCell
        cell.imageView.image = data[indexPath.row]
        cell.cornerRadius = 7
        cell.borderColor = #colorLiteral(red: 0.968627451, green: 0.9764705882, blue: 0.9803921569, alpha: 1)
        cell.borderWidth = 1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width-38)/2
        let cellHight = (collectionView.bounds.height)/2
        return CGSize(width: cellWidth, height: cellHight)
    }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let stprybord = UIStoryboard(name: "Main", bundle: nil)
            let vc = stprybord.instantiateViewController(withIdentifier: "nav3") as! UINavigationController
            present(vc, animated: true, completion: nil)
//            UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
        }
    
    
}
extension UIViewController {
    func showPaymentPopup() {
        let paymentPopupVC = PaymentPopupVC.init(nibName: "PaymentPopupVC", bundle: nil)
        //Present
        paymentPopupVC.modalTransitionStyle = .crossDissolve
        paymentPopupVC.modalPresentationStyle = .overCurrentContext
        self.present(paymentPopupVC, animated: true, completion: nil)
    }
    
}
