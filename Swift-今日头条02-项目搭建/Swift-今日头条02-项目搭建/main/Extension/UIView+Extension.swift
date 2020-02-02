//
//  UIView+Extension.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/2/2.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import UIKit

protocol SCRegisterNib{}



extension SCRegisterNib{
    static var scIdentifier : String{
        return "\(self)"
    }
    
    static var scNib : UINib? {
        return UINib(nibName: "\(self)", bundle:nil)
    }
}
