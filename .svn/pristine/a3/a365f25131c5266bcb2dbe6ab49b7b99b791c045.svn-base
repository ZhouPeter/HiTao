//
//  MainTabBarViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import MMDrawerController
class MainTabBarViewController: UITabBarController {
    var middleButton :UIButton!
    override func viewDidLoad() {
         self.tabBar.isTranslucent = false
        super.viewDidLoad()
         self.addAllChild()
    }
    func addChild(_ childNavi: UIViewController, title: String?, image: String, selected: String){
        // UIImageRenderingModeAlwaysOriginal 始终绘制图片原始状态，不使用Tint Color
        var tabBarItem : UITabBarItem!
        
        if title == "爱淘" {
            addMiddleButton(image , seclectedImage: selected)
            tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        }
        else{
            tabBarItem = UITabBarItem(title: title, image: UIImage(named: image)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: selected)?.withRenderingMode(.alwaysOriginal))
        }
        // 设置选中BarItem的文字颜色
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.black], for: .normal)
        childNavi.tabBarItem = tabBarItem
        //如果是第一个需要添加侧边栏

        self.addChildViewController(childNavi)
        
    }
    func addMiddleButton(_ image:String,seclectedImage:String) {
        self.middleButton = UIButton(type: UIButtonType.custom)
        middleButton.tag = 10086
        middleButton.frame = CGRect(x:(SCREEN_WIDTH-40)/2, y: -10, width: 40, height: 40)
        middleButton.addTarget(self, action: #selector(UITabBarController.selectMiddle(_:)), for: .touchUpInside)
        middleButton.setImage(UIImage(named:image), for: .normal)
        middleButton.setImage(UIImage(named:image), for: .highlighted)
        self.tabBar.addSubview(middleButton)
    }
    func  addAllChild(){
        let mainNavigation = MainStoryboardHelper.instantiateViewController(identifier: MainStoryboardHelper.navigationController)
        addChild(mainNavigation, title: titleArray[0], image: "icon_home_nor", selected: "icon_home_sel")
        let classNavigation = ClassStoryboardHelper.instantiateViewController(identifier:ClassStoryboardHelper.navigationController)
        addChild(classNavigation, title:  titleArray[1], image: "icon_classify_nor", selected: "icon_classify_sel")
        let hiTaoNavigation = UINavigationController(rootViewController: HiTaoPageViewController())
        addChild(hiTaoNavigation, title:  titleArray[2], image: "icon_amoy", selected: "icon_amoy")
        let cartNavigation = CartStoryboardHelper.instantiateViewController(identifier:CartStoryboardHelper.navigationController)
        addChild(cartNavigation, title:  titleArray[3], image: "icon_shopping_nor_red", selected: "icon_shopping_sel_red")
        let mineNavigation = MineStoryboardHelper.instantiateViewController(identifier:MineStoryboardHelper.navigationController)
        addChild(mineNavigation, title:  titleArray[4], image: "icon_mine_nor", selected: "icon_mine_sel")
        
    }
    


}
extension UITabBarController{
    func tabBarHidden(isHidden:Bool){
        self.tabBar.isHidden = isHidden
        let middleButton = self.view.viewWithTag(10086)
        middleButton?.isHidden = isHidden
    }
    func selectMiddle(_ sender: UIButton){
        self.selectedIndex = 2
    }

}
