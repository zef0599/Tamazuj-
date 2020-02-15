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
    var opened:Bool
    var image:UIImage
    var title:String
    var supdata = [supData]()
    struct supData {
        var supCategoryTitle:String?
    }
}
class categorySelectionVC: UIViewController {
    
    var isSelected:Bool = false
    var CategoriesData = [data]()
    var sectionCellsNumber:[Int]?
    var array:[cellData] = [
        cellData(opened: false, image: #imageLiteral(resourceName: "category_menu_icon4"), title: "استشارات اسريه ", supdata: [
            cellData.supData(supCategoryTitle: "first"),
            cellData.supData(supCategoryTitle: "second"),
            cellData.supData(supCategoryTitle: "third"),
            cellData.supData(supCategoryTitle: "fourth")]),
        cellData(opened: false, image: #imageLiteral(resourceName: "monyGram"), title: "استشارات اسريه ", supdata: [
            cellData.supData(supCategoryTitle: "first"),
            cellData.supData(supCategoryTitle: "second"),
            cellData.supData(supCategoryTitle: "third"),
            cellData.supData(supCategoryTitle: "fourth")]),
        cellData(opened: false, image: #imageLiteral(resourceName: "category_menu_icon4"), title: "استشارات اسريه ", supdata: [
            cellData.supData(supCategoryTitle: "first"),
            cellData.supData(supCategoryTitle: "second"),
            cellData.supData(supCategoryTitle: "third"),
            cellData.supData(supCategoryTitle: "fourth")]),
        cellData(opened: false, image: #imageLiteral(resourceName: "open_icon"), title: "استشارات اسريه ", supdata: [
            cellData.supData(supCategoryTitle: "first"),
            cellData.supData(supCategoryTitle: "second"),
            cellData.supData(supCategoryTitle: "third"),
            cellData.supData(supCategoryTitle: "fourth")]),
        cellData(opened: false, image: #imageLiteral(resourceName: "category_menu_icon4"), title: "استشارات اسريه ", supdata: [
            cellData.supData(supCategoryTitle: "first"),
            cellData.supData(supCategoryTitle: "second"),
            cellData.supData(supCategoryTitle: "third"),
            cellData.supData(supCategoryTitle: "fourth")]
        ),
        cellData(opened: false, image: #imageLiteral(resourceName: "category_menu_icon4"), title: "استشارات اسريه ", supdata: [
            cellData.supData(supCategoryTitle: "first"),
            cellData.supData(supCategoryTitle: "second"),
            cellData.supData(supCategoryTitle: "third"),
            cellData.supData(supCategoryTitle: "fourth")]
        )
    ]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCellNib(cellClass: SubCategoryCells.self)
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
        tableView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "اختر مجال الاستشارة"
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    
}
extension categorySelectionVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return CategoriesData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if CategoriesData[section].opened == true {
            return CategoriesData[section].sup_category.count+1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  obj = CategoriesData[indexPath.section]
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! cateTableViewCell
            
            cell.categoryIcon.kf.setImage(with: URL(string: obj.image!))
            cell.cateTitleLable.text = obj.name_ar
            cell.leading.isHidden = true
            cell.traling.isHidden = true
            cell.top.isHidden = true
            cell.bottom.isHidden = true

            if obj.opened == false {
                cell.up.image = #imageLiteral(resourceName: "up")
                cell.viewShadow.shadowColor = #colorLiteral(red: 0.8823529412, green: 0.9098039216, blue: 0.9215686275, alpha: 0.53)

            }else{
                cell.up.image = #imageLiteral(resourceName: "downArrow")
                cell.viewShadow.shadowColor = #colorLiteral(red: 0.8823529412, green: 0.9098039216, blue: 0.9215686275, alpha: 0.53)
            }
            return cell
        }else{
            let dataIndex = indexPath.row-1
            let cell = tableView.dequeue() as SubCategoryCells
            cell.titleLabel.text = obj.sup_category[dataIndex].name_ar
            cell.leading.isHidden = false
            cell.traling.isHidden = false
            cell.bottom.isHidden = true

            if (indexPath.item == obj.sup_category.count){
                cell.bottom.isHidden = false
            }
            return cell
            
        }
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            

            if CategoriesData[indexPath.section].opened == true {
                //hide the border
                self.CategoriesData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                let cell = tableView.cellForRow(at: indexPath) as! cateTableViewCell
                cell.bottom.isHidden = true


            }else{
                //show the border
                if CategoriesData[indexPath.section].sup_category.count == 0 {
                    
                }else{
                    self.CategoriesData[indexPath.section].opened = true
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                    
                    let cell = tableView.cellForRow(at: indexPath) as! cateTableViewCell
                    cell.leading.isHidden = false
                    cell.traling.isHidden = false
                    cell.top.isHidden = false
                    cell.bottom.isHidden = false
                    if self.CategoriesData[indexPath.section].sup_category.count > 1 {
                        cell.bottom.isHidden = true
                    }

                }


            }
            // go to category consaltant if thire is no sup_Category
            if CategoriesData[indexPath.section].sup_category.count == 0 {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdvisorSelectionVC") as! AdvisorSelectionVC
                let cons = self.CategoriesData
                vc.indexPathSubCat = indexPath.row
                vc.indexpathCategory = indexPath.section
                vc.consaltantData = self.CategoriesData
                vc.consaltantNumSele = indexPath.section
                self.navigationController?.pushViewController(vc, animated: true)


            }
        }else{
            // go to sup category conaltant selection
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdvisorSelectionVC") as! AdvisorSelectionVC
            let cons = self.CategoriesData
            vc.consaltantData = cons
            vc.indexPathSubCat = indexPath.row
            vc.indexpathCategory = indexPath.section
            vc.DataConsultant = self.CategoriesData[indexPath.section].sup_category[indexPath.row-1]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    /**/
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(indexPath)

        if indexPath.row == 0 {
            
//            if CategoriesData[indexPath.section].opened == true {
//                self.CategoriesData[indexPath.section].opened = false
//                let sections = IndexSet.init(integer: indexPath.section)
//                tableView.reloadSections(sections, with: .none)
//            }else{
//                self.CategoriesData[indexPath.section].opened = true
//                let sections = IndexSet.init(integer: indexPath.section)
//                tableView.reloadSections(sections, with: .none)
//
//            }
        }else{
            // go to sup category conaltant selection
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 100
        }else{
            return 43
        }
    }
}
extension UIView {
    
//     Example use: myView.addBorder(toSide: .Left, withColor: UIColor.redColor().CGColor, andThickness: 1.0)
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
}

