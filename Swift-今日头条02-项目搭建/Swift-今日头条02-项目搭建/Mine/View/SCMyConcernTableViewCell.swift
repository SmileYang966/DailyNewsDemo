//
//  SCMyConcernTableViewCell.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/2/1.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import UIKit

class SCMyConcernTableViewCell: UITableViewCell,SCRegisterNib {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var concernCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
