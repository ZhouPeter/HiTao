//
//  CountDown.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/11.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CountDown: NSObject {
    static var time = 5  

    /// 倒计时方法
    ///
    /// - parameter time:      倒计时时间
    /// - parameter timeBlock: 回调方法
    class func startTime(time : Int ,completion:@escaping  (Int)->()){
        var timeout: Int = time
        let queue: DispatchQueue = DispatchQueue.global()
        let timer: DispatchSource = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: UInt(0)), queue: queue) as! DispatchSource
        // 每秒执行
        timer.scheduleRepeating(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(0), interval: DispatchTimeInterval.seconds(1), leeway: DispatchTimeInterval.seconds(0))
        timer.setEventHandler { () -> Void in
            if timeout <= 0 {
                // 倒计时结束
                timer.cancel()
                DispatchQueue.main.async(execute: { () -> Void in
                    // 如需更新UI 代码请写在这里
                    completion(timeout)

                })
                
            } else {                
                timeout -= 1
                DispatchQueue.main.async(execute: { () -> Void in
                    completion(timeout)
                    // 如需更新UI 代码请写在这里
                })
                
            }
        }
        timer.resume()
        
    }
    
    class  func timerFire() {
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountDown.timeFireMethod(_:)), userInfo: nil, repeats: true)
    }
    class func timeFireMethod(_ timer:Timer){
        print("nowTime\(time)")
        self.time = time - 1
        if self.time == 0{
            timer.invalidate()
        }
        
    }
    
}
