//
//  AdvisorDetailsVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/18/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AdvisorDetailsVC: UIViewController {

//    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    var data:[String] = ["حمسون ر.س  -  ثلاثون دقيقة ","حمسون ر.س  -  ثلاثون دقيقة ","حمسون ر.س  -  ثلاثون دقيقة ","حمسون ر.س  -  ثلاثون دقيقة "]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AdvisorTableCell", bundle: nil), forCellReuseIdentifier: "AdvisorTableCell")

        tableView.delegate = self
        tableView.dataSource = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func exite(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        //        navigationController?.popViewController(animated: true)
    }
    

}
extension AdvisorDetailsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorTableCell", for: indexPath) as! AdvisorTableCell
        cell.textLable.text = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

                let stprybord = UIStoryboard(name: "Main", bundle: nil)
                let vc = stprybord.instantiateViewController(withIdentifier: "billNav") as! UINavigationController
        present(vc, animated: true, completion: nil)
//        UIApplication.shared.keyWindow?.rootViewController?.show(vc, sender: Any?)
        //present(vc, animated: true, completion: nil)
                print("segue yousef")

            }



    }

extension UIViewController {
    func showAdvisorDetailsVC() {
        let AdvisorDetails = AdvisorDetailsVC.init(nibName: "AdvisorDetailsVC", bundle: nil)
        //Present
        AdvisorDetails.modalTransitionStyle = .crossDissolve
        AdvisorDetails.modalPresentationStyle = .overCurrentContext
        self.present(AdvisorDetails, animated: true, completion: nil)
    }
    
}
extension UIViewController {
    func showFilterVC() {
        let filterPage = filterVC.init(nibName: "filterVC", bundle: nil)
        //Present
        filterPage.modalTransitionStyle = .crossDissolve
        filterPage.modalPresentationStyle = .overCurrentContext
        present(filterPage, animated: true, completion: nil)
    }


}
