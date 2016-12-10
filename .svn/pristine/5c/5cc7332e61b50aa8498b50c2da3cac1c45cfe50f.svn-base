//
//  PointBuyChildCollectionViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/26.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import SnapKit
extension Dictionary where Key:ExpressibleByStringLiteral,Value:Any {
    func name(){
        
    }
}
class ProgressBar: UIView {
     var widthConstraint:Constraint?
    var overView = UIView()
    var overLabel = UILabel()
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(overView)
        self.addSubview(overLabel)
        self.setAllAttributes()
        
    }
    convenience init(allCount:Int,overCount:Int){
        self.init(frame: CGRect.zero)
        
    }
    func setAllAttributes(){
        self.backgroundColor = UIColor.hexStringToColor("ffd4dc")
        overView.snp.makeConstraints { (make) in
           make.left.top.bottom.equalToSuperview()
           make.width.equalToSuperview()
        }
        overView.backgroundColor = UIColor.hexStringToColor("ff8fa4")
        overLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        overLabel.setFontAndTextColor(font: MiddleFont, textColor: .white)
    }
    func setOverCount(overCount:Int,allCount:Int){
        let radio = CGFloat(overCount)/CGFloat(allCount)
    
        //updateConstraints约束失败原因不不明上面测试普通的约束可以 带比例的貌似不行
//        overView.snp.updateConstraints { (make) in
//
//            make.width.equalToSuperview().offset(-100)
//
//        }
        overView.snp.remakeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(radio)
        }
        overLabel.text = "已抢\(overCount)"
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
class PointBuyChildCollectionViewCell: UICollectionViewCell {
    var goodsImageView = UIImageView()
    var goodsNameLabel = UILabel()
    var newPriceLabel = UILabel()
    var oldPriceLabel = UILabel()
    var buyButton = UIButton()
    var progressBar = ProgressBar()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(goodsImageView)
        self.contentView.addSubview(goodsNameLabel)
        self.contentView.addSubview(newPriceLabel)
        self.contentView.addSubview(oldPriceLabel)
        self.contentView.addSubview(buyButton)
        self.contentView.addSubview(progressBar)
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
        newPriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(goodsNameLabel)
            make.top.equalTo(goodsNameLabel.snp.bottom).offset(10)
        }
        oldPriceLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(newPriceLabel)
            make.left.equalTo(newPriceLabel.snp.right).offset(5)
        }
        buyButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(progressBar.snp.top)
            make.right.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(35)
        }
        progressBar.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.left.right.bottom.equalToSuperview()
        }

    }
    func setData(){
        self.goodsImageView.image = #imageLiteral(resourceName: "bourkestreetbakery")
        self.goodsNameLabel.text = "ML时尚鸭舌帽"
        self.newPriceLabel.text = "￥120"
        self.oldPriceLabel.text = "￥200"
        self.buyButton.setTitle("马上抢", for: .normal)
        self.progressBar.setOverCount(overCount: 100, allCount: 200)
        
        
    }
    func setFormat(){
        self.goodsNameLabel.setFontAndTextColor(font: MiddleFont, textColor: UIColor.black)
        self.newPriceLabel.setNewLabel(headerFontSize: 8, footerFontSize: 10)
        self.oldPriceLabel.setOldLabel(fontSize: 8)
        self.buyButton.setBackgroundImage(UIImage(named:"btn_sel_red_120x70"), for: .normal)
        self.buyButton.titleEdgeInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
        self.buyButton.titleLabel?.font = MiddleFont
        self.buyButton.titleLabel?.textColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
