//
//  RoundView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/14.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import AVFoundation




extension UIView {
    
    /// 直接正方形设置圆形
    func ViewToRoundView(borderWidth:CGFloat = 0,borderColor:UIColor = .white) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners:  UIRectCorner.allCorners, cornerRadii: self.bounds.size)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        if borderWidth > 0{
            let borderLayer = CAShapeLayer()
            // 用贝赛尔曲线画线，path 其实是在线的中间，这样会被 layer.mask（遮罩层)遮住一半，故在 halfWidth 处新建 path，刚好产生一个内描边
            let halfWidth =  borderWidth/2
            let f = CGRect(x: halfWidth, y: halfWidth, width:  self.bounds.width - borderWidth, height: self.bounds.height - borderWidth)
            borderLayer.path = UIBezierPath(roundedRect: f, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: self.bounds.size).cgPath
            borderLayer.fillColor = UIColor.clear.cgColor
            borderLayer.strokeColor = borderColor.cgColor
            borderLayer.lineWidth = borderWidth
            borderLayer.frame = CGRect(x:0,y:0,width:f.width,height:f.height)
            self.layer.addSublayer(borderLayer)
        }
    }
    
    
    /// 根据圆角系数设置图形圆角
    /// - parameter cornerRadius: 圆角系数
    func ViewToRoundViewBycornerRadius(cornerRadius:CGFloat = 0,borderWidth:CGFloat = 0,borderColor:UIColor = .white) {
        
        let maskPath = UIBezierPath(roundedRect: self.bounds, cornerRadius:cornerRadius)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        if borderWidth > 0{
            let borderLayer = CAShapeLayer()
            // 用贝赛尔曲线画线，path 其实是在线的中间，这样会被 layer.mask（遮罩层)遮住一半，故在 halfWidth 处新建 path，刚好产生一个内描边
            let halfWidth =  borderWidth/2
            let f = CGRect(x: halfWidth, y: halfWidth, width:  self.bounds.width - borderWidth, height: self.bounds.height - borderWidth)
            borderLayer.path = UIBezierPath(roundedRect: f, cornerRadius:cornerRadius).cgPath
            borderLayer.fillColor = UIColor.clear.cgColor
            borderLayer.strokeColor = borderColor.cgColor
            borderLayer.lineWidth = borderWidth
            borderLayer.frame = CGRect(x:0,y:0,width:f.width,height:f.height)
            self.layer.addSublayer(borderLayer)
        }

    }
}
