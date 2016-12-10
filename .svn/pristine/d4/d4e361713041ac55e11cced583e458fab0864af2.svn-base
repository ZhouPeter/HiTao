//
//  NewReleaseViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class NewReleaseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let NewReleaseCellIdentifier = "NewReleaseCell"
    var tableView = UITableView()
    var progressView = ProgressCircleView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.automaticallyAdjustsScrollViewInsets = false
        self.setTableView()
        self.setNavigationItem()
        self.setProgressView()
    
    }
    private func setProgressView(){
        self.view.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.width.equalTo(49)
            make.height.equalTo(49)
            make.right.bottom.equalToSuperview().offset(-15)
        }
        self.progressView.setData(visualCount: Int(ceilf(Float((SCREEN_HEIGTH-64)/150))), allCount: 10)
        
    }
    private  func setTableView(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0))
        }
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewReleaseTableViewCell.self, forCellReuseIdentifier: NewReleaseCellIdentifier)
    }
    func setNavigationItem(){
        self.navigationItem.title = "新品上市"
        let rightItem = UIBarButtonItem(image: UIImage(named:"nav_icon_search_small"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: NewReleaseCellIdentifier, for: indexPath) as! NewReleaseTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       // self.progressView.setData(visualCount: indexPath.row, allCount: 10)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        if offSetY > 0 && offSetY <= scrollView.contentSize.height - scrollView.frame.height {
            self.progressView.setData(visualCount: Int(ceilf(Float((SCREEN_HEIGTH-64+offSetY)/150))) , allCount: 10)
        }
        
    }
    



  
}
