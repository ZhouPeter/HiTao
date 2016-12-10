//
//  NewTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/14.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell,UICollectionViewDataSource {
    let productCellIdentifier = "productCell"
    var businessHeadImageView = UIImageView()
    var businessNameLabel = UILabel()
    var beforeTimeLabel = UILabel()
    var followButton = UIButton()
    var collectionView : UICollectionView!
    var bottomColorView = UIView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let layout  = PublicCollectionViewLayout(sectionInset: UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10), minimumLineSpacing: 10, minimumInteritemSpacing: 10.5, itemSize: CGSize(width: ITEM_WIDTH, height: ITEM_WIDTH*(80/93)))
        collectionView = UICollectionView(frame:CGRect.zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        self.contentView.addSubview(businessHeadImageView)
        self.contentView.addSubview(businessNameLabel)
        self.contentView.addSubview(beforeTimeLabel)
        self.contentView.addSubview(collectionView)
        self.contentView.addSubview(followButton)
        self.contentView.addSubview(bottomColorView)
        self.setContentInCell()
    }
    
    func setContentInCell(){
        self.setLayout()
        self.setData()
        self.setFormat()
    }
    func setLayout(){
        self.businessHeadImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.width.height.equalTo(30)
        }
        self.businessNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(businessHeadImageView.snp.right).offset(5)
            make.top.equalToSuperview().offset(20)
        }
        self.beforeTimeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(businessNameLabel)
            make.top.equalTo(businessNameLabel.snp.bottom).offset(5)
        }
        self.collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(businessHeadImageView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(bottomColorView.snp.top)
        }
        self.followButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(businessHeadImageView).offset(4)
            make.right.equalToSuperview().offset(-10)
            make.width.equalTo(60)
            make.height.equalTo(35)
        }
        self.bottomColorView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    func setData(){
        self.businessHeadImageView.image = UIImage(named:"bourkestreetbakery")
        self.businessNameLabel.text = "他叫向日葵"
        self.beforeTimeLabel.text = "3分钟前"
        self.collectionView.dataSource = self
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: productCellIdentifier)
        self.followButton.setTitle("+关注", for: .normal)
    }
    func setFormat(){
        self.businessNameLabel.font = MiddleFont
        self.beforeTimeLabel.font = SmallFont
        self.beforeTimeLabel.textColor = UIColor.hexStringToColor("94a3b5")
        self.collectionView.isScrollEnabled = false
        self.collectionView.backgroundColor = .white
        self.bottomColorView.backgroundColor = HiTaoBackgroundColor
        self.followButton.setBackgroundImage(UIImage(named:"btn_sel_red_120x70"), for: .normal)
        self.followButton.titleLabel?.font = MiddleFont
        self.followButton.setTitleColor(.white, for: .normal)
        self.followButton.titleEdgeInsets.top = -5
    }
    
  //layoutIfNeeded：告知页面布局立刻更新。所以一般都会和setNeedsLayout一起使用。如果希望立刻生成新的frame需要调用此方法，利用这点一般布局动画可以在更新布局后直接使用这个方法让动画生效。
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.businessHeadImageView.ViewToRoundViewBycornerRadius(cornerRadius: 15)
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 6
    }
    

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: productCellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
