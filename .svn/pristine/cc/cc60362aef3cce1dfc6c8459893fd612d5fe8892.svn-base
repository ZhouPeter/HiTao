//
//  UILabel+Extension.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit



extension UILabel{
    
    /// 设置最新价格label 前后大小不一
    ///
    /// - Parameters:
    ///   - headerFontSize: 头部字体尺寸
    ///   - footerFontSize: 尾部字体尺寸
    func setNewLabel(headerFontSize:CGFloat ,footerFontSize:CGFloat){
        self.font = UIFont.systemFont(ofSize: headerFontSize)
        let content: String = self.text!
        let range = NSMakeRange(1, content.characters.count - 1)
        let attributeString : NSMutableAttributedString = NSMutableAttributedString(string: content)
        attributeString.addAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: footerFontSize),NSForegroundColorAttributeName:customRed], range: range)
        self.attributedText = attributeString
    }
    
    /// 设置老价格label 添加删除线
    ///
    /// - Parameter fontSize: 字体大小
    func setOldLabel(fontSize:CGFloat){
        self.font = UIFont.systemFont(ofSize: fontSize)
        let content: String = self.text!
        let range = NSMakeRange(0, content.characters.count )
        let attributeString : NSMutableAttributedString = NSMutableAttributedString(string: content)
        attributeString.addAttributes([NSStrikethroughStyleAttributeName:NSNumber(value:1),NSForegroundColorAttributeName:customGray], range: range)
        self.attributedText = attributeString
        
    }
   
    /// 不同范围设置不同颜色
    ///
    /// - Parameters:
    ///   - colors: 颜色数组
    ///   - range: 范围数组
    func setColorsLabel(colors:[UIColor],range:[NSRange]){
        let content: String = self.text!
        let attributeString : NSMutableAttributedString = NSMutableAttributedString(string: content)
        for i in 0 ..< colors.count{
            attributeString.addAttribute(NSForegroundColorAttributeName, value: colors[i], range: range[i])
        }
        self.attributedText = attributeString
    }
    /// 自定义label文本不同范围的字体颜色和尺寸
    ///
    /// - Parameters:
    ///   - smallFontSize: 小字体尺寸
    ///   - bigFontSize: 大字体尺寸
    ///   - ranges: 大字体的范围
    ///   - smallColor: 小字体颜色
    ///   - bigColor: 大字体颜色
    func customColorAndSizeBig(smallFontSize:CGFloat ,bigFontSize:CGFloat,ranges:[NSRange]?,smallColor: UIColor,bigColor:UIColor ){
        self.font = UIFont.systemFont(ofSize: smallFontSize)
        self.textColor = smallColor
        let content: String = self.text!
        let attributeString : NSMutableAttributedString = NSMutableAttributedString(string: content)
        if let ranges = ranges{
            for range in ranges {
                attributeString.addAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: bigFontSize),NSForegroundColorAttributeName:bigColor], range: range)
            }
        }
        self.attributedText = attributeString
    }
    
    /// 自定义label文本不同范围的字体颜色和尺寸
    ///
    /// - Parameters:
    ///   - smallFontSize: 小字体尺寸
    ///   - bigFontSize: 大字体尺寸
    ///   - ranges: 小字体的范围
    ///   - smallColor: 小字体颜色
    ///   - bigColor: 大字体颜色
    func customColorAndSizeSmall(smallFontSize:CGFloat ,bigFontSize:CGFloat,ranges:[NSRange]?,smallColor: UIColor,bigColor:UIColor ){
        self.font = UIFont.systemFont(ofSize: bigFontSize)
        self.textColor = bigColor
        let content: String = self.text!
        let attributeString : NSMutableAttributedString = NSMutableAttributedString(string: content)
        if let ranges = ranges{
            for range in ranges {
                attributeString.addAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: smallFontSize),NSForegroundColorAttributeName:smallColor], range: range)
            }
            
        }
        self.attributedText = attributeString
    }
    
    /// 同时设置颜色和大小
    ///
    /// - Parameters:
    ///   - font: 字体尺寸
    ///   - textColor: 字体颜色
    func setFontAndTextColor(font:UIFont,textColor:UIColor){
        self.font = font
        self.textColor = textColor
    }
}
