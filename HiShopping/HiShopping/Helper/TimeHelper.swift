//
//  TimeHelper.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/27.
//  Copyright © 2016年 周. All rights reserved.
//

import Foundation

class TimeHelper {
    /// 获取时钟时间
    ///
    /// - parameter second: 倒计时秒数
    ///
    /// - returns: 返回时钟类型元组
    class func getTimeOnClock(second:Int)->(hour:String,minute:String,second:String){
        let hour = second/3600
        let minute = (second-hour * 3600)/60
        let newSecond = (second-hour*3600 - minute*60)%60
        return((hour:intToString(intTime: hour),minute:intToString(intTime: minute),second:intToString(intTime: newSecond)))
    }
    
    
    /// 数字转换成2位字符串
    ///
    /// - parameter intTime: 转换数字
    ///
    /// - returns: 返回2位字符串
    class func intToString(intTime:Int)->String{
        var timeString :String = ""
        if String(intTime).lengthOfBytes(using: String.Encoding.utf8)<2{
            timeString = "0\(intTime)"
        }else{
            timeString = "\(intTime)"
        }
        return timeString
    }
}
