//
//  NewReleaseTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class NewReleaseTableViewCell: UITableViewCell {
    //计算第一次拉伸的宽度:第一次拉伸宽度=最终宽度/2+原图宽度/2
    let tempWidth = Int((SCREEN_WIDTH*5/8)/2 + 200/2)
    var bgImageView = UIImageView()
    var centerImageView = UIImageView()
    var typeLabel = UILabel()
    var nameLabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(bgImageView)
        self.contentView.addSubview(centerImageView)
        self.centerImageView.addSubview(typeLabel)
        self.centerImageView.addSubview(nameLabel)
        self.setAllAttributes()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setAllAttributes(){
        self.setLayout()
        self.setData()
        self.setFrame()
    }
    
    func setLayout(){
        bgImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        centerImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(tempWidth)
            make.height.equalTo(40)
        }
        typeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.centerImageView.snp.bottom).offset(-10)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.centerImageView.snp.top).offset(10)
        }
    }
    func setData(){
        self.bgImageView.image = UIImage(named:imageDefaultName)
        self.typeLabel.text = "美食特产"
        self.nameLabel.text = "鲜花饼"
        
    }
    func setFrame(){
        let bgImage = UIImage(named:"content_img_bg")
        self.centerImageView.image = self.scaleImageView(firstImage: bgImage!)
        self.typeLabel.font = SmallFont
        self.nameLabel.font = BigFont
    }
    func scaleImageView(firstImage:UIImage)-> UIImage{
        //第一次拉伸图片
       let firstScaleImage = firstImage.stretchableImage(withLeftCapWidth:Int(firstImage.size.width * 0.8) , topCapHeight: Int(firstImage.size.height * 0.5))
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.tempWidth, height: 40), false, UIScreen.main.scale)
        //如果tempWidth没有取整的话就是217.1875 会造成一条竖线的存在 小数值越接近0.5线越细
        //根据猜测应该是屏幕最少显示为1个像素也就是0.5 不足0.5可能会造成绘制图形不足造成空白也就是所谓的竖线 所以这里的处理方式是一律取整从而避免这个问题
        firstScaleImage.draw(in:CGRect(x: 0, y:0 , width: self.tempWidth , height: 40) , blendMode: .normal, alpha: 1)
        let secondImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        //重写布局
        centerImageView.snp.remakeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(Int(SCREEN_WIDTH*5/8))
            make.height.equalTo(40)
        }
        //第二次拉伸图片
        let secondScaleImage = secondImage.stretchableImage(withLeftCapWidth:Int(secondImage.size.width * 0.2) , topCapHeight: Int(secondImage.size.height * 0.5))
        return secondScaleImage
    }
//另一种拉伸的写法
//      let firstScaleImage = firstImage.resizableImage(withCapInsets: UIEdgeInsets(top: firstImage.size.height * 0.5, left: firstImage.size.width * 0.1, bottom: firstImage.size.height * 0.5-1, right: firstImage.size.width * 0.9-1) )
//       let secondScaleImage = secondImage.resizableImage(withCapInsets: UIEdgeInsets(top: secondImage.size.height * 0.5, left: secondImage.size.width * 0.9-1, bottom: secondImage.size.height * 0.5-1, right: secondImage.size.width * 0.1 ))
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
