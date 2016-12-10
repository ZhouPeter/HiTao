//
//  PointBuyViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/26.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import Popover
import XLPagerTabStrip
class PointBuyViewController: ButtonBarPagerTabStripViewController {
    //第一次加载
    var isFirst = true
    override func viewDidLoad(){
        self.view.backgroundColor = .white
        settings.style.buttonBarHeight = 50
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor =  .black
        settings.style.buttonBarItemFont = .systemFont(ofSize: 11)
        settings.style.selectedBarHeight = 0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = customGray
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
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
            oldCell?.label.textColor = customGray
            newCell?.label.textColor = .black
        }
        super.viewDidLoad()
     
   
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.isFirst = false

    }
    override func viewWillAppear(_ animated: Bool) {
    }
  
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        self.setRightPopoverView()

    }

   
    /// 设置右侧弹出框
    private func setRightPopoverView(){
        let startPoint = CGPoint(x: SCREEN_WIDTH - 80, y: 64)
        let options = [
            .type(.down),
            .cornerRadius(10),
            .animationIn(0.3),
            .blackOverlayColor(RGBAndAlpha(r: 222, g: 222, b: 222, a: 0.8)),
            .arrowSize(CGSize.zero)
            ] as [PopoverOption]
        let popover = Popover(options: options, showHandler: nil, dismissHandler: nil)
        let view = MenuContentView(frame:CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 0))
        //设置闭包可以回传选择值 暂时只做了页面消失
        view.completion = {
            popover.dismiss()
        }
        popover.show(view, point: startPoint)
  
    }
//    //设置导航栏
//    private func setNavigationItem(){
//        self.navigationController?.navigationBar.isTranslucent = false
//    }
    //头部移动
    private  func moveToIndex(index:Int){
        if self.canMoveTo(index: index){
            self.moveToViewController(at: index, animated: true)
         }
    }
    

    //设置子viewController
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = PointBuyChildViewController( itemInfo: IndicatorInfo(title: "10:00\n已经秒杀"),index:0)
        let child_2 = PointBuyChildViewController( itemInfo: IndicatorInfo(title: "11:00\n已经秒杀"),index:1)
        let child_3 = PointBuyChildViewController( itemInfo: IndicatorInfo(title: "13:00\n正在秒杀"),index:2)
        let child_4 = PointBuyChildViewController( itemInfo: IndicatorInfo(title: "15:00\n将要秒杀"),index:2)
        let child_5 = PointBuyChildViewController( itemInfo: IndicatorInfo(title: "17:00\n将要秒杀"),index:2)
    
        return [child_1, child_2,child_3,child_4,child_5]
    }

   
}
