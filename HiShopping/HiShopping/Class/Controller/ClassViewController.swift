//
//  ClassViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/12.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let classDetailCellIdentifier = "classDetailCell"
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:-UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: classDetailCellIdentifier, for: indexPath)
        return cell
    }

    //MARK:-UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ((SCREEN_WIDTH - 41)/3*2)*(125/100) + 60 + 25
    }
  


}
