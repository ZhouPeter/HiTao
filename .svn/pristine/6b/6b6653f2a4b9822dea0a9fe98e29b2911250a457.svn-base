//
//  CheapTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/13.
//  Copyright © 2016年 周. All rights reserved.
//
protocol CheapTableViewCellDelegate:NSObjectProtocol{
    func setPriceHidden()
}
import UIKit

class CheapTableViewCell: UITableViewCell {

    weak var delegate : CheapTableViewCellDelegate?
    var productImageView = UIImageView()
    
    var bottomView = BottomView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(productImageView)
        self.contentView.addSubview(bottomView)
        self.setAllAttributes()
    }
    
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFormat()
        self.delegate?.setPriceHidden()
    }
   func setLayout(){
         self.productImageView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
         }
    
         self.bottomView.snp.makeConstraints { (make) in
            make.width.left.bottom.equalToSuperview()
            make.height.equalTo(34)
         }
    
    
    }
    func setFormat(){
        self.productImageView.contentMode = .scaleAspectFill
        self.productImageView.clipsToBounds = true
    }
    func  setData(){
        self.productImageView.image = UIImage(named:"bourkestreetbakery")
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
class BottomView: UIView {
    var productNameLabel = UILabel()
    var productNewLabel = UILabel()
    var productOldLabel = UILabel()
    var followImageView = UIImageView()
    var followCountLabel = UILabel()
    var starImageView = UIImageView()
    var starCountLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = RGBAndAlpha(r: 255, g: 255, b: 255, a: 0.8)
        self.addSubview(productNameLabel)
        self.addSubview(productNewLabel)
        self.addSubview(productOldLabel)
        self.addSubview(followImageView)
        self.addSubview(followCountLabel)
        self.addSubview(starImageView)
        self.addSubview(starCountLabel)
        self.setAllAttributes()
    }
    
    func setAllAttributes(){
        setLayout()
        setData()
        setFormat()
    }
    func setLayout(){
        self.productNameLabel.snp.makeConstraints { (make) in
            make.height.equalTo(14)
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        self.productNewLabel.snp.makeConstraints { (make) in
            make.left.equalTo(productNameLabel.snp.right).offset(10)
            make.centerY.equalTo(productNameLabel)
        }
        self.productOldLabel.snp.makeConstraints { (make) in
            make.left.equalTo(productNewLabel.snp.right).offset(10)
            make.centerY.equalTo(productNameLabel)
        }
        self.starCountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(productNameLabel)
            make.right.equalToSuperview().offset(-10)
        }
        self.starImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(10)
            make.right.equalTo(starCountLabel.snp.left).offset(-5)
            make.centerY.equalTo(productNameLabel)
        }
        self.followCountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(productNameLabel)
            make.right.equalTo(starImageView.snp.left).offset(-10)
        }
        self.followImageView.snp.makeConstraints { (make) in
            make.width.equalTo(13)
            make.height.equalTo(10)
            make.right.equalTo(followCountLabel.snp.left).offset(-5)
            make.centerY.equalTo(productNameLabel)
        }
        

    }
    func setFormat(){
        self.productNameLabel.font = BigFont
        self.productNewLabel.setNewLabel(headerFontSize:12,footerFontSize: 18)
        self.productOldLabel.setOldLabel(fontSize: 12)
        self.starCountLabel.font = BigFont
        self.followCountLabel.font = BigFont
    
        
    }
    func  setData(){
        self.productNameLabel.text = "新上市蓝莓"
        self.productNewLabel.text = "￥98"
        self.productOldLabel.text = "￥180"
        self.starCountLabel.text = "180"
        self.starImageView.image = UIImage(named:"star")
        self.followCountLabel.text = "280"
        self.followImageView.image = UIImage(named:"eye")

    }
       required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
