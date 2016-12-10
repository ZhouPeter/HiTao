//
//  SetUpDeleteTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/31.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SetUpDeleteTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deleteImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageWithColor()
    }
    
    func imageWithColor(){
        var image = self.deleteImageView.image
        image = image?.withRenderingMode(.alwaysTemplate)
        self.deleteImageView.image = image
        self.deleteImageView.tintColor = customGray

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
