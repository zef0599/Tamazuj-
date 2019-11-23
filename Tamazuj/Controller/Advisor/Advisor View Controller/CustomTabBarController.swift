//
//  BarbuttonItem.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 20/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarController:  UITabBarController, UITabBarControllerDelegate {
    
    var number : Int = 1
    
    let menuButton = UIButton(frame: CGRect.zero)
    func setupMiddleButton() {
        let numberOfItems = CGFloat(tabBar.items!.count) //5
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height  )//375/5  || 40
        menuButton.frame = CGRect(x: 0, y: 0, width: tabBarItemSize.width , height: tabBarItemSize.height + 35 )
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = (self.view.bounds.height)   - menuButtonFrame.height - self.view.safeAreaInsets.bottom
        menuButtonFrame.origin.x = self.view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        menuButton.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 0)
        self.view.addSubview(menuButton)
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        menuButton.frame.origin.y = self.view.bounds.height - menuButton.frame.height -  self.view.safeAreaInsets.bottom
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupMiddleButton()
        
        self.viewControllers?[2].title = " متصل"
        
        //        let m = self.viewControllers?[2].tabBarItem.title = "wiefbhiowefn"
        
        
        
        //        self.viewControllers?[2].font = UIFont(name: "Cairo-Bold", size: 14)
        self.viewControllers?[2].tabBarItem.image = #imageLiteral(resourceName: "online").withRenderingMode(.alwaysOriginal)
        self.delegate = self
        menuButton.addTarget(self, action: #selector(buttonHandler), for: UIControl.Event.touchUpInside)
        // get the date for online and offline
    }
    @objc func buttonHandler() {
        if self.number == 1 {
            print("tabed 2 2 2 ")
            Operation.changStatus(lineStatus: 0, Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar") { (err, result) in
                print(result?.status_account , "0000")
                self.viewControllers?[2].title = "غير متصل"
                if let result = result{
                    if result.status == 1{
                        self.showHUD(title: "", details: result.status_account ?? "", hideAfter: 1)
                    }
                }
            }
            self.viewControllers?[2].tabBarItem.image = #imageLiteral(resourceName: "notonline").withRenderingMode(.alwaysOriginal)
            self.number = 0
        }else{
            print("tabed 1 1 1  ")
            Operation.changStatus(lineStatus: 1, Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar") { (err, result) in
                print(result?.status_account , "11111")
                self.viewControllers?[2].title = " متصل"
                if let result = result{
                    if result.status == 1{
                        self.showHUD(title: "", details: result.status_account ?? "", hideAfter: 1)
                    }
                }
            }
            self.viewControllers?[2].tabBarItem.image = #imageLiteral(resourceName: "connect_icon").withRenderingMode(.alwaysOriginal)
            
            self.number = 1
        }
    }
}
