//
//  UI.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/19.
//  Copyright © 2016年 周. All rights reserved.
//
import UIKit




extension UIViewController{
    //设置导航标题
    func setNavigationTitle(_ title:String?){
         self.navigationItem.title = title

    }
    //添加返回按钮 默认标题为""
    func addBackItem(title:String = ""){
        let backItem = UIBarButtonItem()
        backItem.title = title
        self.navigationController?.navigationBar.tintColor = .black
        let backgroundImage = UIImage(named:"icon_arrow_left")
        let backImage = backgroundImage?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0))
        backItem.setBackButtonBackgroundImage(backImage, for: .normal, barMetrics: .default)
        backItem.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: 0), for: .default)
        self.navigationItem.backBarButtonItem = backItem
    }
    //修改右侧导航栏按钮字体大小
    func setRightItem(fontSize:CGFloat){
        let rightItem = self.navigationItem.rightBarButtonItem
        rightItem?.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)], for: .normal)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    func returnAction(_ sender:UIBarButtonItem){
        self.navigationController?.customPopViewController(animated: true)
    }
}
