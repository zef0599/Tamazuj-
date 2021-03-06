//
//  ChooseConsaltantVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 11/3/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class ChooseConsaltantVC: UIViewController {
    var allConsaltant : [Category.Consultant] = []
    var navTitle:String?
    var delegate:SelectionDelegate?

    @IBOutlet var nav: UINavigationItem!
    @IBOutlet weak var navToMyConsaltion: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nav.title = navTitle
        
        
        if allConsaltant.isEmpty {
            self.showHUD(title: "", details:  "لا يوجد مستشارين ", hideAfter: 3)
        }
//        showIndeterminateHUD() //here

//        Operation.getAllConsaltants { (error, result) in
//            if let result = result {
//                self.hideHUD() //here
//                self.allConsaltant = result
//                self.collectionView.reloadData()
//            }
//        }
        
        self.navigationItem.title = navTitle
        
        collectionView.register(UINib(nibName: "sliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sliderCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if allConsaltant.isEmpty {
            self.showHUD(title: "", details:  "لا يوجد مستشارين ", hideAfter: 3)
        }
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

extension ChooseConsaltantVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if allConsaltant?.ConsaltantData?.count == nil {
//            return 0
//        }else{
//            return (allConsaltant?.ConsaltantData!.count)!
//        }
        
        return self.allConsaltant.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCollectionViewCell", for: indexPath) as! sliderCollectionViewCell
        let object = allConsaltant[indexPath.row]
        cell.requestConsaltation.addTarget(self, action: #selector(Askadviceactione), for: .touchUpInside)
        cell.imageView.kf.setImage(with: URL(string: (object.photo)!))
        cell.titel.text = object.name ?? "name Error"//object.name!
        cell.descriptioN.text =  object.biography ?? "biography Error" //object.email! + "\n" + object.phone!
        //        > 0 ? 3 : 0
        return cell
        
    }
    @objc func Askadviceactione (){
        let stprybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = stprybord.instantiateViewController(withIdentifier: "RequistConsaltationVC") as! RequistConsaltationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellWidth = view.bounds.width
        return CGSize(width: cellWidth, height: 170)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //  go back to the selection bage and do the change
        let object = allConsaltant[indexPath.row]
        delegate?.selectionConsaltntReady(consaltant: object)
//delegate?.selectionConsaltntReady(consaltant:(allConsaltant.ConsaltantData![indexPath.item])!)
        self.navigationController?.popViewController(animated: true)
    }
}
