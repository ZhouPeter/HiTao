//
//  FeedbackViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/1.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController ,UITextViewDelegate{

    @IBOutlet weak var OpinionTextView: UITextView!
    @IBOutlet weak var textViewPlaceholder: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phoneTextField.setPlaceholderColor(color: customGray)
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.characters.count == 0{
            textViewPlaceholder.isHidden = false
        }else{
            textViewPlaceholder.isHidden = true
        }
    }
    


}
