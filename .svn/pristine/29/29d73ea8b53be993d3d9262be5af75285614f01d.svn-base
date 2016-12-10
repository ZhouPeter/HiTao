//
//  MineOrderChildViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/20.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class MineOrderChildViewController: UIViewController , IndicatorInfoProvider ,UITableViewDataSource,UITableViewDelegate{
    var index:Int!
    let mineOrderCellIdentifier = "mineOrderCell"
    let mineOrdeBottomCellIdentifier = "mineOrderBottomCell"
    var itemInfo : IndicatorInfo!
    var tableView = UITableView(frame: CGRect.zero, style: .grouped)
    var orderCountArray = [3,4,5,6,2,3,5,6,2,3]
    init(itemInfo: IndicatorInfo,index:Int) {
        self.itemInfo = itemInfo
        self.index = index
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        self.setTableView()
    }
    private func setTableView(){
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MineOrderProductTableViewCell.self, forCellReuseIdentifier: mineOrderCellIdentifier)
        self.tableView.register(MineOrderBottomTableViewCell.self, forCellReuseIdentifier: mineOrdeBottomCellIdentifier)
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = HiTaoBackgroundColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   orderCountArray[section] + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        //最后一条返回不同的布局
        if indexPath.row == orderCountArray[indexPath.section]{
            cell = tableView.dequeueReusableCell(withIdentifier: mineOrdeBottomCellIdentifier, for: indexPath)
        }else{
             cell = tableView.dequeueReusableCell(withIdentifier: mineOrderCellIdentifier, for: indexPath)
        }
        return cell
    }
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == orderCountArray[indexPath.section]{
            return 50

        }else{
            return 80
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 1
            
        default:
            return 0.0001
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
      return 10
    }

    // MARK: - IndicatorInfoProvider
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }



}
