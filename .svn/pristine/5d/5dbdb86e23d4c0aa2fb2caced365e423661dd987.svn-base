//
//  ColorTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/24.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SpecTableViewCell: UITableViewCell {
    var contentLabel = UILabel()
    var selectImageView = UIImageView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(selectImageView)
        self.contentView.addSubview(contentLabel)
        self.setAllAttributes()
        
    }
    func setAllAttributes(){
        self.setLayout()
        self.setFormat()
    }
    
    func setLayout(){
        contentLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    //根据文本内容控制ImageView的大小
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.selectImageView.frame = CGRect(x: contentLabel.frame.origin.x - 5, y:  contentLabel.frame.origin.y - 5 , width: contentLabel.frame.size.width + 10, height: contentLabel.frame.size.height + 10)
    }
    //设置文本控件的内容和颜色
    func setData(textString:String){
        self.contentLabel.text = textString
        self.contentLabel.textColor = customGray
        
    }
    func setFormat(){
        contentLabel.textAlignment = .center
        contentLabel.font = MiddleFont
        contentLabel.textColor = customGray
        selectImageView.image = UIImage(named:"line_51x51")
        selectImageView.isHidden = true
       
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
