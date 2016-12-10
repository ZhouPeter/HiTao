//
//  MainTopTableViewCell.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
protocol MainTopTableViewCellDelegate :NSObjectProtocol {
    func pushToNewViewController(index:Int)
}
class MainTopTableViewCell: UITableViewCell {

    @IBOutlet weak var view0: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    weak var delegate :MainTopTableViewCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.view0.tag = 0
        self.view1.tag = 1
        self.view2.tag = 2
        self.view3.tag = 3
        let tap0 = UITapGestureRecognizer(target: self, action: #selector(MainTopTableViewCell.pushAction(_:)))
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(MainTopTableViewCell.pushAction(_:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(MainTopTableViewCell.pushAction(_:)))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(MainTopTableViewCell.pushAction(_:)))
        self.view0.addGestureRecognizer(tap0)
        self.view1.addGestureRecognizer(tap1)
        self.view2.addGestureRecognizer(tap2)
        self.view3.addGestureRecognizer(tap3)

    }
    func pushAction(_ sender: UITapGestureRecognizer){
       self.delegate.pushToNewViewController(index: (sender.view?.tag)!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
