//
//  AppDelegate.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/9.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import MMDrawerController
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var leftSlideVC: LeftSlideViewController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //开启键盘管理
        IQKeyboardManager.sharedManager().enable = true
        //设置窗口大小和rootVC
        self.window = UIWindow(frame: CGRect(x: 0,y: 0,width: SCREEN_WIDTH,height: SCREEN_HEIGTH))

        let guide = UserDefaults.standard.object(forKey: "guide") as? String
        if guide == nil{
            self.window?.rootViewController = GuideViewController()
        }else{
            let leftViewController = LeftDrawerViewController()
            leftViewController.view.backgroundColor = .white
             let mainViewController = MainTabBarViewController()
             leftSlideVC = LeftSlideViewController(leftView: leftViewController, andMainView:mainViewController)
            leftSlideVC.setPanEnabled(false)
            self.window?.rootViewController =  leftSlideVC
 
        }
        self.window?.makeKeyAndVisible()
        return true
    }
    //MMDrawerController的实现
    //            let drawerViewController = MMDrawerController(center: MainTabBarViewController(), leftDrawerViewController: leftViewController)
    //            drawerViewController?.maximumLeftDrawerWidth = SCREEN_WIDTH*0.5
    //            drawerViewController?.openDrawerGestureModeMask = .all
    //            drawerViewController?.closeDrawerGestureModeMask = .all

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

