//
//  FilterViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 17/11/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    var FbestRating:[MyCon] = []
    static var data:[MyCon] = []
     var Fbestcon:[MyCon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
   
    @IBAction func exite(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func sbmite(_ sender: Any) {
      
    }
    
    @IBAction func bestRating(_ sender: Any) {
        

//            Operation.getCon { (error, con) in
//                if con != nil{
//                    for i in con!.data{
//                        self.FbestRating.append(i)
//                        FilterViewController.data = self.FbestRating
//                            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ConsultationVC") as! ConsultationVC
//
//                        }
//
//
//
//            }
//                }
//
//
        
    }
    
   
    @IBAction func bestCon(_ sender: Any) {
      //  ConsultationVC.bestCon(Con)
      //  bestCon(self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
