//
//  ChooseConsaltantVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 11/3/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit



class ChooseConsaltantVCX: UIViewController {
    var reqData:Single?
    var isSupCategoryExiest:Bool?
    var consaltants:[datatestme.Consultant]?
    //    var allConsaltant : Consaltant?
    var navTitle:String?
    var delegate:SelectionDelegateX?
    
    @IBOutlet var nav: UINavigationItem!
    @IBOutlet weak var navToMyConsaltion: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nav.title = navTitle
        if isSupCategoryExiest == true {
            if let dataExist =  reqData?.data.sup_category {
                for i in dataExist {
                    self.consaltants = i.consultant
                }
            }
        }else{
            if let dataExist =  reqData?.data.category {
                for i in dataExist {
                    self.consaltants = i.consultant
                }
            }
        }
        self.navigationItem.title = navTitle
        collectionView.register(UINib(nibName: "sliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sliderCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
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

extension ChooseConsaltantVCX: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if consaltants == nil {
            return 0
        }else{
            return consaltants!.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if reqData?.data.category?[0].consultant?.count == nil {
            return UICollectionViewCell()
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCollectionViewCell", for: indexPath) as! sliderCollectionViewCell
            let object = consaltants![indexPath.row]
//                reqData?.data.category?[0].consultant![indexPath.row]
            cell.requestConsaltation.addTarget(self, action: #selector(Askadviceactione), for: .touchUpInside)
            cell.imageView.kf.setImage(with: URL(string: (object.photo!)))
            cell.titel.text = object.name ?? "name Error"//object.name!
            cell.descriptioN.text =  object.biography ?? "biography Error" //object.email! + "\n" + object.phone!
            //        > 0 ? 3 : 0
            return cell
            
        }
        
    }
    @objc func Askadviceactione (){
        let stprybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = stprybord.instantiateViewController(withIdentifier: "RequistConsaltationVCX") as! RequistConsaltationVCX
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellWidth = view.bounds.width
        return CGSize(width: cellWidth, height: 170)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //  go back to the selection bage and do the
        
        let object = consaltants?[indexPath.row].id!
        let objectModel = consaltants?[indexPath.row]
        
        delegate?.selectionConsaltntReady(consaltantId: object!,conaltantModel:objectModel!)
        self.navigationController?.popViewController(animated: true)
    }
}
