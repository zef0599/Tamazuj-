//
//  HomeSupCateVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/16/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher
class HomeSupCateVC: UIViewController {
    var categorydata : [Category] = []
    var indexpathCategory:Int?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = categorydata[indexpathCategory!].name_ar
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3318987191, green: 0.7690466642, blue: 0.812379837, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

}
extension HomeSupCateVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorydata[indexpathCategory!].sup_category!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! cateTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let obj = categorydata[indexpathCategory!].sup_category![indexPath.row]
        cell.cateTitleLable.text = obj.name_ar
        cell.categoryIcon.kf.setImage(with:URL(string: obj.image!))
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let stprybord = UIStoryboard(name: "Main", bundle: nil)
                let object = self.categorydata[indexPath.row]
                let vc = stprybord.instantiateViewController(withIdentifier: "CategoriesDetailsVC") as! CategoriesDetailsVC
                vc.DataConsultant = object.consultant!
        vc.navTitle = self.categorydata[indexpathCategory!].sup_category![indexPath.row].name_ar
                self.navigationController?.pushViewController(vc, animated: true)

    }
    


}
