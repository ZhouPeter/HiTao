//  TableChildExampleViewController.swift
//  XLPagerTabStrip ( https://github.com/xmartlabs/XLPagerTabStrip )
//
//  Copyright (c) 2016 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import XLPagerTabStrip

class TableChildExampleViewController: UIViewController, IndicatorInfoProvider ,UITableViewDataSource,UITableViewDelegate{
    var index:Int!
    let cheapCellIdentifier = "cheapCell"
    let hotCellIdentifier = "hotCell"
    let newCellIdentifier = "newCell"

    var blackTheme = false
    var itemInfo : IndicatorInfo!
    var tableView = UITableView()

    init(itemInfo: IndicatorInfo,index:Int) {
        self.itemInfo = itemInfo
        self.index = index
        super.init(nibName: nil, bundle: nil)
      
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //最后一个需要背景色
        if index == 2{
            self.view.backgroundColor = HiTaoBackgroundColor
        }
        self.view.addSubview(tableView)
        self.tableView.separatorStyle = .none
        self.tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            if index == 2{
                make.top.equalToSuperview().offset(2)
            }else{
                 make.top.equalToSuperview()
            }
            make.bottom.equalToSuperview()
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(NewCheapTableViewCell.self, forCellReuseIdentifier: cheapCellIdentifier)
        self.tableView.register(NewHotTableViewCell.self, forCellReuseIdentifier: hotCellIdentifier)
        self.tableView.register(NewTableViewCell.self, forCellReuseIdentifier: newCellIdentifier)

        self.tableView.estimatedRowHeight = 60.0;
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.allowsSelection = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    // MARK: - UITableViewDataSource

    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   5
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        switch index {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: cheapCellIdentifier, for: indexPath) as! NewCheapTableViewCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: hotCellIdentifier, for: indexPath) as! NewHotTableViewCell
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: newCellIdentifier, for: indexPath) as! NewTableViewCell
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return index == 2 ?  110 + ITEM_WIDTH*(80/93)*2 : 240
    }
    
    // MARK: - IndicatorInfoProvider

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
   
    
}
