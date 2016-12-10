//
//  DetailsStoryboardHelper.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/2.
//  Copyright © 2016年 周. All rights reserved.
//

import Foundation
class DetailsStoryboardHelper: NSObject {
    
    static let storyboardName = "Details"
    static let navigationController = "classNavigationController"
    static let confirmOrderViewController = "confirmOrderViewController"
    
    class func instantiateViewController( identifier: String) -> UIViewController {
        let storyboard:UIStoryboard!
        storyboard = UIStoryboard(name:self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController
    }
    
}
