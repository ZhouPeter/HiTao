//
//  MineOrderViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/20.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class MineOrderViewController: ButtonBarPagerTabStripViewController {
    //第一次加载
    var isFirst = true
    override func viewDidLoad(){
        self.view.backgroundColor = .white
        self.navigationItem.title = myOrderTitle

        settings.style.buttonBarHeight = 30
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor =  customRed
        settings.style.buttonBarItemFont = BigFont
        settings.style.selectedBarHeight = 1
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
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
            oldCell?.label.textColor = .black
            newCell?.label.textColor = customRed
        }
        super.viewDidLoad()

    }
    
    private func setNavigationItem(){
        self.navigationController?.navigationBar.isTranslucent = false
        let rightItem = UIBarButtonItem(image: UIImage(named:"nav_icon_message"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightItem

    }
    
    func  disMissMineOrder(){
        self.dismiss(animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = MineOrderChildViewController( itemInfo: IndicatorInfo(title: "全部"),index:0)
        let child_2 = MineOrderChildViewController( itemInfo: IndicatorInfo(title: "待付款"),index:1)
        let child_3 = MineOrderChildViewController( itemInfo: IndicatorInfo(title: "待发货"),index:2)
        let child_4 = MineOrderChildViewController( itemInfo: IndicatorInfo(title: "待收货"),index:3)
        let child_5 = MineOrderChildViewController( itemInfo: IndicatorInfo(title: "待评价"),index:4)
        return [child_1, child_2,child_3,child_4, child_5]
    }

    

}
