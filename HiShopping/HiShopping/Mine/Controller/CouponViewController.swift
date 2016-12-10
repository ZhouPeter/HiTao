//
//  CouponViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/8.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CouponViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    let couponCellIdentifier = "couponCell"
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "优惠券"
        self.setTableView()
    }
    private  func setTableView(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CouponTableViewCell.self, forCellReuseIdentifier: couponCellIdentifier)
    }
    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: couponCellIdentifier, for: indexPath) as! CouponTableViewCell
        if indexPath.section == 1{
            cell.setGrayColor()
        }
        return cell
    }
    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1{
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 50)
            view.backgroundColor = HiTaoBackgroundColor
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = customGray
            label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
            label.text = "查看已失效卷"
            label.font = SmallFont
            view.addSubview(label)
            label.center.x = view.center.x
            label.center.y = view.center.y + 5
            return view
            
        }else{
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0.00001
        }else{
            return 50
        }
    }



}
