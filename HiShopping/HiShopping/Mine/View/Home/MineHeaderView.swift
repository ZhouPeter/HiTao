//
//  MineHeaderView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
protocol MineHeaderViewDelegate :NSObjectProtocol{
    func pushToMineOrderViewController()
}
class MineHeaderView: UITableViewHeaderFooterView {

   var headerTitleLabel = UILabel()
   var moreButton = UIButton()
    
    var delegate : MineHeaderViewDelegate!
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor =  HiTaoBackgroundColor
        self.contentView.addSubview(headerTitleLabel)
        self.contentView.addSubview(moreButton)
        self.setAllAttributes()
    }
    
    
    func setAllAttributes(){
        self.setLayout()
        self.setFormat()
    }
    
    
    func setLayout(){
        headerTitleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        moreButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
    }
    func setData(title:String){
        self.headerTitleLabel.text = title
        self.moreButton.setImage(UIImage(named:"icon_arrow_right_more"), for: .normal)
        self.moreButton.addTarget(self, action: #selector(MineHeaderView.moreAction(_:)), for: .touchUpInside)
        
    }
    
    func moreAction(_ sender:UIButton){
        self.delegate.pushToMineOrderViewController()
    }
    func setFormat(){
        self.headerTitleLabel.font = BigFont
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
