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

    var number = 1
    
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

        self.viewControllers?[2].tabBarItem.image = #imageLiteral(resourceName: "online").withRenderingMode(.alwaysOriginal)
        self.delegate = self
        
        
        menuButton.addTarget(self, action: #selector(buttonHandler), for: UIControl.Event.touchUpInside)
    }
    @objc func buttonHandler() {
        if self.number == 1 {
            print("tabed 2 2 2 ")
            self.viewControllers?[2].tabBarItem.image = #imageLiteral(resourceName: "notonline").withRenderingMode(.alwaysOriginal)
            self.number = 0
        }else{
            self.viewControllers?[2].tabBarItem.image = #imageLiteral(resourceName: "connect_icon").withRenderingMode(.alwaysOriginal)
            self.number = 1
        }
    }

    

//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        print("wioeiownefopwnmef[wmpefmwpemfp[eemfpwmef[[[[[[[[[=============")
////
//
//
//                let stprybord = UIStoryboard(name: "Advisor", bundle: nil)
//                let vc = stprybord.instantiateViewController(withIdentifier: "navUser") as! UINavigationController
//                present(vc, animated: true, completion: nil)
////                UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
//
//        return true
//    }

    







}
