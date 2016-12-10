//
//  ProgressCircleView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/22.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class ProgressCircleView: UIView {
   var bgView = UIImageView()
   var topLabel = UILabel()
   var bottomLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(bgView)
        self.addSubview(topLabel)
        self.addSubview(bottomLabel)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setLayout()
        self.setFrame()
    }
    
    func setLayout(){
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        topLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.bgView.snp.centerY).offset(-3.5-3)
        }
        bottomLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.bgView.snp.centerY).offset(-3.5+3)
        }
    
        
    }
    func setData(visualCount:Int,allCount:Int){
        self.topLabel.text = String(visualCount)
        self.bottomLabel.text = String(allCount)
    }
    func setFrame(){
        self.bgView.image = #imageLiteral(resourceName: "icon_progress")
        self.topLabel.font = SmallFont
        self.bottomLabel.font = SmallFont
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
