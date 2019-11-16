//
//  ChooseCategoryVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 11/2/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
// ChooseCategoryVC


import UIKit
import Kingfisher
protocol SelectionDelegate {
    func selectionReady(category: data, supName: String,supId:Int)
    func selectionReady(category:data)
    func selectionConsaltntReady(consaltant:ConsaltantData)
    func selectionTime(time:String,minute:Int)
    func selectionComunicationTool(contact:contactData)
}
extension SelectionDelegate {
    func selectionReady(category: data, supName: String,supId:Int){}
    func selectionReady(category:data){}
    func selectionConsaltntReady(consaltant:ConsaltantData){}
    func selectionTime(time:String,minute:Int){}
    func selectionComunicationTool(contact:contactData){}

}
class ChooseCategoryVC: UIViewController {
    
    var isSelected:Bool = false
    var CategoriesData = [data]()
    var delegate:SelectionDelegate?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCellNib(cellClass: SubCategoryCells.self)
//        self.navigationItem.backBarButtonItem?.title =  ""
        
        
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
        self.navigationItem.title = "اختر مجال الاستشارة"
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    
}
extension ChooseCategoryVC: UITableViewDelegate,UITableViewDataSource {
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
                cell.viewShadow.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
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
                let cell = tableView.cellForRow(at: indexPath) as! cateTableViewCell

                self.CategoriesData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                cell.bottom.isHidden = true

                
            }else{
                //show the border
                if CategoriesData[indexPath.section].sup_category.count == 0 {
                    //go back and sent the data to selection
                    
                    self.delegate?.selectionReady(category: CategoriesData[indexPath.section])

//                    if CategoriesData[indexPath.section].sup_category[indexPath.row].name_ar != nil {
//                        if CategoriesData[indexPath.section].sup_category.count > 0 {
//                            self.delegate?.selectionReady(category: CategoriesData[indexPath.section],supName:CategoriesData[indexPath.section].sup_category[indexPath.row].name_ar!)
//                        }
//                        self.delegate?.selectionReady(category: CategoriesData[indexPath.section],supName:"")
//                    }else{
//                        self.delegate?.selectionReady(category: CategoriesData[indexPath.section],supName:"")
//                    }


                    self.navigationController?.popViewController {
                    }
                    print("go back with category name")
                }else{
                    //show the border
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
        }else{
            // retern sup category name to the selection
            if CategoriesData[indexPath.section].sup_category.count > 0  {
                let category = self.CategoriesData[indexPath.section]
                let supName = self.CategoriesData[indexPath.section].sup_category[indexPath.row-1].name_ar!
                let supId = self.CategoriesData[indexPath.section].sup_category[indexPath.row-1].id!
                self.delegate?.selectionReady(category: category, supName:supName,supId:supId)

            }else{
                self.delegate?.selectionReady(category: CategoriesData[indexPath.section])
            }

            self.navigationController?.popViewController(animated: true)
            print("go back with category and sup name ")

        }
    }
    /**/
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        if indexPath.row == 0 {
            
            if CategoriesData[indexPath.section].opened == true {
                self.CategoriesData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }else{
                self.CategoriesData[indexPath.section].opened = true
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
