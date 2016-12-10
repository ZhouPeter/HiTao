//
//  SearchResultViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/26.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class SearchResultViewController: ButtonBarPagerTabStripViewController {
    //第一次加载
    var isFirst = true
    override func viewDidLoad(){
        self.view.backgroundColor = .white
        self.setNavigationItem()
        settings.style.buttonBarHeight = 30
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor =  customRed
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2
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
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(SearchResultViewController.backAction(_:)))

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "调整", style: .plain, target: self, action:#selector(SearchResultViewController.editAction(_:)) )
        self.navigationItem.leftBarButtonItem?.tintColor = customGray
        self.navigationItem.rightBarButtonItem?.tintColor = customGray
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName:BigFont], for: .normal)
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSFontAttributeName:BigFont], for: .normal)

        self.navigationItem.title = "鸭舌帽"
    }
    func backAction(_ sender: UIBarButtonItem){
        self.navigationController?.customPopViewController(animated: true)
    }
    func editAction(_ sender:UIBarButtonItem){
        print("startEditing........")
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
    

    private  func moveToIndex(index:Int){
        if self.canMoveTo(index: index){
            self.moveToViewController(at: index, animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = ResultChildViewController( itemInfo: IndicatorInfo(title: "综合"),index:0)
        let child_2 = ResultChildViewController( itemInfo: IndicatorInfo(title: "销量"),index:1)
        let child_3 = ResultChildViewController( itemInfo: IndicatorInfo(title: "价格"),index:2)
        let child_4 = ResultChildViewController( itemInfo: IndicatorInfo(title: "包邮"),index:3)

        return [child_1, child_2,child_3,child_4]
    }
    
    


}
