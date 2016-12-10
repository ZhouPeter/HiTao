//
//  bottomSuspendView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class BottomSuspendView: UIView {
    var selectButton = UIButton()
    var allSelectLabel = UILabel()
    var totalTitleLabel = UILabel()
    var totalPriceLabel = UILabel()
    var rightButton = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = HiTaoBackgroundColor
        self.addSubview(selectButton)
        self.addSubview(allSelectLabel)
        self.addSubview(totalTitleLabel)
        self.addSubview(totalPriceLabel)
        self.addSubview(rightButton)
        self.setAllAttributes()
    }
    
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFormat()
    }
    
    func setLayout(){
        selectButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(7.5)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(10)
        }
        allSelectLabel.snp.makeConstraints { (make) in
            make.left.equalTo(selectButton.snp.right).offset(10)
            make.centerY.equalToSuperview()
            
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(80)
        }
        totalPriceLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(rightButton.snp.left).offset(-10)
            
        }
        
        totalTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(totalPriceLabel.snp.left).offset(-5)
            
        }
    }
    
    func setData(){
        self.totalPriceLabel.text = "¥100"
        self.rightButton.setTitle("结算(100)", for: .normal)
    }
    
    
    func setFormat(){
        self.selectButton.setImage(#imageLiteral(resourceName: "icon_circular_nor_gray"), for: .normal)
        self.allSelectLabel.text = "全选"
        self.allSelectLabel.font =  BigFont
        self.totalTitleLabel.text = "合计："
        self.totalTitleLabel.font =  BigFont
        self.totalPriceLabel.textColor = customRed
        self.totalPriceLabel.font =  MiddleFont
        self.rightButton.backgroundColor = customRed
        self.rightButton.setTitleColor(.white, for: .normal)
        self.rightButton.titleLabel?.font = BigFont
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
