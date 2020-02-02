//
//  UITableView+Extension.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/2/2.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import UIKit

extension UITableView{
    func sc_registerCell<T:UITableViewCell>(cell : T.Type) where T:SCRegisterNib {
        if let nib = T.scNib{
            register(nib, forCellReuseIdentifier: T.scIdentifier)
        }else{
            register(cell, forCellReuseIdentifier: T.scIdentifier)
        }
    }
    
    func sc_dequeueReusableCell<T:UITableViewCell>(indexpath : IndexPath) -> T where T:SCRegisterNib {
        return dequeueReusableCell(withIdentifier: T.scIdentifier, for: indexpath) as! T
    }
}
