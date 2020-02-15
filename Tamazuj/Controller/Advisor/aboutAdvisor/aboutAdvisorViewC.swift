//
//  aboutAdvisorVC.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 14/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class aboutAdvisorViewC: UIViewController {
    
    @IBOutlet var Askadvice: UIButton!
    @IBOutlet weak var Coment: UIButton!
    @IBOutlet weak var advisor: UIButton!
    @IBOutlet var innerView: UIView!
    
    fileprivate var curruntController : UIViewController?
    fileprivate lazy var controllers : [UIViewController] = [
        (self.storyboard?.instantiateViewController(withIdentifier: "aaa"))!,
        self.storyboard?.instantiateViewController(withIdentifier: "commentAdvisorVC") as! commentAdvisorVC
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.addRightButtonOnKeyboard(withText: "ghhh", target: self, action: #selector(back))
        
        Askadvice.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        Askadvice.layer.cornerRadius = 15
        
    }
    @objc func back (){
        self.navigationController?.popViewController(animated: true)
    }
    
    func ChangController (_ number : Int){
       curruntController?.willMove(toParent: nil)
        curruntController?.view.removeFromSuperview()
        
        
        let controller = controllers[number]
        curruntController = controller
        
        /// Add View
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(controller)
        controller.willMove(toParent: self)
        innerView.addSubview(controller.view)
        controller.didMove(toParent: self)
        
        /// Conestrent
        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: innerView.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: innerView.bottomAnchor),
            controller.view.leadingAnchor.constraint(equalTo: innerView.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: innerView.trailingAnchor)
            ])
        view.layoutIfNeeded()
        
        
    }
    
    
    
    @IBAction func aboutAdvisorButton(_ sender: Any) {
        
            commentAdvisorVC.id = 5
//                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "commentAdvisorVC") as! commentAdvisorVC
//                vc.m = 5
//                self.present(vc, animated: true, completion: nil)
        //        UIView.animate(withDuration: 0.3, animations: {
        //            self.aboutAdvisor.alpha = 1
        //            self.comments.alpha = 0.0
        //        })
        //        if aboutAdvisor.alpha == 1 {
        
        ChangController(0)
        
        
        
        advisor.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 0.12)
        advisor.clipsToBounds = true
        advisor.layer.cornerRadius = 12
        advisor.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), for: .normal)
        advisor.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        
        Coment.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        Coment.clipsToBounds = true
        Coment.layer.cornerRadius = 12
        Coment.tintColor = #colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1)
        Coment.setTitleColor(#colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1), for: .normal)
        Coment.titleLabel?.font = UIFont(name: "Cairo-Regular", size: 14)
        
        
    }
    
    
    
    @IBAction func commentButton(_ sender: Any) {
        ChangController(1)
        //        UIView.animate(withDuration: 0.3, animations: {
        //            self.aboutAdvisor.alpha = 0
        //            self.comments.alpha = 1
        //            if self.aboutAdvisor.alpha == 0 {
        self.Coment.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 0.12)
        self.Coment.clipsToBounds = true
        self.Coment.layer.cornerRadius = 12
        self.Coment.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), for: .normal)
        self.Coment.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        
        self.advisor.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.advisor.clipsToBounds = true
        self.advisor.layer.cornerRadius = 12
        self.advisor.tintColor = #colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1)
        self.advisor.setTitleColor(#colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1), for: .normal)
        self.advisor.titleLabel?.font = UIFont(name: "Cairo-Regular", size: 14)
        
        
        
        
        
    }
}
