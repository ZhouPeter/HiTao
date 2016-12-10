//
//  SpecColorTableViewProtocol.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/24.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SpecColorTableViewProtocol: NSObject ,UITableViewDelegate,UITableViewDataSource{
    var array:[SpecColorModel] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell =  SpecTableViewCell(style: .default, reuseIdentifier: "cell")
        cell.contentLabel.textColor = array[indexPath.row].isSelect ? customRed : UIColor.black
        cell.selectImageView.isHidden = !array[indexPath.row].isSelect
        cell.setData(textString:array[indexPath.row].colorName)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for index in 0 ..< array.count {
            array[index].isSelect = false
        }
        array[indexPath.row].isSelect = true
        tableView.reloadData()
        
    }
}
