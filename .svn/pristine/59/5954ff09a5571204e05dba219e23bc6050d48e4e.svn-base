//
//  ClassDetailTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/13.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class ClassDetailTableViewCell: UITableViewCell,UICollectionViewDataSource {

    @IBOutlet weak var subClassTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let itemSize = CGSize(width: ITEM_WIDTH, height: ITEM_WIDTH*(125/100))
        let layout = PublicCollectionViewLayout(sectionInset: UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10), minimumLineSpacing: 20, minimumInteritemSpacing: 10.5, itemSize: itemSize)
        self.collectionView.collectionViewLayout = layout
        self.collectionView.dataSource = self
        self.collectionView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 6
    }
    
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "classDetailItemCell", for: indexPath)
        return cell
    }


}
