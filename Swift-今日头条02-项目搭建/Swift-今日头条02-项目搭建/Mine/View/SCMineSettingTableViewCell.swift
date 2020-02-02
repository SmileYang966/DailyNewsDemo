//
//  SCMineSettingTableViewCell.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/2/1.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import UIKit

class SCMineSettingTableViewCell: UITableViewCell,SCRegisterNib {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var rightImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
