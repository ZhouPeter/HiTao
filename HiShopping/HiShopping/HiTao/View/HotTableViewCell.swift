//
//  HotTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/13.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class HotTableViewCell: CheapTableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.bottomView.productNewLabel.isHidden = true
        self.bottomView.productOldLabel.isHidden = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
