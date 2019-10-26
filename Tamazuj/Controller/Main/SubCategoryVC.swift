//
//  SubCategoryVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/11/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class SubCategoryVC: UIViewController {
    var supCategoryData:[sup_category] = []
    var consaltantData:[data]?
    var indexpathCategory:Int?
//    var indexpathSubCategory:Int?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let backImage = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        self.navigationController?.navigationBar.topItem?.title = ""
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3318987191, green: 0.7690466642, blue: 0.812379837, alpha: 1)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = consaltantData![indexpathCategory!].name_ar
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! AdvisorSelectionVC
        let indexPathSubCat = tableView.indexPathForSelectedRow
        let cons = self.consaltantData
        vc.consaltantData = cons
        vc.indexpathCategory = indexpathCategory
        vc.indexPathSubCat = indexPathSubCat?.row
        

    }
    


}
extension SubCategoryVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.consaltantData![indexpathCategory!].sup_category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! cateTableViewCell
        //        let obj = array[indexPath.row]
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let obj = consaltantData![indexpathCategory!].sup_category[indexPath.row]
        cell.cateTitleLable.text = obj.name_ar
        cell.categoryIcon.kf.setImage(with:URL(string: obj.image!))
        return cell
    }
}
