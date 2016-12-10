//
//  PointBuyChildViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/26.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PointBuyChildViewController: UIViewController,IndicatorInfoProvider,UICollectionViewDelegate,UICollectionViewDataSource {
    //整点秒杀单元的Identifier
    let pointBuyChildCellIdentifier = "pointBuyChildCell"
    //collectionHeader的Identifier
    let collectionHeaderIdentifier =  "collectionHeader"
    var index:Int!
    var itemInfo : IndicatorInfo!
    var collectionView:UICollectionView!
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
        self.view.backgroundColor = HiTaoBackgroundColor
        self.setCollectionView()

    }
    

    
   //设置collectionView
    private func setCollectionView(){
        //初始化layout
        let layout = PublicCollectionViewLayout(sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), minimumLineSpacing: 10, minimumInteritemSpacing: 10, itemSize:CGSize(width: (SCREEN_WIDTH-30)/2, height: (SCREEN_WIDTH-30)/2 + 80))
        //头部尺寸
        layout.headerReferenceSize = CGSize(width: SCREEN_WIDTH , height: 40)
        //设置内部layout
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout:layout)
        //指定代理
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.view.addSubview(collectionView)
        //设置背景颜色
        self.collectionView.backgroundColor = HiTaoBackgroundColor
        //添加约束
        collectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview()
            
        }
        //注册单元
        self.collectionView.register(PointBuyChildCollectionViewCell.self, forCellWithReuseIdentifier: pointBuyChildCellIdentifier)
        self.collectionView.register(CountDownCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier:collectionHeaderIdentifier )
      
    }


    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pointBuyChildCellIdentifier, for: indexPath)
        return cell
    }
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionHeaderIdentifier, for: indexPath) as! CountDownCollectionHeaderView
        return cell
        
        
    }
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }


}
