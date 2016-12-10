//
//  EditPhoneTwoViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/1.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class EditPhoneTwoViewController: UIViewController {
    var oldPhoneNumber:String!
    @IBOutlet weak var oldPhoneTextField: UITextField!
    @IBOutlet weak var codeButton: UIButton!
    @IBAction func sendCode(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        CountDown.startTime(time: 60){ timeout in
            if timeout == 0{
                sender.isUserInteractionEnabled = true
                self.codeButton.setTitle("验证码", for: .normal)

            }else{
                self.codeButton.setTitle("验证码(\(timeout))", for: .normal)

            }
        }

    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.oldPhoneTextField.text = oldPhoneNumber
        self.oldPhoneTextField.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
