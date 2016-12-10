//
//  MenuContentView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/27.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MenuContentView: UIView {
    //合计高度
    var allHeight:CGFloat!
    //数据源
    var menuArray = ["新品发布","热销排行","本周排行","整","新品发布","热销排行","本周排行","整"]
    //button高度
    let buttonHeight:CGFloat = 30
    //button垂直距离
    let buttonVerticalSpace:CGFloat = 20
    //button水平距离
    let buttonHorizontalSpace:CGFloat = 20
    //前面button的宽度数组 （换行清空）
    var buttonWidthArray :[CGFloat] = []
    //开始位置左边空间大小
    var leftStartSpace :CGFloat = 10
    //头部空间大小
    var topSpace:CGFloat = 10
    //回调方法
    var completion :(()->())!
    //重写父类初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addButton()
        self.height = topSpace + 50
        self.frame.size.height = height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //动态添加button
    func addButton(){
        //恢复初始值
        leftStartSpace  = 10
        topSpace = 10
        buttonWidthArray.removeAll(keepingCapacity: true)
        for index in 0..<menuArray.count {
            var leftSpace = leftStartSpace
            for buttonWidth in buttonWidthArray {
                leftSpace += buttonWidth + buttonHorizontalSpace
            }
            //根据内容的长度获取button的长度
            let width = menuArray[index].getStringWidth(font: MiddleFont) + 30
            //判断剩余的长度是否足够放下一个button
            if leftSpace + buttonHorizontalSpace + width + 10 > SCREEN_WIDTH{
                buttonWidthArray.removeAll(keepingCapacity: true)
                topSpace += buttonVerticalSpace + buttonHeight
                leftStartSpace = 10
                leftSpace = leftStartSpace
            }
            //设置button样式
            let iconButton = UIButton()
            iconButton.titleLabel?.font = MiddleFont
            iconButton.setTitle(menuArray[index], for: .normal)
            iconButton.setTitleColor(customGray, for: .normal)
            iconButton.setBackgroundImage(UIImage(named:"background_icon"), for: .normal)
            //设置tag区分标签
            iconButton.tag = index
            self.addSubview(iconButton)
            //添加button响应事件
            iconButton.addTarget(self, action: #selector(MenuContentView.selectMenu(_:)), for: .touchUpInside)
            //将新的button宽度添加到数组
            buttonWidthArray.append(width)
            //添加约束
            iconButton.snp.makeConstraints({ (make) in
                make.width.equalTo(width)
                make.height.equalTo(buttonHeight)
                make.left.equalTo(leftSpace)
                make.top.equalTo(topSpace)
            })
            
        }
    }
    
    /// 响应事件
    ///
    /// - Parameter sender: 响应发起对象
    func selectMenu(_ sender:UIButton){
        switch sender.tag {
        case 0:
            print("选中条件1")
            self.changeButtonColor(sender: sender)
            completion()
        default:
            print("选中其他条件")
            self.changeButtonColor(sender: sender)
            completion()
        }
    }
    //改变button的背景图片
    func changeButtonColor(sender:UIButton){
        for view in self.subviews{
            if let view  = view as? UIButton{
                view.setBackgroundImage(UIImage(named:"background_icon"), for: .normal)
                view.setTitleColor(customGray, for: .normal)
                
            }
        }
        sender.setBackgroundImage(UIImage(named:"selectBackground_icon"), for: .normal)
        sender.setTitleColor(.white, for: .normal)
    }


  
}
