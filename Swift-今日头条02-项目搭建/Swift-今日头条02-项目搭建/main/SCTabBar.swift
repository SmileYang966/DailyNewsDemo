//
//  SCTabBar.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/1/30.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import UIKit

class SCTabBar: UITabBar {
    
    /*懒加载一个plusButton*/
    private lazy var plusButton : UIButton = {
        let plusButton1 = UIButton(frame: CGRect(x: 0,y: 0,width: 44,height: 44))
        let normalImage : UIImage = UIImage(named: "feed_publish_44x44_")!
        let selectedImage : UIImage = UIImage(named: "feed_publish_night_44x44_")!
        plusButton1.setImage(normalImage, for:.normal)
        plusButton1.setImage(selectedImage, for: .selected)
        return plusButton1
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        print("frame = \(frame)")
        self.addSubview(self.plusButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //调整每个UITabBarButton的frame以及plusButton的位置
        let tabBarWidth : CGFloat = self.bounds.size.width
        let tabBarHeight : CGFloat = self.bounds.size.height
        
        //设置plusButton的位置
        self.plusButton.center = CGPoint(x: self.center.x, y: 10.0)
        
        //设置其它按钮的frame
        let tabBarButtonW : CGFloat = tabBarWidth * 0.2
        let tabBarButtonH : CGFloat = tabBarHeight
        
        var index = 0
        
        for subView in self.subviews {
            if !subView .isKind(of: NSClassFromString("UITabBarButton")!) {
                continue
            }
            let tabBarButtonX = tabBarButtonW * (index > 1 ? CGFloat(index+1) : CGFloat(index))
            subView.frame = CGRect(x: tabBarButtonX, y: 0.0, width: tabBarButtonW, height: tabBarButtonH)
            index += 1
        }
    }
}
