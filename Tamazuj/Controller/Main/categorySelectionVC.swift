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
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        //        self.title = "اختر مجال الاستشارة"
        
        self.navigationItem.title = "اختر مجال الاستشارة"
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    
}
extension categorySelectionVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if array[section].opened == true {
            return array[section].supdata.count+1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  obj = array[indexPath.section]
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! cateTableViewCell
            cell.categoryIcon.image = obj.image
            cell.cateTitleLable.text = obj.title
            cell.leading.isHidden = true
            cell.traling.isHidden = true
            cell.top.isHidden = true
            if obj.opened == false {
                cell.up.image = #imageLiteral(resourceName: "up")
                cell.viewShadow.shadowColor = #colorLiteral(red: 0.8823529412, green: 0.9098039216, blue: 0.9215686275, alpha: 0.53)

            }else{
                cell.up.image = #imageLiteral(resourceName: "downArrow")
                cell.viewShadow.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

            }
            return cell
        }else{
            let dataIndex = indexPath.row-1
            let cell = tableView.dequeue() as SubCategoryCells
            cell.titleLabel.text = obj.supdata[dataIndex].supCategoryTitle
            cell.leading.isHidden = false
            cell.traling.isHidden = false
            cell.bottom.isHidden = true

            if (indexPath.item == obj.supdata.count){
                cell.bottom.isHidden = false
            }
            return cell
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            
            if array[indexPath.section].opened == true {
                //hide the border
                self.array[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)

            }else{
                //show the border
                self.array[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
                let cell = tableView.cellForRow(at: indexPath) as! cateTableViewCell
                cell.leading.isHidden = false
                cell.traling.isHidden = false
                cell.top.isHidden = false

            }
        }else{
            // go to sup category conaltant selection
            
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            //            for i in 0...array[indexPath.section].supdata.count {
            //                tableView.deselectRow(at: IndexPath(item: i, section: indexPath.section), animated: false)
            //            }
            
            if array[indexPath.section].opened == true {
                self.array[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }else{
                self.array[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
            }
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

