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
        // get the date for online and offline
    }
    @objc func buttonHandler() {
        if self.number == 1 {
            print("tabed 2 2 2 ")
            Operation.changStatus(lineStatus: 0, Authorization: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjJhNDZmOGE1ODkxNWY5ZWMxMDU5NTZkMjFlNGY3MTQxMjY2ZWFjZjYyOGJlNDA0NjhlYmEyMDM2MDgyZjkxMzMzMmM1ZjhhNGFiM2YzNGFmIn0.eyJhdWQiOiIxIiwianRpIjoiMmE0NmY4YTU4OTE1ZjllYzEwNTk1NmQyMWU0ZjcxNDEyNjZlYWNmNjI4YmU0MDQ2OGViYTIwMzYwODJmOTEzMzMyYzVmOGE0YWIzZjM0YWYiLCJpYXQiOjE1NzE0ODQ1ODYsIm5iZiI6MTU3MTQ4NDU4NiwiZXhwIjoxNjAzMTA2OTg2LCJzdWIiOiIyOCIsInNjb3BlcyI6W119.DWLQpVz9_9ODb91NotGr1M1ykSAMAS9W-ZpBlWQMclMwuXOm9Zrtw1um9z_TyrLvfrqSV-S_54iwVLHC9IGFoaiQnJg0teRVw35Wh8jAE0DYhcgNpnrWU5m9C9GHCF8BgW0mFgsdJXvf_HegMzJe0ehZDeZ9hITk34Vlbl4QE8yRoXhvZnGPF4pv3t3TAb776SGGrAqZAdgfqDkoEHZqf3Itd-16LG8Qw_Nl-WD6kvnkkewugfUYvg31e8EiC3Jhqca82eqcMPEDVV_i4sjss9okWI8Sg2dV-wsCVt3ie0E2wXi6scl4i5XjPAn0xfOqPrzlngb-0zoHc7kIeGQhxHzSfcbUIuOAcY8XevQhbr3aV_omnjW3bNYewiNW8vuzFc8TbIDdGqWkZK0U0zIFsCxby5m-4-k2GTqxxDb_GPXvdYiFRgCH0u0ZcboVZXmuWNvTTxhT8LlB3UzYJxCgIcwzjM396Wzuaq9_qdlh6AHFMMrXRy8U9jZMcorWZmLcpwUYB272zXnoyNB5eOxCSijj0FLDheh_orz13yRyTcUoXHXXzNsvXKfVkfccxSESGY_kINU6M-2beQZDql0FrRiqTDfqs-CsIbmJV4L6FD3S3vtOTL6Xvd8n4GYaYSo42ukovYPGeAIT4x8gGmcYL7A8xu8eP5JjK73tg2hjjB4", lang: "ar") { (err, result) in
                print(result?.status_account)
                
            }
            self.viewControllers?[2].tabBarItem.image = #imageLiteral(resourceName: "notonline").withRenderingMode(.alwaysOriginal)
            self.number = 0
        }else{
            Operation.changStatus(lineStatus: 1, Authorization: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjJhNDZmOGE1ODkxNWY5ZWMxMDU5NTZkMjFlNGY3MTQxMjY2ZWFjZjYyOGJlNDA0NjhlYmEyMDM2MDgyZjkxMzMzMmM1ZjhhNGFiM2YzNGFmIn0.eyJhdWQiOiIxIiwianRpIjoiMmE0NmY4YTU4OTE1ZjllYzEwNTk1NmQyMWU0ZjcxNDEyNjZlYWNmNjI4YmU0MDQ2OGViYTIwMzYwODJmOTEzMzMyYzVmOGE0YWIzZjM0YWYiLCJpYXQiOjE1NzE0ODQ1ODYsIm5iZiI6MTU3MTQ4NDU4NiwiZXhwIjoxNjAzMTA2OTg2LCJzdWIiOiIyOCIsInNjb3BlcyI6W119.DWLQpVz9_9ODb91NotGr1M1ykSAMAS9W-ZpBlWQMclMwuXOm9Zrtw1um9z_TyrLvfrqSV-S_54iwVLHC9IGFoaiQnJg0teRVw35Wh8jAE0DYhcgNpnrWU5m9C9GHCF8BgW0mFgsdJXvf_HegMzJe0ehZDeZ9hITk34Vlbl4QE8yRoXhvZnGPF4pv3t3TAb776SGGrAqZAdgfqDkoEHZqf3Itd-16LG8Qw_Nl-WD6kvnkkewugfUYvg31e8EiC3Jhqca82eqcMPEDVV_i4sjss9okWI8Sg2dV-wsCVt3ie0E2wXi6scl4i5XjPAn0xfOqPrzlngb-0zoHc7kIeGQhxHzSfcbUIuOAcY8XevQhbr3aV_omnjW3bNYewiNW8vuzFc8TbIDdGqWkZK0U0zIFsCxby5m-4-k2GTqxxDb_GPXvdYiFRgCH0u0ZcboVZXmuWNvTTxhT8LlB3UzYJxCgIcwzjM396Wzuaq9_qdlh6AHFMMrXRy8U9jZMcorWZmLcpwUYB272zXnoyNB5eOxCSijj0FLDheh_orz13yRyTcUoXHXXzNsvXKfVkfccxSESGY_kINU6M-2beQZDql0FrRiqTDfqs-CsIbmJV4L6FD3S3vtOTL6Xvd8n4GYaYSo42ukovYPGeAIT4x8gGmcYL7A8xu8eP5JjK73tg2hjjB4", lang: "ar") { (err, result) in
                print(result?.status_account)
            }
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
