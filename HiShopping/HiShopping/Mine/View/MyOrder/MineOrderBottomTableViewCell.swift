//
//  MineOrderBottomTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/21.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MineOrderBottomTableViewCell: UITableViewCell {
    var numberTitleLabel = UILabel()
    var numberLabel = UILabel()
    var button1 = UIButton()
    var button2 = UIButton()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(numberTitleLabel)
        self.contentView.addSubview(numberLabel)
        self.contentView.addSubview(button1)
        self.contentView.addSubview(button2)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFormat()
    }
    
    func setLayout(){
        numberTitleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(15)
        }
        numberLabel.snp.makeConstraints { (make) in
            make.left.equalTo(numberTitleLabel.snp.right).offset(2)
            make.top.equalTo(numberTitleLabel)
            
        }
        button1.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(25)
            make.top.equalTo(numberTitleLabel)
            make.right.equalTo(button2.snp.left).offset(-20)
        }
        button2.snp.makeConstraints { (make) in
            make.width.height.equalTo(button1)
            make.top.equalTo(button1)
            make.right.equalToSuperview().offset(-10)
        }
        
        
    }
    func setData(){
        self.numberLabel.text = "1122331717731319"
        self.button1.setTitle("追踪物流", for: .normal)
        self.button2.setTitle("评价", for: .normal)
    }
    func setFormat(){
        self.numberTitleLabel.text = "运单编号:"
        self.numberTitleLabel.textColor = customGray
        self.numberTitleLabel.font = MiddleFont
        self.numberLabel.font = MiddleFont
        self.button1.titleLabel?.font = MiddleFont
        self.button1.setTitleColor(.black, for: .normal)
        self.button2.titleLabel?.font = MiddleFont
        self.button1.setBackgroundImage(UIImage(named:"btn_nor_gray_120x50"), for: .normal)
        self.button2.setBackgroundImage(UIImage(named:"btn_nor_red_120x50"), for: .normal)
   
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
