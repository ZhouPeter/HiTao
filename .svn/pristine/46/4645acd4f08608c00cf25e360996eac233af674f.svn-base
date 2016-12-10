//
//  UIColorExtension.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit


extension UIColor{
    
      //string转换成UIColor
    
      /// 16进制字符串转换成rbg颜色
      ///
      /// - Parameter hexString: 16进制字符串
      /// - Returns: 颜色
      class func hexStringToColor(_ hexString: String) -> UIColor{
        var cString: String = (hexString as NSString).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if cString.characters.count < 6 {
            return UIColor.black
        }
        if cString.hasPrefix("0X") {
            cString = (cString as NSString).substring(from: 2)
        }
        if cString.hasPrefix("#") {
            cString = (cString as NSString).substring(from:1)
        }
        if cString.characters.count != 6 {
            return UIColor.black
        }
        var range: NSRange = NSMakeRange(0, 2)
        
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
        
    }
    //生成纯色image
    func imageFromColor() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
    }
    //随机颜色
    class func randomColor() ->UIColor {
        return UIColor(red: randomValue(), green: randomValue(), blue: randomValue(), alpha: 1)
    }
    
    class  func randomValue()->CGFloat {
        return CGFloat(arc4random_uniform(256))/255
    }
}
