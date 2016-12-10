//
//  SearchIconTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/25.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SearchIconTableViewCell: UITableViewCell {
    var  iconArray :[String] = []
    let buttonHeight:CGFloat = 30
    let buttonVerticalSpace:CGFloat = 20
    let buttonHorizontalSpace:CGFloat = 20
    var buttonWidthArray :[CGFloat] = []
    var leftStartSpace :CGFloat = 10
    var topSpace:CGFloat = 50
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addButton()

    }
    func addButton(){
        //恢复初始值
         leftStartSpace  = 10
         topSpace = 50
        //每次刷新需要清除Button避免复用 暂时想不到更好的办法
        for view in self.contentView.subviews{
            if let view = view as? UIButton{
                //删除Button在storyboard中tag值是100作为条件不做remove处理
                guard view.tag == 100 else {
                    view.removeFromSuperview()
                    continue
                }
            }
        }
        
        buttonWidthArray.removeAll(keepingCapacity: true)
        for index in 0..<iconArray.count {
            var leftSpace = leftStartSpace
            for buttonWidth in buttonWidthArray {
                leftSpace += buttonWidth + buttonHorizontalSpace
            }
            let width = iconArray[index].getStringWidth(font: MiddleFont) + 30
            if leftSpace + buttonHorizontalSpace + width + 10 > SCREEN_WIDTH{
                buttonWidthArray.removeAll(keepingCapacity: true)
                topSpace += buttonVerticalSpace + buttonHeight
                leftStartSpace = 10
                leftSpace = leftStartSpace
            }
            let iconButton = UIButton()
            iconButton.titleLabel?.font = MiddleFont
            iconButton.setTitle(iconArray[index], for: .normal)
            iconButton.setTitleColor(customGray, for: .normal)
            iconButton.setBackgroundImage(UIImage(named:"background_icon"), for: .normal)
            iconButton.tag = index
            self.contentView.addSubview(iconButton)
            iconButton.addTarget(self, action: #selector(SearchIconTableViewCell.selectFirstCondition(_:)), for: .touchUpInside)
            buttonWidthArray.append(width)
            iconButton.snp.makeConstraints({ (make) in
                make.width.equalTo(width)
                make.height.equalTo(buttonHeight)
                make.left.equalTo(leftSpace)
                make.top.equalTo(topSpace)
            })
            
        }
    }
    func selectFirstCondition(_ sender:UIButton){
        switch sender.tag {
        case 0:
            print("选中条件1")
            self.changeButtonColor(sender: sender)
        default:
            print("选中其他条件")
            self.changeButtonColor(sender: sender)
        }
    }
    func changeButtonColor(sender:UIButton){
        for view in self.contentView.subviews{
            if let view  = view as? UIButton{
                view.setBackgroundImage(UIImage(named:"background_icon"), for: .normal)
                view.setTitleColor(customGray, for: .normal)
                
            }
        }
        sender.setBackgroundImage(UIImage(named:"selectBackground_icon"), for: .normal)
        sender.setTitleColor(.white, for: .normal)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
