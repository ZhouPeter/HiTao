//
//  SearchViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/25.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate,UITextFieldDelegate,HJTextFieldDelegate,SearchTableViewCellDelegate{
    //是否开始搜索
    var  isStartSearch :Bool = false{
        willSet{
            self.topView.isHidden = newValue
            if newValue{
                self.tableView.frame.origin.y = naviStateBarHeight
                
            }else{
                //40为topView高度
                self.tableView.frame.origin.y = 40 + naviStateBarHeight
            }
        }
    }
    //条件1的值去改变Button的高度
    //条件1选择的值
    var firstCondition:Int!{
        //添加属性观察者
        didSet{
            //判断是否已有选择
            if let oldValue = oldValue{
                changeOldButtonHeight(tag: oldValue)

            }
        }
        willSet{
            changeNewButtonHeight(tag: newValue)
        }
    }



    //搜索记录数组
    var  historyArray  = ["新品发布","热销排行","本周排行","整","新品发布","热销排行","本周排行","整"]
    //标签数组
    var  iconArray  = ["新品发布","热销排行","本周排行","整","新品发布","热销排行","本周排行","整"]
    //搜索结果数组
    var searchArray = ["新品发布","热销排行","本周排行","整","新品发布","热销排行","本周排行","整"]
    @IBOutlet weak var searchTextField: HJTextField!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var iconCellHeight:CGFloat = 0
    var historyCellHeight:CGFloat = 0
    let searchIconCellIdentifier = "searchIconCell"
    let searchHistoryCellIdentifier = "searchHistoryCell"
    let searchResultCellIdentifier = "searchResultCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        //指定输入框代理
        self.searchTextField.delegate = self
        self.searchTextField.HJDelegate = self
        self.searchTextField.addTarget(self, action: #selector(SearchViewController.textFieldValueChange(_:)), for: .editingChanged)
        //搜索框圆角设置
        self.searchTextField.ViewToRoundViewBycornerRadius(cornerRadius: 5)
    }
 

    @IBAction func selectFirstCondition(_ sender: UIButton) {
        self.firstCondition = sender.tag
    }
    //以前选择的Button高度增大
    func changeOldButtonHeight(tag:Int){
        for view in topView.subviews {
            if view.tag == tag{
                view.frame.size.height += 1
            }
        }
    }
    //当前选择的Button高度增大
    func changeNewButtonHeight(tag:Int){
        for view in topView.subviews {
            if view.tag == tag{
                view.frame.size.height -= 1
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        //隐藏tabBar
        self.navigationController?.navigationBar.isTranslucent = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return  isStartSearch ? searchArray.count :  2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //如果开始搜索显示搜索的cell
        if isStartSearch{
            let cell = tableView.dequeueReusableCell(withIdentifier: searchResultCellIdentifier, for: indexPath)
            return cell
        }
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: searchIconCellIdentifier, for: indexPath) as! SearchIconTableViewCell
            cell.iconArray = self.iconArray
            cell.addButton()
            //30button高度 20分别为垂直方向上下间距
            iconCellHeight = cell.topSpace + 30 + 20
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: searchHistoryCellIdentifier, for: indexPath) as! SearchHistoryTableViewCell
            cell.historyArray = self.historyArray
            cell.addButton()
            historyCellHeight = cell.topSpace + 30 + 20 
            cell.delegate = self
            return cell
        }

        
    }
    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isStartSearch{
            let vc = SearchResultViewController()
            vc.hidesBottomBarWhenPushed = true
           self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //如果开始搜索返回搜索的cell的高度
        if isStartSearch{
            return 50
        }

        switch indexPath.section {
        case 0:
            return iconCellHeight
        default:
            //64导航栏和状态栏 40条件1的高度  1tableviewHeader Section == 0的高度 10tableviewHeader Section == 1的高度
            return SCREEN_HEIGTH - 64 - 40 - 1 - iconCellHeight - 10
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if isStartSearch{
            return 1
        }
        switch section {
        case 0:
            return 1

        default:
            return 10
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //判断是否是第一个控制view的高度
        let height:CGFloat = section == 0 || isStartSearch ? 1 : 10
        let view = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: height))
        view.backgroundColor = HiTaoBackgroundColor
        return view
    }
    
    //MARK:- UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let contentString : String = textField.text!
        let newRange = range.toRangeByString(content: contentString)
        //搜索内容
        let string = contentString.replacingCharacters(in: newRange , with: string)
        print(string)
        return true
    }
    

    //MARK:- SearchTableViewCellDelegate
    
    /// 实现删除操作的代理方法
    func deleteHistoryInSearch() {
        //清空历史搜索记录数组
        self.historyArray.removeAll(keepingCapacity: true)
        //指定刷新cell
        self.tableView.reloadRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
    }

    //设置textField右图为扫一扫
    func setTextFieldRightScaningView(){
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width:self.searchTextField.frame.height*0.5, height:  self.searchTextField.frame.height*0.5))
        rightView.setImage(UIImage(named:"scanning_icon"), for: .normal)
        rightView.addTarget(self, action: #selector(SearchViewController.scanningTextField(_:)), for:.touchUpInside)
        self.searchTextField.rightView = rightView
    }
    //设置textField右图为清空
    func setTextFieldRightClearView(){
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width:self.searchTextField.frame.height*0.5, height:  self.searchTextField.frame.height*0.5))
        rightView.setImage(UIImage(named:"clear_icon"), for: .normal)
        rightView.addTarget(self, action: #selector(SearchViewController.clearTextField(_:)), for:.touchUpInside)
        self.searchTextField.rightView = rightView
    }
    func textFieldValueChange(_ sender: UITextField){
        if (sender.text?.characters.count)! > 0{
            isStartSearch = true
            self.setTextFieldRightClearView()
        }else{
            isStartSearch = false
            self.setTextFieldRightScaningView()
        }
        self.tableView.reloadData()
    }
    //清空输入
    func clearTextField(_ sender:UIButton){
        self.searchTextField.text = ""
        isStartSearch = false
        self.setTextFieldRightScaningView()
        self.tableView.reloadData()
        
    }
    func scanningTextField(_ sender:AnyObject?){
          print("start scanning")
        
    }
    
    
    
    

}
