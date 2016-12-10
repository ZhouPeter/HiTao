//
//  CustomButtonView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/10.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
@IBDesignable
class CustomButtonView: UIView {
    var imageView : UIImageView!
    var titleLabel: UILabel!
    @IBInspectable var title :String  = ""{
        didSet{
            titleLabel.text = title
        }
    }
    @IBInspectable var image :String  = ""{
        didSet{
            imageView.image = UIImage(named: "new")
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView()
        titleLabel = UILabel()
        titleLabel.font = MiddleFont
        titleLabel.textAlignment = .center
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(35)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(43)
            make.width.equalTo(50)
            make.height.equalTo(9)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
