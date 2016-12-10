//
//  GoodsSelectTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/24.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class GoodsSelectTableViewCell: UITableViewCell {
   var selectLabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(selectLabel)
        selectLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(150)
            make.height.equalToSuperview()
        }
        selectLabel.font = MiddleFont
        selectLabel.text = "请选择"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
