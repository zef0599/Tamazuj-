//
//  HomeAdvisorViewController.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 19/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class HomeAdvisorViewController: UIViewController {

    @IBOutlet var tabel: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabel.rowHeight = UITableView.automaticDimension
        tabel.estimatedRowHeight = 500
        tabel.register(UINib(nibName: "AdvisorTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvisorTableViewCell")
    }


}
extension HomeAdvisorViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorTableViewCell", for: indexPath) as! AdvisorTableViewCell
        
        return cell
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
////        tableView.layer.
//        return "طلبات الاستشارة"
//        
//    }
 
}
