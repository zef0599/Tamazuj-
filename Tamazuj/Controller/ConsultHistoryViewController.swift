//
//  ConsultHistoryViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 13/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher
class ConsultHistoryViewController: UIViewController {
    

    var data = [ConsultationRequset.ConsultationData]()
    @IBOutlet weak var tableView: UITableView!
    var navHave:UINavigationController?
    let cellNameIden = "ConsultHistoryCell"
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navHave?.navigationController?.isNavigationBarHidden = false
        navigationController?.isNavigationBarHidden = false
        tableView.register(UINib(nibName: cellNameIden, bundle: nil), forCellReuseIdentifier: cellNameIden)
        navTransparent()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        
        LoadData()
    }
    
    func LoadData()  {
        self.showIndeterminateHUD()
        Operation.getconsultation(Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar") { (ruselt, error) in
            if let ruselt = ruselt{
                 self.hideHUD()
                for data in ruselt.data!{
                   
                    self.data.append(data)
                    self.tableView.reloadData()
                    print(data,"hhhhhh")
                }
                
                print(ruselt)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false

    }
    func cellShadow(cell:UITableViewCell) {
        cell.layer.cornerRadius = 7
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOpacity = 0.19
        cell.layer.shadowRadius = 3
    }
    
    func navTransparent(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    
    
    
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension ConsultHistoryViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellNameIden, for: indexPath) as! ConsultHistoryCell
        cellShadow(cell: cell)
        let object = data[indexPath.row]
        
        cell.nameCon.text = object.consultant_id?.name
        cell.coPhoto.kf.setImage(with: URL(string: (object.consultant_id?.photo)!))
        cell.coStutes.text = object.status
        cell.conTime.text = object.session_time?.time

        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexPath) in
            //TODO: Delete the row at indexPath here
            
        }
        
        
    }

    
    
}
