//
//  MineOrderTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/20.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
class MineOrderProductTableViewCell: UITableViewCell {
    
    var sizeString : String!
    var color: String!
    var count: String!
    var price: String!
    var state: String!
    var productImageView = UIImageView()
    var productMessageLabel = UILabel()
    var sizeLabel = UILabel()
    var colorLabel = UILabel()
    var countLabel = UILabel()
    var stateLabel = UILabel()
    var priceLabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(productImageView)
        self.contentView.addSubview(productMessageLabel)
        self.contentView.addSubview(sizeLabel)
        self.contentView.addSubview(colorLabel)
        self.contentView.addSubview(countLabel)
        self.contentView.addSubview(stateLabel)
        self.contentView.addSubview(priceLabel)
        self.setAllAttributes()
        
    }
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFormat()
    }
    func setLayout(){
        productImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.width.height.equalTo(60)
            
        }
        stateLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(productImageView)
        }
        productMessageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(productImageView)
            make.right.equalToSuperview().offset(-90)
            make.left.equalTo(productImageView.snp.right).offset(5)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(productImageView)
            make.left.equalTo(productMessageLabel)
        }
        sizeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(productMessageLabel)
            make.top.equalTo(productImageView.snp.bottom).offset(-30)
            
        }
        colorLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(sizeLabel)
            make.left.equalTo(sizeLabel.snp.right).offset(5)
        }
    
        countLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(colorLabel)
            make.right.equalToSuperview().offset(-10)
        }
        
    }
    
    func setData(){
        self.productImageView.image = UIImage(named:"bourkestreetbakery")
        self.productMessageLabel.text = "不想写代码不想写代码不想写代码不想写代码不想写代码不想写代码"
        sizeString = "M"
        color = "红色"
        count = "100"
        price = "100"
        state = "交易成功"
        self.sizeLabel.text = "尺寸:\(sizeString!)"
        self.colorLabel.text = "颜色:\(color!)"
        self.countLabel.text = "x\(count!)"
        self.priceLabel.text = "￥\(price!)"
        self.stateLabel.text = "\(state!)"
    }
    func setFormat(){
        self.productMessageLabel.numberOfLines = 2
        self.productMessageLabel.font = MiddleFont
        self.sizeLabel.font = MiddleFont
        self.colorLabel.font = MiddleFont
        self.countLabel.font = MiddleFont
        self.priceLabel.font = MiddleFont

        self.sizeLabel.textColor = customGray
        self.colorLabel.textColor = customGray
        self.countLabel.textColor = customGray
        self.priceLabel.textColor = customGray

        self.stateLabel.font = BigFont
        self.stateLabel.textColor = customRed
        
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
