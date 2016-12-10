//
//  HeaderView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CartHeaderView: UITableViewHeaderFooterView {
    var selectButton = UIButton()
    var headerImageView = UIImageView()
    var shopNameLabel = UILabel()
    var topView = UIView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(selectButton)
        self.contentView.addSubview(headerImageView)
        self.contentView.addSubview(shopNameLabel)
        self.setAllAttributes()
    }

    func setAllAttributes() {
        self.setLayout()
        self.setData()
        self.setFormat()

    }
    
    
    func setLayout(){

        self.selectButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(7.5)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        self.headerImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(selectButton.snp.centerY)
            make.left.equalTo(selectButton.snp.right).offset(10)
            make.width.height.equalTo(10)
        }
        self.shopNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(selectButton.snp.centerY)
            make.left.equalTo(headerImageView.snp.right).offset(5)
        }

    }
    
    
    func setData(){
        selectButton.setImage(#imageLiteral(resourceName: "icon_circular_nor_gray"), for: .normal)
        headerImageView.image = UIImage(named:"shop")
        shopNameLabel.text = "滑板小店"
    }
    
    func setFormat(){
        self.shopNameLabel.font = BigFont

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
