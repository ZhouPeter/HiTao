//
//  CouponTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/8.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CouponTableViewCell: UITableViewCell {
    var bgView = UIImageView()
    
    var nameLabel = UILabel()
    var amountLabel = UILabel()
    var totalLabel = UILabel()
    var dayLabel = UILabel()
    var useButton = UIButton()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(bgView)
        self.bgView.addSubview(nameLabel)
        self.bgView.addSubview(amountLabel)
        self.bgView.addSubview(totalLabel)
        self.bgView.addSubview(useButton)
        self.bgView.addSubview(dayLabel)
        self.setAllAttributes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setAllAttributes(){
        self.setLayout()
        self.setData(amount: 11, total: 11)
        self.setFrame()
    }
    
    func setLayout(){
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10))
        }
        amountLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(bgView.snp.centerY).offset(-5)
            make.centerX.equalTo(bgView.snp.left).offset(75)
        }
        totalLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(amountLabel)
            make.top.equalTo(bgView.snp.centerY).offset(5)
        }
        dayLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(bgView.snp.centerY).offset(-10)
            let rightSpace = SCREEN_WIDTH - 135
            make.centerX.equalTo(bgView.snp.right).offset(-(rightSpace - 35)/2 - 35)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(dayLabel.snp.top).offset(-10)
            make.centerX.equalTo(dayLabel)
        }
        useButton.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.top.equalTo(bgView.snp.centerY).offset(10)
            make.centerX.equalTo(nameLabel)
        }
    }
    func setData(amount:Double,total:Double){
        self.amountLabel.text = "￥5.00"
        self.totalLabel.text = "满78元可用"
        self.dayLabel.text = "2016.10.20-2016.10.23 (剩余3天)"
        self.nameLabel.text = "新人有礼十一专享劵"
    }
    func setFrame(){
        self.contentView.backgroundColor = HiTaoBackgroundColor
        bgView.image =  UIImage(named:"img_bg_white")
        self.amountLabel.customColorAndSizeSmall(smallFontSize: 9, bigFontSize: 22, ranges: [NSRange(location: 0, length: 1)], smallColor: customRed, bigColor: customRed)
        self.totalLabel.setFontAndTextColor(font: BigFont, textColor:customGray)
        self.dayLabel.font = SmallFont
        self.dayLabel.setColorsLabel(colors: [customGray,customRed], range: [NSMakeRange(0, 21),NSMakeRange(22, (self.dayLabel.text?.characters.count)! - 22)])
        self.nameLabel.setFontAndTextColor(font: BigFont, textColor: .black)
        self.useButton.setBackgroundImage(UIImage(named:"btn_nor_red_140x60"), for:.normal)
        self.useButton.setTitle("立即使用", for: .normal)
        self.useButton.titleLabel?.font = BigFont
    }
    func setGrayColor(){
        self.amountLabel.textColor = customGray
        self.dayLabel.textColor = customGray
        self.nameLabel.textColor = customGray
        self.useButton.setBackgroundImage(UIImage(named:"btn_nor_gray_140x60"), for:.normal)
        self.useButton.setTitle("已过期", for: .normal)

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
