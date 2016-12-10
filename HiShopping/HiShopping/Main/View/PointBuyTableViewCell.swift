//
//  PointBuyTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/11.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
protocol PointBuyTableViewCellDelegate :NSObjectProtocol {
    func pushToProductDetailSViewController(index:Int)
}
class PointBuyTableViewCell: UITableViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var mainProductOneView: UIView!
    @IBOutlet weak var mainProductTwoView: UIView!

    @IBOutlet weak var mainProductThreeView: UIView!
    weak var delegate : PointBuyTableViewCellDelegate!
    var time :Int = 100
    override func awakeFromNib() {
        super.awakeFromNib()
        //开始倒计时
        CountDown.startTime(time: time) { (timeout) in
            self.setTime(timeout: timeout)
        }
        //添加手势
        self.addTap()

    }
    
     /// 添加手势
     private func addTap(){
        mainProductOneView.tag = 1
        mainProductTwoView.tag = 2
        mainProductThreeView.tag = 3
        let tap1  = UITapGestureRecognizer(target: self, action: #selector(PointBuyTableViewCell.touchUpView(_:)))
        let tap2  = UITapGestureRecognizer(target: self, action: #selector(PointBuyTableViewCell.touchUpView(_:)))
        let tap3  = UITapGestureRecognizer(target: self, action: #selector(PointBuyTableViewCell.touchUpView(_:)))
        self.mainProductOneView.addGestureRecognizer(tap1)
        self.mainProductTwoView.addGestureRecognizer(tap2)
        self.mainProductThreeView.addGestureRecognizer(tap3)

    }
    func touchUpView( _ tap : UITapGestureRecognizer){
        //跳转到产品详情页
        self.delegate.pushToProductDetailSViewController(index:(tap.view?.tag)!)
    }
    /// 设置倒计时时间
    ///
    /// - parameter timeout: 剩余倒计时秒数
    func setTime(timeout:Int)  {
        let timeClock = TimeHelper.getTimeOnClock(second: timeout)
        hourLabel.text = timeClock.hour
        minuteLabel.text = timeClock.minute
        secondLabel.text = timeClock.second
    }
    
      override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
