//
//  HiTaoPageViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/13.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class HiTaoPageViewController: ButtonBarPagerTabStripViewController {
    //第一次加载
    var isFirst = true
    override func viewDidLoad(){
        self.tabBarController?.tabBar.isTranslucent = false
        self.view.backgroundColor = .white
        self.setNavigationItem()
        //设置头部样式
        settings.style.buttonBarHeight = 30
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor =  customRed
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarMinimumLineSpacing = 40
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 40
        settings.style.buttonBarRightContentInset = 40
        changeCurrentIndexProgressive = {  (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            //保证把所有颜色先变成未选中状态
            if !self.isFirst{
                for subview in self.buttonBarView.subviews{
                    if let cell = subview as? ButtonBarViewCell{
                        cell.label.textColor = .black
                    }
                }
            }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = customRed
        }
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        

    }
    override func viewWillDisappear(_ animated: Bool) {
        self.isFirst = false
        self.moveToIndex(index: 0)
    }
    
    func leftAction(_ sender:UIBarButtonItem){
        self.moveToIndex(index: 0)
    }
    
    //设置导航栏
    private func setNavigationItem(){
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"classificationItem"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"messageItem"), style: .plain, target: self, action: nil)
        self.navigationItem.title = middleTitle
    }
    //移动关注的子页面
    private  func moveToIndex(index:Int){
        if self.canMoveTo(index: index){
            self.moveToViewController(at: index, animated: true)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 重写添加子页面的代理方法
    ///
    /// - parameter pagerTabStripController: 添加对象
    ///
    /// - returns: 返回子页面数组
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = TableChildExampleViewController( itemInfo: IndicatorInfo(title: "聚惠"),index:0)
        let child_2 = TableChildExampleViewController( itemInfo: IndicatorInfo(title: "热搜"),index:1)
        let child_3 = TableChildExampleViewController( itemInfo: IndicatorInfo(title: "上新"),index:2)
        return [child_1, child_2,child_3]
    }
    


}
