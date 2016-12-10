//
//  BrandViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/22.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class BrandViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate{
    let brandColCellIdentifier = "brandColCell"
    var collectionView :UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "品牌"
        self.setCollectionView()
        self.setNavigationItem()

    }
    private func setNavigationItem(){
        let rightItem = UIBarButtonItem(image: UIImage(named:navIconMessage), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    private func setCollectionView(){
        let layout = PublicCollectionViewLayout(sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), minimumLineSpacing: 10, minimumInteritemSpacing: 10, itemSize:CGSize(width: (SCREEN_WIDTH-41)/3, height:(SCREEN_WIDTH-41)/3 + 30))
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout:layout)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.view.addSubview(collectionView)
        self.collectionView.backgroundColor = HiTaoBackgroundColor
        collectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        self.collectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier: brandColCellIdentifier)

    }
    
//MARK:- UICollectionDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: brandColCellIdentifier, for: indexPath) as! BrandCollectionViewCell
        return cell
    }
//MARK:- UICollectionDelegate



}
