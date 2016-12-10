//
//  EditPhoneOneViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/1.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class EditPhoneOneViewController: UIViewController {
    var phoneString:String!
    
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackItem()
        self.setPhoneLabel()
        
    }
    func setPhoneLabel(){
        if let phoneNumber = phoneString{
            self.phoneLabel.text = phoneNumber
            
        }else{
            self.phoneLabel.text = "该账号未绑定手机"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditPhoneTwoViewController{
            vc.oldPhoneNumber = "15857476747"
        }
    }
    

}
