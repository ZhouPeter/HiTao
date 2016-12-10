//
//  WaterFlowViewLayout.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/10.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class WaterFlowViewLayout: UICollectionViewLayout {
    
    ///所有cell的布局属性
    var layoutAttributes = [UICollectionViewLayoutAttributes]()
    
    ///使用一个字典记录每列的最大Y值
    var maxYDict = [Int:CGFloat]()
    ///瀑布流四周的间距
    var sectionInsert :UIEdgeInsets!
    //列间距
    var columnMargin:CGFloat!
    
    //行间距
    var rowMargin:CGFloat!
    
    ///瀑布流列数
    var columnCount : Int!

    //高度计算回调方法
    var itemHeightBlock : ((CGFloat, IndexPath) -> CGFloat)!
    
    
    override func prepare() {
        for i in 0 ..< self.columnCount {
            self.maxYDict[i] = self.sectionInsert.top
        }
        let itemCount  = self.collectionView?.numberOfItems(inSection: 0)
        for i in 0 ..< itemCount!{
           let attributes = self.layoutAttributesForItem(at: IndexPath(item: i, section: 0))
           self.layoutAttributes.append(attributes!)
        }
    }
    
    
    override var collectionViewContentSize: CGSize{
        get{
            var maxIndex:Int = 0
            for(key,value) in maxYDict{
                if maxYDict[maxIndex]! < value{
                    maxIndex = key
                }
            }
            return CGSize(width:0.0,height:self.maxYDict[maxIndex]! + self.sectionInsert.bottom)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let  collectionViewWidth =  self.collectionView?.frame.width
        let itemWidth :CGFloat = (collectionViewWidth! - self.sectionInsert.left - self.sectionInsert.right - CGFloat((self.columnCount - 1)) * self.columnMargin) / CGFloat(columnCount)
        var minIndex = 0
        for(key,value) in maxYDict{
            if maxYDict[minIndex]! > value{
                minIndex = key
            }
        }
        let itemX = self.sectionInsert.left + (self.columnMargin + itemWidth) * CGFloat(minIndex)
        let itemY = self.maxYDict[minIndex]! + self.rowMargin
        let itemHeight = self.itemHeightBlock(itemWidth,indexPath)
        //设置cell的frame
        let frame = CGRect(x: itemX, y: itemY, width: itemWidth, height: itemHeight)
        //更新最短这列的最大Y值
        maxYDict[minIndex] = frame.maxY
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = frame
        return attributes
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.layoutAttributes
    }
    
}
