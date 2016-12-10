//
//  TopImageButton.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
@IBDesignable
class TopImageButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "friend"), for: .normal)
        self.setTitle("朋友圈", for: .normal)
        self.setTitleColor(.red, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18 )
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBInspectable var space:CGFloat = 0{
        didSet{
            self.initButton()
        }
    }
    func initButton(){
        self.contentVerticalAlignment = .top
        self.contentHorizontalAlignment = .center
        let imageViewWidth :CGFloat! = self.imageView?.intrinsicContentSize.width
        let imageViewHeight :CGFloat! = self.imageView?.intrinsicContentSize.height
        let titleLabelWidth :CGFloat! = self.titleLabel?.intrinsicContentSize.width
//        let titleLabelHeight:CGFloat!  = self.titleLabel?.intrinsicContentSize.height
        //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        self.titleEdgeInsets = UIEdgeInsets(top: imageViewHeight + space, left: -imageViewWidth, bottom: 0, right: 0)
        //图片距离右边框距离减少文字的宽度，其它不变
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleLabelWidth)
        self.contentEdgeInsets = UIEdgeInsets.zero
     }

}
