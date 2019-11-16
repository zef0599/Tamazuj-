//
//  SelectLangVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/27/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
protocol StringDelegat {
    func langugeDelegate(languge:String)
}
class SelectLangVC: UIViewController {

    var delegate:StringDelegat?
    override func viewDidLoad() {
        super.viewDidLoad()
        selectSA.isHidden = true
        selectUSA.isHidden = true
    }
    
    @IBOutlet weak var selectSA: UIImageView!
    @IBOutlet weak var selectUSA: UIImageView!
    
    @IBAction func save(_ sender: Any) {
        var languge:String = ""
        if selectSA.isHidden == false {
            languge.append(contentsOf: "العربية")
        }
        if (selectSA.isHidden == false && selectUSA.isHidden == false){
            languge.append(contentsOf: "-")
        }
        if selectUSA.isHidden == false {
            languge.append(contentsOf: "English")
        }
        delegate?.langugeDelegate(languge: languge)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func exite(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func arabicBt(_ sender: Any) {
        selectSA.isHidden = !selectSA.isHidden
    }
    @IBAction func english(_ sender: Any) {
        selectUSA.isHidden = !selectUSA.isHidden

    }
}
