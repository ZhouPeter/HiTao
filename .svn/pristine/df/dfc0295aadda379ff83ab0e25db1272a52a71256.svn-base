//
//  ClassStoryboardHelper.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/12.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class ClassStoryboardHelper: NSObject {
    
        static let storyboardName = "Class"
        static let navigationController = "classNavigationController"
        static let classViewController = "classViewController"

        class func instantiateViewController( identifier: String) -> UIViewController {
            let storyboard:UIStoryboard!
            storyboard = UIStoryboard(name:self.storyboardName, bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
            return viewController
        }

}
