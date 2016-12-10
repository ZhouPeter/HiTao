//
//  ViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/9.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import SnapKit
import SDCycleScrollView
import  MMDrawerController
class ViewController: UIViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,
PointBuyTableViewCellDelegate ,MainTopTableViewCellDelegate
{
    let searchController  =  WeChatSearchViewController(searchResultsController: UIViewController())
    //轮播图
    @IBOutlet weak var bannerView: SDCycleScrollView!
    //表单图
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "http://apis.juhe.cn/cook/query?key=&menu=%E8%A5%BF%E7%BA%A2%E6%9F%BF&rn=10&pn=3"
        BaseDatasource.sharedInstance.get(URLString: url, success: { result in
            print(result)
        }){ error in
            print(error)
        }
        BaseDatasource.sharedInstance.getNative(URLString: url, parameters: nil) {value ,error in
            print(value ?? "")
        }
        self.addBackItem()
        //分割线设置
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.layoutMargins = UIEdgeInsets.zero
        self.addSearchBar()
        self.setBannerView()
        self.tabBarController?.tabBar.isTranslucent = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"nav_icon_classify"), style: .plain, target: self, action: #selector(ViewController.leftBtn))
    }
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.leftSlideVC.setPanEnabled(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.leftSlideVC.setPanEnabled(false)
    }
    func leftBtn(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if appDelegate.leftSlideVC.closed {
            appDelegate.leftSlideVC.openLeftView()
        }else{
            appDelegate.leftSlideVC.closeLeftView()
        }
    }

    @IBAction func showTodayCheap(_ sender: UITapGestureRecognizer) {
        let cheapVC =  MainStoryboardHelper.instantiateViewController(identifier: MainStoryboardHelper.todayCheapViewController)
        cheapVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(cheapVC, animated: true)
    }
  
     /// 跳转整点秒杀页
     func pointBuy() {
        let   pointVc = MainStoryboardHelper.instantiateViewController(identifier:MainStoryboardHelper.pointBuyViewController)
        pointVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(pointVc, animated: true)
    }
    
    /// 设置轮播图
    private func setBannerView(){
        self.bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        self.bannerView.currentPageDotImage = UIImage(named:"ellipse_red")
        self.bannerView.pageDotImage = UIImage(named: "ellipse_gray")
        self.bannerView.localizationImageNamesGroup = ["headerImage","headerImage","headerImage","headerImage"]
        
    }
    
    /// 设置搜索栏
    private func addSearchBar(){
        let sr  = TopSearchBar()
        sr.placeholder = "请输入搜索内容"
        sr.showsBookmarkButton = true
        sr.setImage(UIImage(named:"icon_scan"), for: .bookmark, state: .normal)
        self.navigationItem.titleView = sr
        sr.delegate = self

    }


    //MARK: -- TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
    
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! MainTopTableViewCell
            cell.delegate = self
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! PointBuyTableViewCell
            cell.delegate = self

            return cell
        }else  if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath)
            return cell
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthCell", for: indexPath) as! WaterFlowTableViewCell
            return cell
            
        }
        return UITableViewCell()
        
    }
    //MARK: -- TableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 1:
            self.pointBuy()
        default:
            print("TouchUp Cell")
        }
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.row {
           case 0:
               return  90
          case 1:
            return 40 + (SCREEN_WIDTH - 41)/3 * 170/111  + 10
          case 2:
            return 40 + (SCREEN_WIDTH - 41)/3 * 100/93 + 20
          case 3:
            return 300
          default:
              return 100
        }
    }
    //MARK:- MainTopTableViewCellDelegate 
    func pushToNewViewController(index: Int) {
        let vc :UIViewController!
        switch index {
        case 0:
            vc = NewReleaseViewController()
        case 2:
            vc = MainStoryboardHelper.instantiateViewController(identifier: MainStoryboardHelper.todayCheapViewController)
        default:
            vc = UIViewController()
        }
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //MARK:- UISearchBarDelegate

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
 
        return true

    }
    
    //searchBar开始输入代理方法实现
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //当前线程是UI线程所以等该方法执行完然后失去焦点比较合适 否则失去焦点后会重新获取
        DispatchQueue.main.async {
            print(Thread.current.isMainThread)
            print(Thread.current)
            searchBar.resignFirstResponder()
        }
//        OperationQueue.main.addOperation {
//            print(Thread.current.isMainThread)
//            print(Thread.current)
//            searchBar.resignFirstResponder()
//        }
        let searchViewController = MainStoryboardHelper.instantiateViewController(identifier: MainStoryboardHelper.searchViewController)
        searchViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    //MARK:- PanicBuyingTableViewCellDelegate
    func pushToProductDetailSViewController(index:Int){
       let vc = GoodsDetailsViewControlleabr()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

