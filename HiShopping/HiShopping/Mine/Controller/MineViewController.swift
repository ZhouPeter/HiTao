//
//  MineViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,MineHeaderViewDelegate{
    let mineHeaderCellIdentifier = "mineHeaderCell"
    let mineSecondeCellIdentifier = "mineSecondCell"
    let mineThirdeCellIdentifier = "mineThirdCell"
    let mineHeaderViewIdenetifier = "mineHeaderView"
    let sectionTitleArray = ["我的订单","必备工具","生活·健康"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func showMineCoupon(_ sender: UIButton) {
        let vc = CouponViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func showMineCollection(_ sender: UIButton) {
        let vc = MineCollectionViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackItem()
        //注册头部单元
        self.tableView.register(MineHeaderView.self, forHeaderFooterViewReuseIdentifier: mineHeaderViewIdenetifier)
        // 设置tableview分割线样式
        self.tableView.separatorStyle = .none
    }
    override func viewWillAppear(_ animated: Bool) {
        //设置导航栏背景图片
        self.navigationController?.navigationBar.setBackgroundImage(HiTaoBackgroundColor.imageFromColor().reSizeImage(reSize: CGSize(width: SCREEN_WIDTH, height: 64)), for: .default)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: --UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: mineHeaderCellIdentifier, for: indexPath) as! MineHeaderTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: mineSecondeCellIdentifier, for: indexPath) as! MineSecondTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: mineThirdeCellIdentifier, for: indexPath) as! MineThirdTableViewCell
            cell.itemsCount = 8
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: mineThirdeCellIdentifier, for: indexPath) as! MineThirdTableViewCell
            cell.itemsCount = 4
            return cell
        default:
            return cell
        }
        
    }
    

    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section != 0 else {
            return nil
        }
        let view  = tableView.dequeueReusableHeaderFooterView(withIdentifier: mineHeaderViewIdenetifier) as! MineHeaderView
        
        if [2,3].contains(section)  {
            view.moreButton.isHidden = true
        }
        view.delegate = self
        view.setData(title:sectionTitleArray[section - 1])
        let tap = UITapGestureRecognizer(target: self, action: #selector(MineViewController.pushToMineOrderViewController))
        view.addGestureRecognizer(tap)
        return view
    }
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 157
        case 1:
            return  80
        case 2:
            return  80 * 2 + 1
        case 3:
            return  80
        default:
            return 100
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
             return 0.0000000001
        default:
            return 25
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.0000000001
        default:
            return 0.0000000001
        }
    }
    
    //MARK: -- MineHeaderViewDelegate
    func pushToMineOrderViewController() {
        let vc = MineOrderViewController()
        vc.hidesBottomBarWhenPushed = true
          self.navigationController?.pushViewController(vc, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.hidesBottomBarWhenPushed = true
    }

}
