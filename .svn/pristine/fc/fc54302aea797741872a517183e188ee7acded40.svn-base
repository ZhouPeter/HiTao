//
//  MineCollectionCollViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/23.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MineCollectionCollViewCell: UICollectionViewCell {
    var goodsImageView = UIImageView()
    var goodsNameLabel = UILabel()
    var reducePriceButton = UIButton()
    var couponButton = UIButton()
    var newPriceLabel = UILabel()
    var oldPriceLabel = UILabel()
    var collectionButton = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(goodsImageView)
        self.contentView.addSubview(goodsNameLabel)
        self.contentView.addSubview(reducePriceButton)
        self.contentView.addSubview(couponButton)
        self.contentView.addSubview(newPriceLabel)
        self.contentView.addSubview(oldPriceLabel)
        self.contentView.addSubview(collectionButton)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setLayout()
        self.setFrame()
    }
    
    func setLayout(){
        goodsImageView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo((SCREEN_WIDTH-30)/2)
        }
        goodsNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(goodsImageView.snp.left)
            make.top.equalTo(goodsImageView.snp.bottom).offset(10)
        }
        reducePriceButton.snp.makeConstraints { (make) in
            make.left.equalTo(goodsNameLabel.snp.left)
            make.top.equalTo(goodsNameLabel.snp.bottom).offset(10)
            make.width.equalTo(37)
        }
        couponButton.snp.makeConstraints { (make) in
            make.left.equalTo(reducePriceButton.snp.right).offset(5)
            make.centerY.equalTo(reducePriceButton)
            make.width.equalTo(18)
        }
        newPriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(goodsNameLabel.snp.left)
            make.top.equalTo(reducePriceButton.snp.bottom).offset(10)
        }
        oldPriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(newPriceLabel.snp.right).offset(5)
            make.centerY.equalTo(newPriceLabel)
        }
        collectionButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(newPriceLabel)
            make.right.equalToSuperview().offset(-10)
            make.width.height.equalTo(15)
        }
        
        
    }
    func setData(isBtnHaving:Bool){
        self.goodsImageView.image = UIImage(named:imageDefaultName)
        self.goodsNameLabel.text = "变形金刚"
        self.newPriceLabel.text = "￥100"
        self.oldPriceLabel.text = "￥180"
        self.newPriceLabel.textColor = customRed
        self.oldPriceLabel.setOldLabel(fontSize: 9)
        if !isBtnHaving{
            self.reducePriceButton.isHidden = true
            self.couponButton.isHidden = true
            newPriceLabel.snp.remakeConstraints({ (make) in
                make.top.equalTo(goodsNameLabel.snp.bottom).offset(10)
                make.left.equalTo(goodsNameLabel.snp.left)
            })
            self.newPriceLabel.textColor = .black
            self.oldPriceLabel.isHidden = true
           
        }else{
            self.reducePriceButton.isHidden = false
            self.couponButton.isHidden = false
            newPriceLabel.snp.remakeConstraints({ (make) in
                make.left.equalTo(goodsNameLabel.snp.left)
                make.top.equalTo(reducePriceButton.snp.bottom).offset(10)
            })
        }
    }
    func setFrame(){
        self.goodsNameLabel.font = MiddleFont
        self.newPriceLabel.font =  MiddleFont
        self.reducePriceButton.setTitle("降价了", for: .normal)
        self.couponButton.setTitle("卷", for: .normal)
        self.reducePriceButton.titleLabel?.font = SmallFont
        self.couponButton.titleLabel?.font = SmallFont
        self.reducePriceButton.backgroundColor = customRed
        self.couponButton.backgroundColor = customYellow
        self.collectionButton.setImage(UIImage(named:"icon_collection_red"), for: .normal)
        self.collectionButton.setImage(UIImage(named:"icon_collection_gray"), for: .highlighted)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
