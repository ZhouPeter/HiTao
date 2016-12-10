//
//  MWPhotoBrowser+Extension.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/10.
//  Copyright © 2016年 周. All rights reserved.
//

import Foundation

import MWPhotoBrowser
extension MWPhotoBrowser{
    //添加清除消失和隐藏导航栏
    func addTouchTap(){
        self.navigationController?.navigationBar.isHidden = true
        let tap =  UITapGestureRecognizer(target: self, action: #selector(MWPhotoBrowser.disMissViewController(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    /// 消失方法
    ///
    /// - Parameter sender: 手势
    func disMissViewController(_ sender:UITapGestureRecognizer){
        if self.enableGrid{
            if self.startOnGrid {
                self.showGrid(true)
                return
            }else if !self.startOnGrid{
                self.hideGrid()
                return
            }
        }
        if self.delegate.responds(to: #selector(MWPhotoBrowserDelegate.photoBrowserDidFinishModalPresentation(_:))){
           self.delegate.photoBrowserDidFinishModalPresentation!(self)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
