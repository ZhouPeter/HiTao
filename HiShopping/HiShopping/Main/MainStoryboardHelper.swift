//
//  MainStoryboardHelper.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/11.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MainStoryboardHelper: NSObject {
    
    static let storyboardName = "Main"
    static let navigationController = "mainNavigationController"
    static let mainViewController = "mainViewController"
    static let searchViewController = "searchViewController"
    static let pointBuyViewController = "pointBuyViewController"
    static let todayCheapViewController = "todayCheapViewController"
    class func instantiateViewController( identifier: String) -> UIViewController {
        let storyboard:UIStoryboard!
        storyboard = UIStoryboard(name:self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController
    }
}
