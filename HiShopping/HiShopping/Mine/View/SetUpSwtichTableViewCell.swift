//
//  SetUpSwtichTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/31.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SetUpSwtichTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
