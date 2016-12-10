//
//  ClassViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/12.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class AllClassViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackItem()
        self.setCollectionLayout()
        //注册单元
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.leftSlideVC.setPanEnabled(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.leftSlideVC.setPanEnabled(false)
    }
    //设置collectionView
    private func setCollectionLayout(){
        let sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let minimumLineSpacing :CGFloat = 0.0
        let minimumInteritemSpacing:CGFloat = 0.0
        let itemSize = CGSize(width: (SCREEN_WIDTH-20)/2, height: (SCREEN_WIDTH-20)/2*(5.0/6.0))
        let layout = PublicCollectionViewLayout(sectionInset: sectionInset, minimumLineSpacing: minimumLineSpacing, minimumInteritemSpacing: minimumInteritemSpacing, itemSize: itemSize)
        self.collectionView.collectionViewLayout = layout
    }

  
    //MARK:- UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 10
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! ClassCollectionViewCell
        if [0,3].contains(indexPath.row%4) {
            cell.backgroundColor = UIColor.hexStringToColor("f5f2f1")
            
        }else{
             cell.backgroundColor = UIColor.hexStringToColor("ffffff")
        }
        cell.imageView.image = UIImage(named:classImageArray[indexPath.row])
        cell.titleLabel.text = classTitleArray[indexPath.row]
        return cell
    }
    //MARK:- UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let vc = ClassStoryboardHelper.instantiateViewController(identifier: ClassStoryboardHelper.classViewController)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    

   
}
