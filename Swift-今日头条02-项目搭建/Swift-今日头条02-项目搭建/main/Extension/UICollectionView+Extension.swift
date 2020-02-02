//
//  UICollectionView+Extension.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/2/2.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import UIKit

extension UICollectionView{
    
    func sc_registerCell<T:UICollectionViewCell>(cell : T.Type) where T:SCRegisterNib {
        if let nib = T.scNib{
            register(nib, forCellWithReuseIdentifier: T.scIdentifier)
        }else{
            register(cell, forCellWithReuseIdentifier: T.scIdentifier)
        }
    }
    
    func sc_dequeueReusableCell<T:UICollectionViewCell>(indexPath : IndexPath) -> T where T:SCRegisterNib {
        return dequeueReusableCell(withReuseIdentifier: T.scIdentifier, for: indexPath) as! T
    }
}
