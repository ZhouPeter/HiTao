//
//  PayModeHeaderView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/2.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class PayModeHeaderView: UITableViewHeaderFooterView {
    var whiteView = UIView()
    var titleLabel = UILabel()
    var isOpenImageView = UIImageView()
    var completion: (()->())!
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(whiteView)
        self.whiteView.addSubview(titleLabel)
        self.whiteView.addSubview(isOpenImageView)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setLayout()
        self.addTarget()
        self.setFormat()
    }
    
    func setLayout(){
        whiteView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(5)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        isOpenImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)

        }
    }
    func addTarget(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(PayModeHeaderView.morePayMode(_:)))
        self.whiteView.addGestureRecognizer(tap)
    }
    func morePayMode(_ tap:UITapGestureRecognizer){
  
        self.completion()
    }
    func setFormat(){
        self.whiteView.backgroundColor = .white
        self.titleLabel.font = BigFont
        self.titleLabel.text = "支付方式"
        self.isOpenImageView.image = #imageLiteral(resourceName: "bottom_arrow")
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
