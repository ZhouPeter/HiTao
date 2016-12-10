//
//  NewHotTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/16.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class NewHotTableViewCell: UITableViewCell {
    var  headerImageView = UIImageView()
    var  goodsNameLabel = UILabel()
    var  seeButton = UIButton()
    var  likeButton = UIButton()
    var  lineView = UIView()
    var  buyButton = UIButton()
    var buyedCountLabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(headerImageView)
        self.contentView.addSubview(goodsNameLabel)
        self.contentView.addSubview(seeButton)
        self.contentView.addSubview(likeButton)
        self.contentView.addSubview(lineView)
        self.contentView.addSubview(buyButton)
        self.contentView.addSubview(buyedCountLabel)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFrame()
    }
    
    func setLayout(){
        headerImageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(150)
            make.left.top.equalToSuperview()
        }
        lineView.snp.makeConstraints { (make) in
            make.height.equalTo(10)
            make.width.equalTo(1)
            make.centerX.equalToSuperview()
            make.top.equalTo(headerImageView.snp.bottom).offset(10)
        }
        seeButton.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(20)
            make.centerY.equalTo(lineView)
            make.left.equalTo(lineView.snp.right).offset(20)
        }
        likeButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(seeButton)
            make.centerY.equalTo(lineView)
            make.left.equalTo(seeButton.snp.right).offset(10)
        }
        
        goodsNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(lineView)
            make.right.equalTo(lineView.snp.left).offset(-20)
        }
        buyButton.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        buyedCountLabel.snp.makeConstraints { (make) in
            make.right.equalTo(buyButton.snp.left).offset(-10)
            make.centerY.equalTo(buyButton)
        }
        
        
    }
    func setData(){
        self.headerImageView.image = UIImage(named:imageDefaultName)
        self.goodsNameLabel.text = "新上市蓝莓"
        self.buyedCountLabel.text = "已售222件"
    }
    func setFrame(){
        self.goodsNameLabel.font = BigFont
        self.lineView.backgroundColor = customGray
        self.seeButton.setImage(UIImage(named: "icon_see"), for: .normal)
        self.likeButton.setImage(UIImage(named: "icon_like"), for: .normal)
        self.seeButton.setTitle("888", for: .normal)
        self.likeButton.setTitle("888", for: .normal)
        self.seeButton.setTitleColor(customBlack, for: .normal)
        self.likeButton.setTitleColor(customBlack, for: .normal)
        self.seeButton.titleLabel?.font = SmallFont
        self.likeButton.titleLabel?.font = SmallFont
        self.seeButton.titleEdgeInsets.left = 5
        self.likeButton.titleEdgeInsets.left = 5
        self.buyButton.setBackgroundImage(UIImage(named:"btn_sel_red_160x80"), for: .normal)
        self.buyButton.titleLabel?.font = BigFont
        self.buyButton.setTitle("去看看", for: .normal)
        self.buyButton.titleEdgeInsets.top -= 5
        self.buyedCountLabel.font = BigFont
        self.buyedCountLabel.textColor = customGray
        
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
        
    }

}
