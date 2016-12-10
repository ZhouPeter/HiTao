//
//  CartStoryboardHelper.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/18.
//  Copyright © 2016年 周. All rights reserved.
//

import Foundation


class CartStoryboardHelper: NSObject {
    
    static let storyboardName = "Cart"
    static let navigationController = "cartNavigationController"
    class func instantiateViewController( identifier: String) -> UIViewController {
        let storyboard:UIStoryboard!
        storyboard = UIStoryboard(name:self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController
    }
    
}
