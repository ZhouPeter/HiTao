//
//  WaterFlowTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/11.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class WaterFlowTableViewCell: UITableViewCell,UICollectionViewDataSource {
    let layout = WaterFlowViewLayout()
    let ReuseIdentifier = "cell"
    @IBOutlet weak var waterFlowView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        waterFlowView.dataSource = self
        self.waterFlowView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ReuseIdentifier)
        layout.columnCount = 3
        layout.columnMargin = 10.5
        layout.rowMargin = 10
        layout.sectionInsert = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemHeightBlock = {(a,b) in
            return CGFloat(80 + arc4random_uniform(50))
        }
        waterFlowView.collectionViewLayout = layout

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 100
    }

    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }

}
