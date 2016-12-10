//
//  ResultChildViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/26.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ResultChildViewController: UIViewController,IndicatorInfoProvider,UICollectionViewDelegate,UICollectionViewDataSource {
    let resultChildCellIdentifier = "resultChildCell"
    var collectionView :UICollectionView!
    var index:Int!
    var itemInfo : IndicatorInfo!
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
        self.setCollectionView()
    }
    private func setCollectionView(){
        let layout = PublicCollectionViewLayout(sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), minimumLineSpacing: 10, minimumInteritemSpacing: 10, itemSize:CGSize(width: (SCREEN_WIDTH-30)/2, height: (SCREEN_WIDTH-30)/2 + 50))
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout:layout)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.view.addSubview(collectionView)
        self.collectionView.backgroundColor = HiTaoBackgroundColor
        collectionView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
            
        }
        self.collectionView.register(ResultCollectionViewCell.self, forCellWithReuseIdentifier: resultChildCellIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resultChildCellIdentifier, for: indexPath)
        return cell
    }

    // MARK:- IndicatorInfoProvider
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo{
        return itemInfo
    }

    


}
