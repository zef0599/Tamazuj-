//
//  SelectTime.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/30/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class SelectTime: UIViewController {

    var delegate:SelectionDelegate?
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.isHidden = true
        image2.isHidden = true
        image3.isHidden = true
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        //        self.navigationController?.navigationBar.isHidden = false

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
        //        self.navigationController?.navigationBar.isHidden = false
    }
    @IBAction func firstBt(_ sender: Any) {
        delegate?.selectionTime(time: "60 دقيقة",minute:60)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func secondBt(_ sender: Any) {
        delegate?.selectionTime(time: "ساعتين",minute:120)
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func thirdBt(_ sender: Any) {
        delegate?.selectionTime(time: "مفتوح",minute:120)
        navigationController?.popViewController(animated: true)

    }
}
