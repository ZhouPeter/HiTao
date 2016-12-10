//
//  SetUpViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/31.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SetUpViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate{
    let selectCellIdentifier = "selectCell"
    let switchCellIdentifier = "switchCell"
    let deleteCellIdentifier = "deleteCell"
    let showInfoSegueIdentifier = "showInfoSegue"
    let showAddressSegueIdentifier = "showAddressSegue"
    let showFeedbackSegueIdentifier = "showFeedbackSegue"

    let titleArray = ["个人资料","收货地址","意见反馈","新消息通知","清除缓存","关于嗨淘"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackItem()


    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: selectCellIdentifier, for: indexPath) as! SetUpSelectTableViewCell
            cell.titleLabel.text = titleArray[indexPath.row]
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: selectCellIdentifier, for: indexPath)  as! SetUpSelectTableViewCell
            cell.titleLabel.text = titleArray[indexPath.row]
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: selectCellIdentifier, for: indexPath)  as! SetUpSelectTableViewCell
            cell.titleLabel.text = titleArray[indexPath.row]

            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: switchCellIdentifier, for: indexPath) as! SetUpSwtichTableViewCell
            cell.titleLabel.text = titleArray[indexPath.row]

            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: deleteCellIdentifier, for: indexPath) as! SetUpDeleteTableViewCell
            cell.titleLabel.text = titleArray[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: selectCellIdentifier, for: indexPath) as! SetUpSelectTableViewCell
            cell.titleLabel.text = titleArray[indexPath.row]
            return cell
        }
    }
    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier:showInfoSegueIdentifier , sender: self)
        case 1:
            self.performSegue(withIdentifier:showAddressSegueIdentifier , sender: self)
        case 2:
            self.performSegue(withIdentifier: showFeedbackSegueIdentifier, sender: self)
        default:
            self.performSegue(withIdentifier:showAddressSegueIdentifier , sender: self)
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showInfoSegueIdentifier{
        }
    }
    
    

}
