//
//  SCTabBarController.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/1/29.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import UIKit

class SCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addChildNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        for subView in self.tabBar.subviews {
//            print("---subView is \(subView)")
//        }
    }
    

    func addChildNavigationController(){
        //Testing
        setChildRootViewController(ChildViewController: HomeViewController(), title: "首页", imageName:"home_tabbar_32x32_", selectedImageName:"home_tabbar_night_32x32_")

        setChildRootViewController(ChildViewController: VolcanoViewController(), title: "火山视频", imageName:"huoshan_tabbar_32x32_", selectedImageName:"huoshan_tabbar_night_32x32_")
        
        setChildRootViewController(ChildViewController: VideoViewController(), title: "西瓜视频", imageName:"video_tabbar_32x32_", selectedImageName:"video_tabbar_night_32x32_")
        
        setChildRootViewController(ChildViewController: MySettingViewController(), title: "我的", imageName:"mine_tabbar_32x32_", selectedImageName:"mine_tabbar_night_32x32_")
        
        let frame : CGRect = self.tabBar.bounds
        setValue(SCTabBar(frame: frame), forKey: "tabBar")
    }
    
    func setChildRootViewController(ChildViewController : UIViewController,title:String,imageName:String,selectedImageName:String){
        ChildViewController.title = title;
        ChildViewController.tabBarItem.image = UIImage(named: imageName)
        ChildViewController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        let childRootNavController = SCNavigationController(rootViewController: ChildViewController)
        addChild(childRootNavController)
    }
}
