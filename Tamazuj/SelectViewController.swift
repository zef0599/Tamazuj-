//
//  SelectViewController.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func User(_ sender: Any) {
        
        WindowManger.show(.main, animated: true)
//        let stprybord = UIStoryboard(name: "Main", bundle: nil)
//        let vc = stprybord.instantiateViewController(withIdentifier: "tabBar1") as! UITabBarController
////        present(vc, animated: true, completion: nil)
////        UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
//     self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Advisor(_ sender: Any) {
        WindowManger.show(.Advisor, animated: true)
//        let stprybord = UIStoryboard(name: "Main", bundle: nil)
//        let vc = stprybord.instantiateViewController(withIdentifier: "tabBar2") as! UITabBarController
//        present(vc, animated: true, completion: nil)
    }
    

}
