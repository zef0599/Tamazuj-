//
//  filterVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/18/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class filterVC: UIViewController,DKDropMenuDelegate {
    
    
    func itemSelected(withIndex: Int, name: String) {
        print("\(name) selected");
    }

    @IBOutlet weak var dropDown: DKDropMenu!
    
    @IBOutlet var fullView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown.add(names: ["نسبة الرضى", "good","bad", "exelant"])
        dropDown.delegate = self

    }
    

    @IBAction func exiteBu(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

