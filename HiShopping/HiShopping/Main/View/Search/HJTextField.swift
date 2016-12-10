//
//  HJTextField.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/25.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
protocol HJTextFieldDelegate:NSObjectProtocol {
    func scanningTextField(_ sender:AnyObject?)
}
@IBDesignable
class HJTextField: UITextField {
    
    weak var HJDelegate :HJTextFieldDelegate!
    override func awakeFromNib() {
        let rightTap = UITapGestureRecognizer(target: self, action: #selector(HJTextField.scanning(_:)))
        self.rightView?.addGestureRecognizer(rightTap)
        
        
    }
    func scanning(_ tap :UITapGestureRecognizer){
        HJDelegate.scanningTextField(tap.view)
    }
    @IBInspectable var leftImage: UIImage? {
        set {
            let leftImgView = UIButton()
            leftImgView.setImage(newValue, for: .normal)
            leftImgView.frame = CGRect(x: frame.height*0.1,
                                       y: frame.height*0.1,
                                       width: frame.height*0.5,
                                       height: frame.height*0.5)
            leftView = leftImgView
            leftViewMode = .always
        }
        
        get {
            if let leftImgView = leftView as? UIButton {
                return leftImgView.image(for: .normal)
            }
            return nil
        }
        
        
    }
    @IBInspectable var rightImage: UIImage? {
        set {
            let rightImgView = UIButton()
            rightImgView.setImage(newValue, for: .normal)
            rightImgView.frame = CGRect(x: frame.height*0.1,
                                       y: frame.height*0.1,
                                       width: frame.height*0.5,
                                       height: frame.height*0.5)
            rightView = rightImgView
            rightViewMode = .always
        }
        
        get {
            if let rightImgView = rightView as? UIButton {
                return rightImgView.image(for: .normal)
            }
            return nil
        }
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect = CGRect(x: rect.origin.x+10, y: rect.origin.y, width: rect.size.width, height:  rect.size.height)
        return rect
        
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect = CGRect(x: rect.origin.x-10, y: rect.origin.y, width: rect.size.width, height:  rect.size.height)
        return rect
    }
    



}

