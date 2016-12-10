//
//  TodayCheapViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/27.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class TodayCheapViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate {
     let todayCheapCellIdentifier = "todayCheapCell"
    //头部滚动图
    @IBOutlet weak var bannerView: SDCycleScrollView!
    //头部三个圆角头像
    @IBOutlet weak var headerImageView1: UIImageView!
    @IBOutlet weak var headerImageView2: UIImageView!
    @IBOutlet weak var headerImageView3: UIImageView!
    //最新价格label
    @IBOutlet weak var newPriceLabel: UILabel!
    //原先价格label
    @IBOutlet weak var oldPriceLabel: UILabel!
    //collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedItem:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setImageViewRound()
        self.setPriceLabel()
        self.setBannerView()
        
    }
    //设置头部滚动图片
    func setBannerView(){
        //指定代理
        self.bannerView.delegate = self
        //不显示分页控件
        self.bannerView.showPageControl = false
        //不自动滚动
        self.bannerView.autoScroll = false
        var array = [String]()
        for i in 0..<40{
            if i%2 == 1{
                array.append("headerImage")
            }else{
                array.append("bourkestreetbakery")
            }
        }
        //设置本地图片资源库
        self.bannerView.localizationImageNamesGroup = array
    }

    /// 设置价格Label样式
    func setPriceLabel(){
        self.newPriceLabel.setNewLabel(headerFontSize: 9, footerFontSize: 11)
        self.oldPriceLabel.setOldLabel(fontSize: 9)
    }
    
    /// 设置图片圆角和边线宽度
    func setImageViewRound(){
        //如果要立即刷新，要先调用[view setNeedsLayout]，把标记设为需要布局，然后马上调用[view layoutIfNeeded]，实现布局
        //在视图第一次显示之前，标记总是“需要刷新”的，可以直接调用[view layoutIfNeeded]
        self.view.layoutIfNeeded()
        self.headerImageView1.ViewToRoundView(borderWidth: 1)
        self.headerImageView2.ViewToRoundView(borderWidth: 1)
        self.headerImageView3.ViewToRoundView(borderWidth: 1)
    }
    //移除描边 暂时想不到更好的办法
    func removeLayerFromSuperLayer(view:UIView){
        for layer in view.layer.sublayers! {
            if let layer = layer as? CAShapeLayer{
                layer.removeFromSuperlayer()
            }
        }
    }
    
    /// 选中的cell发生变化
    ///
    /// - Parameter index: 选中cell的序号
    func becomeCell(index:Int){
        //之前选中cell的描边layer移除
        let oldCell = self.collectionView.cellForItem(at: IndexPath(item: self.selectedItem
            , section: 0))
        if  let oldCell = oldCell{
            self.removeLayerFromSuperLayer(view: oldCell)
        }
        //根据位置移动显示区域
        self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .bottom, animated: true)
        self.selectedItem = index
        //刷新新选中的cell
        self.collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
    }
    
    /// 设置collectionView
    func setCollectionView(){
        let layout = PublicCollectionViewLayout(sectionInset: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), minimumLineSpacing: 0, minimumInteritemSpacing: 0, itemSize: CGSize(width: SCREEN_WIDTH/4, height: SCREEN_WIDTH/4))
        self.collectionView.collectionViewLayout = layout
    }
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCheapCellIdentifier, for: indexPath)
        //选择的Item设置描边 否则移除描边
        if selectedItem == indexPath.item{
            cell.ViewToRoundViewBycornerRadius(borderWidth: 1.5, borderColor: customRed)
        }else{
            self.removeLayerFromSuperLayer(view: cell)
        }
        return cell
    }
    //MARK:- UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //根据colectionView的点击位置移动头部导航
        for view in self.bannerView.subviews{
            if let view = view as? UICollectionView{
                view.contentOffset = CGPoint(x: SCREEN_WIDTH*CGFloat(indexPath.item), y: 0)
            }
        }
        self.becomeCell(index: indexPath.item)
    }
    //MARK:- SDCycleScrollViewDelegate
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int){
        self.becomeCell(index: index)
    }
    
    

}
