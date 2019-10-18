//
//  ReciewsContainer.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/16/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class ReviewsContainer: UIViewController {

    
    
//    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("ReviewsContainer = \(AboutAdvisorVC.idUser)")
//        self.navigationItem.hidesBackButton = true
//        self.navigationController?.isNavigationBarHidden = true
//        self.navigationItem.setHidesBackButton(true, animated: true)
        
        tableView.register(UINib(nibName: "AdvisorCell", bundle: nil), forCellReuseIdentifier: "AdvisorCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
//    @IBAction func back(_ sender: Any) {
//       self.navigationController?.popViewController(animated: true)
//    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension ReviewsContainer:UITableViewDelegate,UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorCell", for: indexPath) as! AdvisorCell

        return cell
    }


}
