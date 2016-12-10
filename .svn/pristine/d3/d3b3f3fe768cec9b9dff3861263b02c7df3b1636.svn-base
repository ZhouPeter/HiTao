//
//  MineInfoViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/28.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MineInfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //cellIdentifier 设置
    let headerImageCellIdentifier = "headerImageCell"
    let nicknameCellIdentifier = "nicknameCell"
    let mobileCellIdentifier = "mobileCell"
    let passwordCellIdentifier = "passwordCell"
    let showEditPasswordSegueIdentifier =  "showEditPasswordSegue"
    let showEditPhoneSegueIdentifier = "showEditPhoneSegue"
    let showEditNicknameIdentifier = "showEditNicknameSegue"
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackItem()
        //设置tableview尾部为无
        self.tableView.tableFooterView = UIView()
        
    }

//MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: headerImageCellIdentifier , for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: nicknameCellIdentifier , for: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: mobileCellIdentifier , for: indexPath)
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: passwordCellIdentifier , for: indexPath)
            return cell
        }
    }
//MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            showSheet()
        case 1:
            self.performSegue(withIdentifier: showEditNicknameIdentifier, sender: self)
        case 2:
            self.performSegue(withIdentifier: showEditPhoneSegueIdentifier, sender: self)
        case 3:
            self.performSegue(withIdentifier: showEditPasswordSegueIdentifier, sender: self)
        default:
            print("default")
        }
    }
//MARK:- 展示sheet
    func showSheet() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)        
        //取消
        let actionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        //相册
        let actionPhotoLibray = UIAlertAction(title: "相册中选择图片", style: .default) { (UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
                
            }
            
        }
        //相机
        let actionCamera = UIAlertAction(title: "相机拍摄", style: .default) { (UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        }
        
        alert.addAction(actionPhotoLibray)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        self.present(alert, animated: true,completion: nil)
    }
    //MARK:- UIImagePickerControllerDelegate
    //选择图片回调
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       
        (self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! InfoHeaderTableViewCell ).headerImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditPhoneOneViewController{
            vc.phoneString = "15857476747"
        }else if let vc = segue.destination as? EditNicknameViewController{
            vc.oldNickname = "小白二三两"
        }
        
    }

}
