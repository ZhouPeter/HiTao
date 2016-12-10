//
//  CartViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let cartCellIdentifier = "cartCell"
    let cartHeaderViewIdentifier =  "cartHeaderView"
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置分割线样式为无
        self.tableView.separatorStyle = .none
        //注册单元
        self.tableView.register(CartHeaderView.self, forHeaderFooterViewReuseIdentifier: cartHeaderViewIdentifier)
        //初始化底部view
        let bottomView = BottomSuspendView(frame: CGRect(x: 0, y: SCREEN_HEIGTH-49-40, width: SCREEN_WIDTH, height: 40))
        self.view.addSubview(bottomView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: --UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier:cartCellIdentifier , for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: cartHeaderViewIdentifier)
        return view
    }
    
   //MARK:-- UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    //左滑删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("删除cell")
        tableView.setEditing(false, animated: true)
        
    }
}
