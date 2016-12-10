//
//  ClassCollectionViewLayout.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/12.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class PublicCollectionViewLayout: UICollectionViewFlowLayout {
    
    init(sectionInset:UIEdgeInsets,minimumLineSpacing:CGFloat,minimumInteritemSpacing:CGFloat,itemSize:CGSize){
        super.init()
        self.sectionInset = sectionInset
        self.minimumLineSpacing = minimumLineSpacing
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.itemSize = itemSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
