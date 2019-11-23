//
//  SearchViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 13/11/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher
class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var searshBar: UISearchBar!
    var photo:[searchModel] = []
   // var Gategory:
    var filtersaerch = [searchdata]()
    var searchingdata = [searchdata]()
    var datasaerch:[searchdata] = []
    var Issearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(filtersaerch)
        collectionview.register(UINib(nibName: "ConsultationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "searshCollectionCell")
        searshBar.delegate = self
        searshBar.returnKeyType = UIReturnKeyType.done
    
        
        Operation.search() { (error, searchData) in
            if searchData != nil {
                for i in (searchData?.data!)!{
                 self.datasaerch.append(i)
                 self.collectionview.reloadData()
                }
//    for i in searchData?.data.
                
            }
        }
    }

    
}

extension SearchViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if Issearching == true{
            return filtersaerch.count
        }
        else
        {
            return datasaerch.count}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searshCollectionCell", for: indexPath) as! ConsultationCollectionViewCell
        if Issearching{
            let obiect = filtersaerch[indexPath.row]
            cell.titel.text = obiect.name
//            let objectphoto = photo[indexPath.row]
//            cell.image.kf.setImage(with:URL(string: objectphoto.photo!))

         //   cell.subTitel.text =
        }
        else{
            let obiect = datasaerch [indexPath.row]
            cell.titel.text = obiect.name
        //    let object =  photo[indexPath.row]
            
      //      cell.image.kf.setImage(with:URL(string:photo!))

//            let objectphoto = photo[indexPath.row]
//            //
            
            
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = ((view.bounds.width - 60)/3)
        return CGSize(width: cellWidth, height: 183)
    }
    
}

extension SearchViewController:UISearchBarDelegate{
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
             Issearching = false
            self.collectionview.reloadData()
            return
        }
        
        filtersaerch = datasaerch.filter({ (searchtext) -> Bool in
            (searchtext.name?.contains(searchText))!
        })
        print(filtersaerch)
        Issearching = true
        self.collectionview.reloadData()
    }
}
