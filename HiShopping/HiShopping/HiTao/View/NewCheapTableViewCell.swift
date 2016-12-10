//
//  NewCheapTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/16.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class NewCheapTableViewCell: UITableViewCell {
    var  headerImageView = UIImageView()
    var  goodsNameLabel = UILabel()
    var  newPriceLabel = UILabel()
    var  oldPriceLabel = UILabel()
    var  lineView = UIView()
    var  buyButton = UIButton()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(headerImageView)
        self.contentView.addSubview(goodsNameLabel)
        self.contentView.addSubview(newPriceLabel)
        self.contentView.addSubview(oldPriceLabel)
        self.contentView.addSubview(lineView)
        self.contentView.addSubview(buyButton)
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
        goodsNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(lineView)
            make.right.equalTo(lineView.snp.left).offset(-20)
        }
        newPriceLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(lineView)
            make.left.equalTo(lineView.snp.right).offset(20)
        }
        oldPriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(newPriceLabel.snp.right).offset(5)
            make.centerY.equalTo(newPriceLabel)
        }
        buyButton.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        
        
    }
    func setData(){
        self.headerImageView.image = UIImage(named:imageDefaultName)
        self.goodsNameLabel.text = "新上市蓝莓"
        self.newPriceLabel.text = "￥100"
        self.oldPriceLabel.text = "￥180"
        
    }
    func setFrame(){
        self.goodsNameLabel.font = BigFont
        self.lineView.backgroundColor = customGray
        self.newPriceLabel.setNewLabel(headerFontSize: 9, footerFontSize: 11)
        self.oldPriceLabel.setOldLabel(fontSize: 9)
        self.buyButton.setBackgroundImage(UIImage(named:"btn_sel_red_160x80"), for: .normal)
        self.buyButton.titleLabel?.font = BigFont
        self.buyButton.setTitle("抢购", for: .normal)
        self.buyButton.titleEdgeInsets.top -= 5

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
