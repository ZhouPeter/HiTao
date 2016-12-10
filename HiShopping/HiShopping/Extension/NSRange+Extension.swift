//
//  Range+Extension.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/20.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit


extension NSRange{
    
    /// NSRange转换成Range<String.Index>
    ///
    /// - Parameter content: 内容字符串
    /// - Returns: 返回Range<String.Index>
    func toRangeByString(content:String) -> Range<String.Index> {
        let startIndex =  content.characters.index(content.startIndex, offsetBy: self.location)
        let endIndex = content.characters.index(content.startIndex, offsetBy: self.location + self.length)
        let newRange :Range<String.Index> = Range(uncheckedBounds: (startIndex,endIndex))
        return newRange
    }
   
}






