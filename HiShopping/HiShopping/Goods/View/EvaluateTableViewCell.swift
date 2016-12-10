//
//  EvaluateTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/12/10.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class EvaluateTableViewCell: UITableViewCell {
    var headerImageView = UIImageView()
    var userNameLabel = UILabel()
    var dateLabel = UILabel()
    var contentLabel = UILabel()
    var sizeLabel = UILabel()
    var colorLabel = UILabel()
    var starButton = UIButton()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(headerImageView)
        self.contentView.addSubview(userNameLabel)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(sizeLabel)
        self.contentView.addSubview(colorLabel)
        self.contentView.addSubview(starButton)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFrame()
    }
    
    func setLayout(){
        headerImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.left.top.equalTo(15)
        }
        userNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerImageView.snp.right).offset(7.5)
            make.centerY.equalTo(headerImageView)
        }
        dateLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(headerImageView)
            make.right.equalToSuperview().offset(-10)
        }
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerImageView)
            make.top.equalTo(headerImageView.snp.bottom).offset(10)
        }
        sizeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerImageView)
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
        }
        colorLabel.snp.makeConstraints { (make) in
            make.left.equalTo(sizeLabel.snp.right).offset(10)
            make.centerY.equalTo(sizeLabel)
        }
        starButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(sizeLabel)
        }
    }
    func setData(){
        self.headerImageView.image = UIImage(named:imageDefaultName)
        self.userNameLabel.text = "设计师是逗逼"
        self.dateLabel.text = "2011-11-11"
        self.contentLabel.text = "对面的女孩看过来看过来"
        self.sizeLabel.text = "尺寸:M"
        self.colorLabel.text = "颜色:白色"
        self.starButton.setTitle("22".toMinLengthString(minLength: 3), for: .normal)
    }
    func setFrame(){
        //更新约束获取frame 方便切圆
        self.layoutIfNeeded()
        self.headerImageView.ViewToRoundView()
        self.userNameLabel.setFontAndTextColor(font: SmallFont, textColor: customGray)
        self.dateLabel.setFontAndTextColor(font: SmallFont, textColor: customGray)
        self.contentLabel.font = MiddleFont
        self.sizeLabel.setFontAndTextColor(font: SmallFont, textColor: customGray)
        self.colorLabel.setFontAndTextColor(font: SmallFont, textColor: customGray)
        self.starButton.setTitleColor(customGray, for: .normal)
        self.starButton.titleLabel?.font = SmallFont
        self.starButton.setImage(UIImage(named:"icon_like"), for: .normal)
        self.starButton.contentHorizontalAlignment = .right
        self.starButton.imageEdgeInsets.right = 5
        starButton.snp.makeConstraints { (make) in
            make.width.equalTo(self.starButton.frame.width + 5)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
