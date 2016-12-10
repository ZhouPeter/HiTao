//
//  AddressManageViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/31.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class AddressManageViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate{
    var count:Int = 4
    let addressCellIdentifier = "addressCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackItem()
        self.setRightItem(fontSize:12)
    }
    @IBOutlet weak var tableView: UITableView!
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: addressCellIdentifier, for: indexPath)
        return cell
    }
    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 1
        default:
            return 10
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.000001
    }
    @IBAction func unWindMethod(segue:UIStoryboardSegue){
        self.count += 1
        self.tableView.reloadData()
    
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
