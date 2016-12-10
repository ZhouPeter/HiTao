//
//  BrandCollectionViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/22.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {
    var brandImageView = UIImageView()
    var brandLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(brandImageView)
        self.contentView.addSubview(brandLabel)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFrame()
    }
    
    func setLayout(){
        brandImageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(brandImageView.snp.width)
            make.left.top.equalToSuperview()
        }
        brandLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalTo(brandImageView.snp.bottom).offset(5)
        }
    }
    func setData(){
        brandImageView.image = UIImage(named:imageDefaultName)
        self.brandLabel.text = "阿迪王"
    }
    func setFrame(){
        self.brandLabel.font = BigFont
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
