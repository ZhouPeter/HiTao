//
//  MindThirdTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MineThirdTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    let  mineThirdCollectionCellIdentifier = "mineThirdCollectionCell"
    let  toolImageArray = ["icon_1_0","icon_1_1","icon_1_2","icon_1_3","icon_1_4","icon_1_5","icon_1_6","icon_1_7"]
    let toolTitleArray = ["蚂蚁花呗","保险服务","娱乐宝","定期理财","爱心助力","卡卷包","众筹","股票"]
    let lifeImageArray = ["icon_2_0","icon_2_1","icon_2_2","icon_2_3"]
    let lifeTitleArray = ["大姨妈","美食","星座","运动"]
    var  itemsCount:Int!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = PublicCollectionViewLayout(sectionInset: UIEdgeInsets.zero, minimumLineSpacing: 1, minimumInteritemSpacing: 1, itemSize: CGSize(width: (SCREEN_WIDTH-3)/4, height: 80))
        collectionView.collectionViewLayout = layout
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // Initialization code
    }
    //MARK: -- UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mineThirdCollectionCellIdentifier, for: indexPath) as! MineThirdCollectionViewCell
        if itemsCount == 8{
            cell.imageView.image = UIImage(named: toolImageArray[indexPath.row])
            cell.titleLabel.text = toolTitleArray[indexPath.row]
        }else{
            cell.imageView.image = UIImage(named: lifeImageArray[indexPath.row])
            cell.titleLabel.text = lifeTitleArray[indexPath.row]
        }
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
