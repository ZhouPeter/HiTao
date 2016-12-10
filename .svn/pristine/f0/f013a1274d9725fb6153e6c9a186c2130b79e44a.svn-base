//
//  MineCollectionViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/23.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MineCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    let collectionCellIdentifier = "collectionCell"
    var dataArray:[Bool] = [true,true,false,true,false,true,false,true,true,true]
    var collectionView:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView()
    }
    private func setCollectionView(){
        let layout = WaterFlowViewLayout()
        layout.columnCount = 2
        layout.columnMargin = 10
        layout.rowMargin = 10
        layout.sectionInsert = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        //判断是否有标签栏
        layout.itemHeightBlock = {[weak self](itemWitdh,indexPath) in
            return  (self?.dataArray[indexPath.row])! ? (SCREEN_WIDTH-30)/2 + 80 : (SCREEN_WIDTH-30)/2 + 50
        }
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout:layout)
        self.collectionView.backgroundColor = HiTaoBackgroundColor
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.view.addSubview(collectionView)
        self.collectionView.backgroundColor = HiTaoBackgroundColor
        collectionView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
            
        }
        self.collectionView.register(MineCollectionCollViewCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        
    }
    //UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath) as! MineCollectionCollViewCell
        cell.setData(isBtnHaving: dataArray[indexPath.row])
        return cell
    }

}
