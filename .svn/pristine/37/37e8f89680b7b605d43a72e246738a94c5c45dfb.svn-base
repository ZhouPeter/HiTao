//
//  GoodsDetailsViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/20.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import KNSemiModalViewController
import CoreMotion
import MWPhotoBrowser

class GoodsDetailsViewControlleabr: UIViewController,UITableViewDelegate,UITableViewDataSource,SpecViewDelegate,SDCycleScrollViewDelegate,MWPhotoBrowserDelegate{
    var photosArray :[String] =  ["headerImage","1","headerImage","headerImage"]
    var photos :[MWPhoto] = []
    var thumbs :[MWPhoto] = []
    let detailCellIdentifier = "detailCell"
    let selectCellIdentifier = "selectCell"

    var tableView = UITableView(frame: CGRect.zero, style: .grouped)
    var bannerView = SDCycleScrollView()
    var topView  = DetailsTopView()
    lazy var motionManager = CMMotionManager()
    var timeInterval :Double = 0
    var firstAngle: Double!
    var angle :Double = 0
    var index = 0
    var newBannerView:SDCycleScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = true
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        self.view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(64)
            make.height.equalTo(35)
        }
        self.addBackItem()
        self.setTableView()
        self.setBannerView()
        self.setNavigationItem()
        self.addBottomButton()
    }
    //陀螺仪旋转角度转换成图片下标
    func calculateRotationByGyro(motion:CMDeviceMotion){
        print("转动中")
        let y = motion.rotationRate.y
        let timeInterval = Date().timeIntervalSince1970
        angle += y*(timeInterval - self.timeInterval)*(180.0 / M_PI)
        if self.firstAngle == nil{
            self.firstAngle = angle
        }
        self.timeInterval = timeInterval
        var index = Int(firstAngle - angle)/3
        if index > 0 {
            index = index % 16

        }else{
            index = (index%16 + 16) % 16
        }
        if index != self.index{
            self.becomeImage(index: index)
            self.index = index
        }
        
    }
    //切换图片
    func becomeImage(index:Int){
        self.photosArray[1] = "\(index)"
        self.bannerView.localizationImageNamesGroup = self.photosArray
        for view in self.bannerView.subviews{
            if let view = view as? UICollectionView{
                //当前第几张图片
              view.reloadData()
            }
        }
        self.newBannerView.localizationImageNamesGroup = self.photosArray
        
        for view in self.newBannerView.subviews{
            if let view = view as? UICollectionView{
                //当前第几张图片
                view.reloadData()
            }
        }

        
    }
    /// 添加底部button
    func  addBottomButton(){
        let addCartButton = UIButton()
        addCartButton.backgroundColor = customGray
        addCartButton.setTitle("加入购物车", for: .normal)
        addCartButton.titleLabel?.font = BigFont
        self.view.addSubview(addCartButton)
        addCartButton.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(40)
            make.left.bottom.equalToSuperview()
        }
        addCartButton.addTarget(self, action: #selector(GoodsDetailsViewControlleabr.addCartAction(_:)), for: .touchUpInside)
        let sureBuyButton = UIButton()
        sureBuyButton.backgroundColor = customRed
        sureBuyButton.setTitle("立即购买", for: .normal)
        sureBuyButton.titleLabel?.font = BigFont
        self.view.addSubview(sureBuyButton)
        sureBuyButton.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(40)
            make.right.bottom.equalToSuperview()
        }
        sureBuyButton.addTarget(self, action: #selector(GoodsDetailsViewControlleabr.sureBuyAction(_:)), for: .touchUpInside)


    }
    
    func addCartAction(_ sender:UIButton){
        print("添加成功")
    }
    //确认购买
    func sureBuyAction(_ sender:UIButton){
        let confirmOrderViewController = DetailsStoryboardHelper.instantiateViewController(identifier: DetailsStoryboardHelper.confirmOrderViewController)
        self.navigationController?.pushViewController(confirmOrderViewController, animated: true)
    }

    //设置导航栏
    private func setNavigationItem(){
        let rightButtonItem = UIBarButtonItem(image: UIImage(named:"messageItem"),style: .plain, target: self,  action: nil)
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    //设置tableView
    private func setTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = HiTaoBackgroundColor
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
            make.top.equalToSuperview().offset(64+35)
        }
        self.tableView.register(GoodsTableViewCell.self, forCellReuseIdentifier: detailCellIdentifier)
        self.tableView.register(GoodsSelectTableViewCell.self, forCellReuseIdentifier: selectCellIdentifier)
        
    }
    //设置轮播图
    private func setBannerView(){
        self.bannerView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 300)
        self.bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        self.bannerView.currentPageDotImage = UIImage(named:"ellipse_red")
        self.bannerView.pageDotImage = UIImage(named: "ellipse_gray")
        self.bannerView.autoScroll = false
        self.bannerView.infiniteLoop = false
        self.bannerView.delegate = self
        self.bannerView.localizationImageNamesGroup = ["headerImage","1","headerImage","headerImage"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: SDCycleScrollViewDelegate
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int){
        if index == 1{
            self.motionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler:
                {motion,error in
                    self.calculateRotationByGyro(motion: motion!)
            })
        }else{
            motionManager.stopDeviceMotionUpdates()
        }
       
    }
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {

        let browser = MWPhotoBrowser(delegate: self)
        //分享按钮,默认是
        browser?.displayActionButton = false
        //左右分页切换,默认否
        browser?.displayNavArrows = false
        //是否显示选择按钮在图片上,默认否
        browser?.displaySelectionButtons = false
        //控制条件控件 是否显示,默认否
        browser?.alwaysShowControls = false
        //是否全屏,默认是
        browser?.zoomPhotosToFill = true
        //是否允许用网格查看所有图片,默认是
        browser?.enableGrid = true
        //是否第一张,默认是
        browser?.startOnGrid = true
        //扫图消失
        browser?.enableSwipeToDismiss = true
        //设置显示第几张
        browser?.setCurrentPhotoIndex(UInt(index))
        
        photos = [MWPhoto(image: UIImage(named: photosArray[0])),MWPhoto(image: UIImage(named: photosArray[1])),MWPhoto(image: UIImage(named: photosArray[2])),MWPhoto(image: UIImage(named: photosArray[3]))]
        thumbs = [MWPhoto(image: UIImage(named: photosArray[0])),MWPhoto(image: UIImage(named: photosArray[1])),MWPhoto(image: UIImage(named: photosArray[2])),MWPhoto(image: UIImage(named: photosArray[3]))]
       let nc = UINavigationController(rootViewController: browser!)
       nc.modalTransitionStyle = .crossDissolve
       self.present(nc, animated: true, completion:nil)
       //自定义添加点击消失和导航栏消失
       browser?.addTouchTap()

    }
    //MARK:- MWPhotoBrowserDelegate
    func numberOfPhotos(in photoBrowser: MWPhotoBrowser!) -> UInt{
        return 4
    }
    func photoBrowser(_ photoBrowser: MWPhotoBrowser!, photoAt index: UInt) -> MWPhotoProtocol! {
        return photos[Int(index)]
    }

    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: detailCellIdentifier, for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: selectCellIdentifier, for: indexPath)
            return cell
        }
       
        
    
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return  110
        default:
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return  300
        default:
            return 0.0001
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return bannerView
        }else{
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = SpecView(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
        view.delegate = self
        if indexPath.section == 1{
            let dict :NSDictionary  = [KNSemiModalOptionKeys.pushParentBack : true,
                                       KNSemiModalOptionKeys.animationDuration  : 2,
                                       KNSemiModalOptionKeys.shadowOpacity   : 0.3,]
            self.presentSemiView(view, withOptions: dict as! [AnyHashable:Any] )
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    //MARK:- SpecViewDelegate
    func disMissModleView() {
        self.dismissSemiModalView()
    }
    
}

