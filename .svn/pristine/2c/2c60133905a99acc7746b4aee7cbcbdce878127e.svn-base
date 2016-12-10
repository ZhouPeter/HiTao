//
//  CartTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var newPriceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.newPriceLabel.setNewLabel(headerFontSize:newPriceLabel.font.pointSize,footerFontSize: 14)
        self.oldPriceLabel.setOldLabel(fontSize: self.oldPriceLabel.font.pointSize)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
