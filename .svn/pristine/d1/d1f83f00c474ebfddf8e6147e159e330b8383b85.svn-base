//
//  ResultCollectionViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/26.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    var isCollection = false
    var starCount = 888
    var goodsImageView = UIImageView()
    var goodsNameLabel = UILabel()
    var priceLabel = UILabel()
    var starButton = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(goodsImageView)
        self.contentView.addSubview(goodsNameLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(starButton)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFormat()
    }
    
    func setLayout(){
        goodsImageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(goodsImageView.snp.width)
            make.left.top.equalToSuperview()
        }
        goodsNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(goodsImageView).offset(10)
            make.top.equalTo(goodsImageView.snp.bottom).offset(10)
            make.height.equalTo(11)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(goodsNameLabel)
            make.top.equalTo(goodsNameLabel.snp.bottom).offset(10)
        }
        starButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(priceLabel)
        }
    }
    func setData(){
        self.goodsImageView.image = UIImage(named:imageDefaultName)
        self.goodsNameLabel.text = "ML时尚鸭舌帽"
        self.priceLabel.text = "￥120"
        self.starButton.setTitle("\(starCount)", for: .normal)
    
        
    }
    func setFormat(){
        self.goodsNameLabel.setFontAndTextColor(font: MiddleFont, textColor: UIColor.black)
        self.priceLabel.setFontAndTextColor(font: MiddleFont, textColor: customRed)
        self.starButton.titleLabel?.font = MiddleFont
        self.starButton.setImage(UIImage(named:"unCollect_icon"), for: .normal)
        self.starButton.setTitleColor(customGray, for: .normal)
        self.starButton.addTarget(self, action: #selector(ResultCollectionViewCell.collectGoods(_:)),for: .touchUpInside)
    }
    func collectGoods(_ sender: UIButton) {
        isCollection = !isCollection
        if isCollection{
            starCount += 1
            self.starButton.setImage(UIImage(named:"collect_icon"), for: .normal)
            self.starButton.setTitleColor(customRed, for: .normal)
            self.starButton.setTitle("\(starCount)", for: .normal)
        }else{
            starCount -= 1
            self.starButton.setImage(UIImage(named:"unCollect_icon"), for: .normal)
            self.starButton.setTitleColor(customGray, for: .normal)
            self.starButton.setTitle("\(starCount)", for: .normal)

 
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
