//
//  billsVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/18/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class billsVC: UIViewController {
    var price:Int?
    var consulting_id:Int?
    var payment_method:String?
    var billData:Bill?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func payBills(_ sender: Any) {
                Operation.bill(price: price ?? 0, consulting_id: consulting_id ?? 00, payment_method: "visa") { (error, result) in
                    if let result = result {
                        self.billData = result
                        print(self.billData)
                    }
                }
                
        //        showPaymentPopup()

    }

}
