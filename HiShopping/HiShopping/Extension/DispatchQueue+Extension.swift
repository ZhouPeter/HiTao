//
//  DispatchQueue.swift
//  FoodPin
//
//  Created by 周鹏杰 on 16/9/14.
//  Copyright © 2016年 xiaobo. All rights reserved.
//

import UIKit

extension DispatchQueue{
    fileprivate static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    public class func once(token: String, block:(Void)->Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
        
    
    }
}
