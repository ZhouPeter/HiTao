//
//  ConfirmOrderViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/2.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class ConfirmOrderViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate{
   let addressCellIdentifier = "addressCell"
    let goodsCellIdentifier = "goodsCell"
    let moreCellIdentifier = "moreCell"
    let discountCellIdentifier = "discountCell"
    let priceCellIdentifier = "priceCell"
    let payModeHeaderCellIdentifier = "payModeHeaderCell"
    let payModeCellIdentifier = "payModeCell"
    let payModelHeaderIdentifier = "payModeHeader"
    var isOpenPayMode = false
    var payModeCode  :Int! = 0
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(PayModeHeaderView.self, forHeaderFooterViewReuseIdentifier: payModelHeaderIdentifier)
    }
    

    
 
    @IBAction func confirmPay(_ sender:UIButton){
        print("确认支付")
       
    }
    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 1
        case 3:
            return 1
        default:
            return isOpenPayMode ? 3 : 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: addressCellIdentifier, for: indexPath)
            return cell
        case 1:
            switch indexPath.row {
            case 0...1:
                let cell = tableView.dequeueReusableCell(withIdentifier: goodsCellIdentifier, for: indexPath)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: moreCellIdentifier, for: indexPath)
                return cell

            }
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: discountCellIdentifier, for: indexPath)
            return cell
        case 3:
            let cell  = tableView.dequeueReusableCell(withIdentifier: priceCellIdentifier, for: indexPath)
            return cell
            
        default:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: payModeHeaderCellIdentifier, for: indexPath) as! PayModeHeaderTableViewCell
                return cell
            default: 
                let cell = tableView.dequeueReusableCell(withIdentifier: payModeCellIdentifier, for: indexPath) as! PayModeTableViewCell
                if payModeCode == indexPath.row{
                    cell.selectImageView.image = #imageLiteral(resourceName: "roundSelect")
                }else{
                    cell.selectImageView.image = #imageLiteral(resourceName: "roundUnSelect")
                }
                return cell
            }
        }
    }

    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 80
        case 1:
            switch indexPath.row {
            case 0...1:
                return 100
            default:
                return 50
            }
        case 2:
            return 50
        case 3:
            return 85
        default:
            return 50
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 1
        case 1...3:
            
            return 10
        default:
            return 5
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.000001
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 4{
            if indexPath.row == 0{
                let cell = tableView.cellForRow(at: indexPath) as! PayModeHeaderTableViewCell
                self.isOpenPayMode = !self.isOpenPayMode
                UIView.animate(withDuration: 0.3, animations: {
                    if self.isOpenPayMode{
                        tableView.insertRows(at: [IndexPath(row: 1, section: 4),IndexPath(row: 2, section: 4)], with: .automatic)
                        tableView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
                        
                    }else{
                        tableView.deleteRows(at:  [IndexPath(row: 1, section: 4),IndexPath(row: 2, section: 4)], with: .automatic)
                    }
                    let transform = cell.isOpenImageView.transform.rotated(by: CGFloat(M_PI))
                    cell.isOpenImageView.transform = transform

                }, completion: nil)
            }else{
                self.payModeCode = indexPath.row
                self.tableView.reloadRows(at: [IndexPath(row: 1, section: 4),IndexPath(row: 2, section: 4)], with: .automatic)
            }
        }
        
    }
   

}
