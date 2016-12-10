//
//  LeftDrawerViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/21.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
class LeftDrawerTableViewCell: UITableViewCell {
    var iconImageView = UIImageView()
    var titleLabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(titleLabel)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setLayout()
        self.setFrame()
    }
    
    func setLayout(){
        iconImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(30)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageView.snp.bottom).offset(5)
            make.width.equalTo(iconImageView)
            make.left.equalTo(iconImageView)
            
        }
    }
    func setData(image:String,title:String){
        self.iconImageView.image = UIImage(named:image)
        self.titleLabel.text = title
    }
    func setFrame(){
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = BigFont
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
protocol LeftDrawerViewControllerDelegate:NSObjectProtocol {
    func pushViewController(index:Int)
}
class LeftDrawerViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    let leftCellIdentifier = "leftCell"
    let iconArray:[(image:String,title:String)] = [
        ("icon_home","首页"),
        ("icon_collection_gray_big","收藏"),
        ("icon_message_big","消息"),
        ("icon_position","发现"),
        ("icon_set","设置")
    ]
   weak var delegate : LeftDrawerViewControllerDelegate!
   var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
    }
    private  func setTableView(){
        self.view.addSubview(tableView)
        self.tableView.frame = self.view.bounds
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LeftDrawerTableViewCell.self, forCellReuseIdentifier: leftCellIdentifier)
    }
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: leftCellIdentifier, for: indexPath) as! LeftDrawerTableViewCell
        if  indexPath.row%2 != 0{
            cell.contentView.backgroundColor = HiTaoBackgroundColor
        }
        cell.setData(image: iconArray[indexPath.row].image, title:  iconArray[indexPath.row].title)
        return cell
    }
    //MARK:-UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREEN_HEIGTH/5
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 3:
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.leftSlideVC.closeLeftView()
            let brandViewController = BrandViewController()
            brandViewController.hidesBottomBarWhenPushed = true
            let mainTabBarViewController = appDelegate.leftSlideVC.mainVC as! MainTabBarViewController
            (mainTabBarViewController.viewControllers?[mainTabBarViewController.selectedIndex] as! UINavigationController).pushViewController(brandViewController, animated: true)
            
        default:
            print("侧边栏点击事件")
        }
    }

    

  
}
