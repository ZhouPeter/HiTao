//
//  EditPasswordViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/1.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class EditPasswordViewController: UIViewController {

    @IBAction func savePassword(_ sender: UIButton) {
       self.navigationController?.customPopViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
