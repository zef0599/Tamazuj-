//
//  AdvConsultHistoryVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AdvConsultHistoryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let cellNameIden = "AdvConsHistoryCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellNameIden, bundle: nil), forCellReuseIdentifier: cellNameIden)
        navTransparent()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }

    func cellShadow(cell:UITableViewCell) {
        cell.layer.cornerRadius = 7
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOpacity = 0.19
        cell.layer.shadowRadius = 3
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func navTransparent(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}
extension AdvConsultHistoryVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellNameIden, for: indexPath) as! AdvConsHistoryCell
        cellShadow(cell: cell)
        return cell
    }
    
    
    
    
}
