//
//  GoodsTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/21.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit


class SupportView:UIView{
    var supportView1 = UIImageView()
    var supportView2 = UIImageView()
    var supportView3 = UIImageView()

    var supportLabel1 = UILabel()
    var supportLabel2 = UILabel()
    var supportLabel3 = UILabel()

    
    var moreImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(supportView1)
        self.addSubview(supportView2)
        self.addSubview(supportView3)
        self.addSubview(supportLabel1)
        self.addSubview(supportLabel2)
        self.addSubview(supportLabel3)
        self.addSubview(moreImageView)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setLayout()
        self.setFormat()
    }
    
    func setLayout(){
        supportView1.snp.makeConstraints { (make) in
            make.width.height.equalTo(10)
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        supportLabel1.snp.makeConstraints { (make) in
            make.left.equalTo(supportView1.snp.right).offset(5)
            make.centerY.equalToSuperview()
        }
        supportView2.snp.makeConstraints { (make) in
            make.width.height.equalTo(supportView1)
            make.left.equalTo(supportLabel1.snp.right).offset(5)
            make.centerY.equalToSuperview()
        }
        supportLabel2.snp.makeConstraints { (make) in
            make.left.equalTo(supportView2.snp.right).offset(5)
            make.centerY.equalToSuperview()
        }

        supportView3.snp.makeConstraints { (make) in
            make.width.height.equalTo(supportView1)
            make.left.equalTo(supportLabel2.snp.right).offset(5)
            make.centerY.equalToSuperview()
        }
        supportLabel3.snp.makeConstraints { (make) in
            make.left.equalTo(supportView3.snp.right).offset(5)
            make.centerY.equalToSuperview()
        }
        moreImageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(13)
            make.height.equalTo(3)
        }

    }
    func setData(supportTitleArray:String ...){
        self.supportLabel1.text = supportTitleArray[0]
        self.supportLabel2.text = supportTitleArray[1]
        self.supportLabel3.text = supportTitleArray[2]

    }
    func setFormat(){
        self.supportLabel1.font = SmallFont
        self.supportLabel1.textColor = customGray
        self.supportView1.image = UIImage(named:"icon_tick")
        self.supportLabel2.font = SmallFont
        self.supportLabel2.textColor = customGray
        self.supportView2.image = UIImage(named:"icon_tick")
        self.supportLabel3.font = SmallFont
        self.supportLabel3.textColor = customGray
        self.supportView3.image = UIImage(named:"icon_tick")
        self.moreImageView.image = UIImage(named:"icon_more")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class GoodsTableViewCell: UITableViewCell {
    var goodsNameLabel = UILabel()
    let lineView  = UIView()
    var shareButton = UIButton()
    var newPriceLabel = UILabel()
    var oldPriceLabel  = UILabel()
    var freightLabel = UILabel()
    var saleCountLabel  = UILabel()
    var addressLabel = UILabel()
    var supportView = SupportView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(goodsNameLabel)
        self.contentView.addSubview(lineView)
        self.contentView.addSubview(shareButton)
        self.contentView.addSubview(newPriceLabel)
        self.contentView.addSubview(oldPriceLabel)
        self.contentView.addSubview(freightLabel)
        self.contentView.addSubview(saleCountLabel)
        self.contentView.addSubview(addressLabel)
        self.contentView.addSubview(supportView)
        self.selectionStyle = .none
        self.setAllAttributes()
       }
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFormat()
    }
    
    func setLayout(){
        goodsNameLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
        }
        shareButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(goodsNameLabel)
            make.width.height.equalTo(14)
        }
        lineView.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalTo(goodsNameLabel)
            make.centerY.equalTo(shareButton)
            make.right.equalTo(shareButton.snp.left).offset(-10)
        }
        newPriceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(goodsNameLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
        }
        oldPriceLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(newPriceLabel)
            make.left.equalTo(newPriceLabel.snp.right).offset(10)
        }
        freightLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(newPriceLabel.snp.bottom).offset(5)
        }
        saleCountLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(freightLabel)
        }
        addressLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(saleCountLabel)
        }
        supportView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(freightLabel.snp.bottom).offset(20)
            make.width.equalTo(20)
            
        }
        
    }
    func setData(){
        self.goodsNameLabel.text = "白色针织衫"
        self.newPriceLabel.text = "￥100"
        self.oldPriceLabel.text = "￥200"
        self.freightLabel.text = "快递：免运费"
        self.saleCountLabel.text = "月销1200笔"
        self.addressLabel.text = "浙江 宁波"
        self.supportView.setData(supportTitleArray: "7天无理由退货","信用卡支付","蚂蚁花呗")
        
    }
    func setFormat(){
        self.goodsNameLabel.font = MiddleFont
        self.shareButton.setBackgroundImage(UIImage(named:"icon_share"), for: .normal)
        self.lineView.backgroundColor = customGray
        self.newPriceLabel.setNewLabel(headerFontSize:10,footerFontSize: 13)
        self.oldPriceLabel.setOldLabel(fontSize: 10)
        self.freightLabel.font = SmallFont
        self.saleCountLabel.font = SmallFont
        self.addressLabel.font = SmallFont
        self.freightLabel.textColor = customGray
        self.saleCountLabel.textColor = customGray
        self.addressLabel.textColor = customGray


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
