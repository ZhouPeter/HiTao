//
//  MineSecondTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MineSecondTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    let  mineSecondCollectionCellIdentifier = "mineSecondCollectionCell"
    let  imageArray = ["icon_0_0","icon_0_1","icon_0_2","icon_0_3","icon_0_4"]
    let titleArray = ["待付款","待发货","待收货","待评价","退款/售后"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layout = PublicCollectionViewLayout(sectionInset: UIEdgeInsets.zero, minimumLineSpacing: 0, minimumInteritemSpacing: 0, itemSize: CGSize(width: SCREEN_WIDTH/5, height: 80))
        collectionView.collectionViewLayout = layout
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        // Initialization code
    }
    //MARK: -- UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mineSecondCollectionCellIdentifier, for: indexPath) as! MineSecondCollectionViewCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        cell.titleLabel.text = titleArray[indexPath.row]
        
        return cell
    }
    

    //MARK: -- UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击第\(indexPath.row+1)个")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
