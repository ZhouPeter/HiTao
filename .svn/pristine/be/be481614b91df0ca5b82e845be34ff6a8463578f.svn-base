//
//  DetailTopView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/21.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class DetailsTopView: UIView {
    let viewWidth  = (SCREEN_WIDTH-3)/4
    var serviceView = ItemView(image: "icon_service", title: "客服")
    var shopView = ItemView(image: "icon_shop", title: "店铺")
    var collectionView = ItemView(image: "icon_collection", title: "收藏")
    var cartView = ItemView(image: "icon_shopping", title: "购物车")
    var lineView1 = UIView()
    var lineView2 = UIView()
    var lineView3 = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(serviceView)
        self.addSubview(shopView)
        self.addSubview(collectionView)
        self.addSubview(cartView)
        self.addSubview(lineView1)
        self.addSubview(lineView2)
        self.addSubview(lineView3)
        self.setAllAttributes()
        
    }
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFormat()
    }
    
    func setLayout(){
        serviceView.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(viewWidth)
        }
        lineView1.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.centerY.equalTo(serviceView)
            make.left.equalTo(serviceView.snp.right)
        }
        shopView.snp.makeConstraints { (make) in
            make.size.equalTo(serviceView)
            make.left.equalTo(serviceView.snp.right).offset(1)
            make.centerY.equalToSuperview()
        
        }
        lineView2.snp.makeConstraints { (make) in
            make.size.equalTo(lineView1)
            make.centerY.equalTo(shopView)
            make.left.equalTo(shopView.snp.right)
        }
        collectionView.snp.makeConstraints { (make) in
            make.size.equalTo(serviceView)
            make.left.equalTo(shopView.snp.right).offset(1)
            make.centerY.equalToSuperview()

            
        }
        lineView3.snp.makeConstraints { (make) in
            make.size.equalTo(lineView1)
            make.centerY.equalTo(collectionView)
            make.left.equalTo(collectionView.snp.right)
        }
        cartView.snp.makeConstraints { (make) in
            make.size.equalTo(serviceView)
            make.left.equalTo(collectionView.snp.right).offset(1)
            make.centerY.equalToSuperview()
        }
        
    }
    func setData(){
        
    }
    func setFormat(){
        
        self.lineView1.backgroundColor = customGray
        self.lineView2.backgroundColor = customGray
        self.lineView3.backgroundColor = customGray

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


class ItemView: UIView {
    var itemImageView = UIImageView()
    var titleLabel = UILabel()
    convenience init(image:String,title:String){
        self.init(frame:CGRect.zero)
        self.addSubview(itemImageView)
        self.addSubview(titleLabel)
        self.setAllAttributes(image:image,title: title)
    }
    
    func setAllAttributes(image:String,title:String){
        self.setLayout()
        self.setData(image:image,title:title)
        self.setFormat()
    }
    
    func setLayout(){
        itemImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(15)
            make.width.equalTo(20)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(itemImageView)
            make.top.equalTo(itemImageView.snp.bottom).offset(4)
        }

    }
    func setData(image:String,title:String){
        self.itemImageView.image = UIImage(named:image)
        self.titleLabel.text = title
    }
    func setFormat(){
        titleLabel.font = MiddleFont
    
    }
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
