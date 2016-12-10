//
//  GoodsBottomTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/12/10.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class GoodsBottomTableViewCell: UITableViewCell ,UITableViewDelegate,UITableViewDataSource{

   
    //cell标识符
    let evaluateCellIdentifier = "evaluateCell"
    var topBarView = UIView()
    var goodsInfoButton = UIButton()
    var evaluateButton = UIButton()
    var contentTableView = UITableView()
    var allButton = UIButton()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(topBarView)
        self.topBarView.addSubview(goodsInfoButton)
        self.topBarView.addSubview(evaluateButton)
        self.contentView.addSubview(contentTableView)
        self.contentView.addSubview(allButton)
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
        topBarView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(41)
        }
        goodsInfoButton.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH/2 - 0.5)
            make.height.equalTo(40)
        }
        evaluateButton.snp.makeConstraints { (make) in
            make.right.top.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH/2 - 0.5)
            make.height.equalTo(40)
        }
        contentTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 41, left: 0, bottom: 45, right: 0))
        }
        allButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(25)
            make.width.equalTo(70)
        }
        
    }
    func setData(){
        
    }
    func setFrame(){
        //设置背景色方便分割线的显示
        self.topBarView.backgroundColor = HiTaoBackgroundColor
        self.goodsInfoButton.backgroundColor = .white
        self.goodsInfoButton.setTitleColor(.black, for: .normal)
        self.goodsInfoButton.setTitle("商品信息", for: .normal)
        self.goodsInfoButton.titleLabel?.font = BigFont
        self.goodsInfoButton.addTarget(self, action: #selector(GoodsBottomTableViewCell.infoBtn(_:)), for: .touchUpInside)
        self.evaluateButton.backgroundColor = .white
        self.evaluateButton.setTitleColor(.black, for: .normal)
        self.evaluateButton.setTitle("宝贝评价(122)", for: .normal)
        self.evaluateButton.titleLabel?.font = BigFont
        self.evaluateButton.addTarget(self, action: #selector(GoodsBottomTableViewCell.evaluateBtn(_:)), for: .touchUpInside)

        self.contentTableView.separatorStyle = .none
        self.contentTableView.isScrollEnabled = false
        self.contentTableView.register(EvaluateTableViewCell.self, forCellReuseIdentifier: evaluateCellIdentifier)
        self.contentTableView.delegate = self
        self.contentTableView.dataSource  = self
        self.allButton.setTitle("查看全部评价", for: .normal)
        self.allButton.titleLabel?.font = SmallFont
        self.allButton.setBackgroundImage(UIImage(named:"btn_nor_gray_140x50"), for: .normal)
        
    }
    
    /// 商品信息按钮响应方法
    ///
    /// - Parameter sender: 传递对象
    func infoBtn(_ sender:UIButton){
         self.goodsInfoButton.setTitleColor(customRed, for: .normal)
         self.evaluateButton.setTitleColor(.black, for: .normal)
        print("商品信息.....")

        
    }
    
    /// 宝贝详情按钮响应方法
    ///
    /// - Parameter sender: 传递对象
    func evaluateBtn(_ sender:UIButton){
        self.evaluateButton.setTitleColor(customRed, for: .normal)
        self.goodsInfoButton.setTitleColor(.black, for: .normal)
        print("宝贝评价.....")
        
        
    }
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: evaluateCellIdentifier, for: indexPath)
        //cell选中样式设置
        cell.selectionStyle = .none
        return cell
    }
    //MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}
