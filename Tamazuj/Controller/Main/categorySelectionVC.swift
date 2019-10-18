//
//  categorySelectionVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/15/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher

struct cellData {
    var image:UIImage
    var title:String
}
class categorySelectionVC: UIViewController {
    
    
    var CategoriesData = [data]()
    var array:[cellData] = [
        cellData(image: #imageLiteral(resourceName: "category_menu_icon4"), title: "استشارات اسريه "),
        cellData(image: #imageLiteral(resourceName: "category_menu_icon4"), title: "استشارات اسريه "),
        cellData(image: #imageLiteral(resourceName: "category_menu_icon4"), title: "استشارات اسريه "),
        cellData(image: #imageLiteral(resourceName: "category_menu_icon4"), title: "استشارات اسريه "),
        cellData(image: #imageLiteral(resourceName: "category_menu_icon4"), title: "استشارات اسريه "),
        cellData(image: #imageLiteral(resourceName: "category_menu_icon4"), title: "استشارات اسريه ")]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        showIndeterminateHUD()
        Operation.getCategory { (error, result) in
            if let result = result {
                self.CategoriesData.append(contentsOf: result.data!)
                self.tableView.reloadData()
                self.hideHUD()
            }else{
                self.showHUD(title: "Error", details: "Some Error", hideAfter: 3)
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "supCat" {
            let vc = segue.destination as! SubCategoryVC
            let indexPath = tableView.indexPathForSelectedRow
            let cons = self.CategoriesData
            vc.consaltantData = cons
            vc.indexpathCategory = indexPath!.row
        }else{
            let vc = segue.destination as! AdvisorSelectionVC
            let indexPath = tableView.indexPathForSelectedRow
            let cons = self.CategoriesData
            vc.consaltantData = cons
            vc.indexpathCategory = indexPath?.row

        }
    }
    
    
}
extension categorySelectionVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoriesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! cateTableViewCell
        //        let obj = array[indexPath.row]
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let obj = CategoriesData[indexPath.item]
        cell.cateTitleLable.text = obj.name_ar
        cell.categoryIcon.kf.setImage(with:URL(string: obj.image!))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.CategoriesData[indexPath.row].sup_category.isEmpty == false {
            performSegue(withIdentifier: "supCat", sender: Any?.self)
        }else{
            performSegue(withIdentifier: "Consalt", sender: Any?.self)
        }
    }
}
