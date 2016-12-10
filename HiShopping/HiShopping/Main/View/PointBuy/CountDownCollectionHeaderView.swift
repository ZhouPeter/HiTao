//
//  CountDownCollectionHeaderView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/27.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CountDownCollectionHeaderView: UICollectionReusableView {
    var timeSeconds = 10000
    var messageLabel = UILabel()
    var  timeLabel = UILabel()
    var leftLineView = UIView()
    var rightLineView = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(messageLabel)
        self.addSubview(timeLabel)
        self.addSubview(leftLineView)
        self.addSubview(rightLineView)
        self.setAllAttributes()
        
    }
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFormat()
    }
    
    func setLayout(){
        messageLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(messageLabel.snp.bottom).offset(7.5)
        }
    }
    func setData(){
        CountDown.startTime(time: timeSeconds) { (timeout) in
            self.setTime(timeout: timeout)
        }
    }
    func setFormat(){
        self.messageLabel.text = "距离结束还剩"
        self.messageLabel.setFontAndTextColor(font: SmallFont, textColor: customGray)
        self.timeLabel.setFontAndTextColor(font: SmallFont, textColor: .black)
    }
    
    
    /// 设置时间
    ///
    /// - parameter timeout: 剩余倒计时秒数
    func setTime(timeout:Int)  {
        let timeClock = TimeHelper.getTimeOnClock(second: timeout)
        self.timeLabel.text = "\(timeClock.hour):\(timeClock.minute):\(timeClock.second)"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
