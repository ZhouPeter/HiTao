//
//  SpecView.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/24.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
protocol SpecViewDelegate :NSObjectProtocol{
    func disMissModleView()
}

class SpecView: UIView {
    var buyCount : Int = 0{
        willSet{
            self.buyCountLabel.text = String(newValue)
        }
    }
    var stockCountLabel = UILabel()
    var colorLabel = UILabel()
    var sizeLabel = UILabel()
    var buyTotalCountLabel = UILabel()
    var goodsImageView = UIImageView()
    var colorTableView = UITableView()
    var sizeTableView = UITableView()
    var disMissButton = UIButton()
    var sureButton = UIButton()
    var reduceButton = UIButton()
    var addButton = UIButton()
    var buyCountLabel = UILabel()
    let tableViewProtocolColor = SpecColorTableViewProtocol()
    let tableViewProtocolSize = SpecSizeTableViewProtocol()

    weak var delegate : SpecViewDelegate!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(stockCountLabel)
        self.addSubview(colorLabel)
        self.addSubview(sizeLabel)
        self.addSubview(buyTotalCountLabel)
        self.addSubview(sizeLabel)
        self.addSubview(goodsImageView)
        self.addSubview(colorTableView)
        self.addSubview(sizeTableView)
        self.addSubview(reduceButton)
        self.addSubview(buyCountLabel)
        self.addSubview(addButton)
        self.addSubview(disMissButton)
        self.addSubview(sureButton)
        self.setAllAttributes()
    }
    func setAllAttributes(){
        self.setTableView()
        self.setLayout()
        self.setData()
        self.setFormat()
    }
    
    func setTableView(){
        let array: [SpecColorModel] = [SpecColorModel](repeating: SpecColorModel(colorName: "墨绿色", isSelect:false), count: 10)
        self.tableViewProtocolColor.array = array
        self.colorTableView.delegate = tableViewProtocolColor
        self.colorTableView.dataSource = tableViewProtocolColor
        self.colorTableView.separatorStyle = .none
        self.colorTableView.showsVerticalScrollIndicator = false
        self.tableViewProtocolSize.array = [SpecSizeModel](repeating: SpecSizeModel(sizeName: "LLL", isSelect:false), count: 10)
        self.sizeTableView.delegate = tableViewProtocolSize
        self.sizeTableView.dataSource = tableViewProtocolSize
        self.sizeTableView.separatorStyle = .none
        self.sizeTableView.showsVerticalScrollIndicator = false
    }
    
    func setLayout(){
        stockCountLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(SCREEN_WIDTH/8)
            make.top.equalToSuperview().offset(40)
        }
        colorLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(SCREEN_WIDTH/8 + SCREEN_WIDTH/4)
            make.top.equalTo(stockCountLabel)
        }
        sizeLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(SCREEN_WIDTH/8 + SCREEN_WIDTH/4*2)
            make.top.equalTo(colorLabel)
        }
        buyTotalCountLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(SCREEN_WIDTH/8 + SCREEN_WIDTH/4*3)
            make.top.equalTo(sizeLabel)
        }
        goodsImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.top.equalTo(stockCountLabel.snp.bottom).offset(20)
            make.centerX.equalTo(stockCountLabel)
        }
        colorTableView.snp.makeConstraints { (make) in
            make.centerX.equalTo(colorLabel)
            make.top.equalTo(colorLabel.snp.bottom).offset(10)
            make.width.equalTo(SCREEN_WIDTH/4)
            make.bottom.equalTo(sureButton.snp.top).offset(-20)
        }
        sizeTableView.snp.makeConstraints { (make) in
            make.centerX.equalTo(sizeLabel)
            make.top.equalTo(sizeLabel.snp.bottom).offset(10)
            make.width.equalTo(SCREEN_WIDTH/4)
            make.bottom.equalTo(colorTableView)
        }
        reduceButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(10)
            make.top.equalTo(buyTotalCountLabel.snp.bottom).offset(20)
            make.centerX.equalTo(buyTotalCountLabel)
        }
        buyCountLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(reduceButton)
            make.top.equalTo(reduceButton.snp.bottom).offset(10)
        }
        addButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(reduceButton)
            make.top.equalTo(buyCountLabel.snp.bottom).offset(10)
            make.width.height.equalTo(reduceButton)
        }
        
        disMissButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(15)
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            
        }
        sureButton.snp.makeConstraints { (make) in
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(40)
            make.left.bottom.equalToSuperview()
        }
        
    }
    func setData(){
        self.stockCountLabel.text = "库存:118件"
        self.colorLabel.text = "主要颜色"
        self.sizeLabel.text = "尺码"
        self.buyTotalCountLabel.text = "购买数量"
        self.goodsImageView.image = UIImage(named:"bourkestreetbakery")
        self.disMissButton.addTarget(self, action: #selector(SpecView.disMissAction(_:)), for: .touchUpInside)
        self.reduceButton.addTarget(self, action: #selector(SpecView.reduceCount(_:)), for: .touchUpInside)
        self.addButton.addTarget(self, action: #selector(SpecView.addCount(_:)), for: .touchUpInside)
    }
    func setFormat(){
        self.stockCountLabel.textAlignment = .center
        self.colorLabel.textAlignment = .center
        self.sizeLabel.textAlignment = .center
        self.buyTotalCountLabel.textAlignment = .center
        self.stockCountLabel.customColorAndSizeBig(smallFontSize: 9, bigFontSize: 11, ranges: [NSMakeRange(3, 3)], smallColor: customGray, bigColor: UIColor.black)
        self.colorLabel.font = MiddleFont
        self.sizeLabel.font = MiddleFont
        self.buyTotalCountLabel.font = MiddleFont
        self.disMissButton.setImage(UIImage(named:"icon_fork_red"), for: .normal)
        self.sureButton.backgroundColor = customRed
        self.sureButton.setTitle("确定", for: .normal)
        self.reduceButton.setImage(UIImage(named:"icon_reduce"), for: .normal)
        self.addButton.setImage(UIImage(named:"icon_plus"), for: .normal)
        self.buyCountLabel.text = "1"
        self.buyCountLabel.font = BigFont
        self.buyCountLabel.textColor = customRed
        
    }
    func disMissAction(_ sender: UIButton){
        self.delegate.disMissModleView()
    }
    func reduceCount(_ sender: UIButton){
        guard buyCount > 1 else {
            return
        }
        self.buyCount -= 1
    }
    func addCount(_ sender: UIButton){
        self.buyCount += 1
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
