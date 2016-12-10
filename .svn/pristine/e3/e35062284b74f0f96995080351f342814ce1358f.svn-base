//
//  EditAddressViewController.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/10/31.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import ContactsUI
import AddressBookUI
import CoreLocation
class EditAddressViewController: UIViewController,CNContactPickerDelegate,ABPeoplePickerNavigationControllerDelegate,CLLocationManagerDelegate ,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    @IBOutlet weak var provinceLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    lazy var locationManager:CLLocationManager = {
        let locationManager = CLLocationManager()
        //指定代理
        locationManager.delegate = self
        //前台位置信息权限请求
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }()
    var pickerView :UIPickerView!
    //省数组
    lazy var provinceArr: Array<Any>! = {
       let area = Bundle.main.path(forResource: "area.plist", ofType: nil)
       let provinceArr =  NSArray(contentsOfFile: area!)!
       return provinceArr as? Array<Any>

    }()
    //城市数组
    var cityArr : Array<Any>!
    //街道数组
    var areaArr : Array<Any>!
    //启动定位
    @IBAction func startUpdateLoaction(_ sender: UIButton) {
        self.locationManager.startUpdatingLocation()
    }
    //从通讯录添加手机号
    @IBAction func addPhoneWithMailList(_ sender: UIButton) {
        if #available(iOS 9.0, *) {
            let picker = CNContactPickerViewController()
            picker.delegate = self
            self.present(picker, animated: true){
                
            }

        } else {
            let picker = ABPeoplePickerNavigationController()
            picker.peoplePickerDelegate = self
            self.present(picker, animated: true) {
                
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化城市数组
        self.cityArr = (provinceArr[0] as! NSDictionary)["cities"] as? Array<Any>
        //初始化街道数组
        self.areaArr = (cityArr[0] as! NSDictionary)["areas"] as? Array<Any>
        //设置右键字体大小
        //添加展示手势
        self.setRightItem(fontSize: 12)
        let tap = UITapGestureRecognizer(target: self, action: #selector(EditAddressViewController.showPickerView))
        self.provinceLabel.addGestureRecognizer(tap)
        //添加隐藏手势
        let tapView = UITapGestureRecognizer(target: self, action: #selector(EditAddressViewController.isHiddenPickerView))
        self.view.addGestureRecognizer(tapView)
    
    }
    
    /// 展示pickerView方法
    func showPickerView(){
        if pickerView == nil{
            pickerView = UIPickerView()
            self.view.addSubview(pickerView)
            pickerView.delegate = self
            pickerView.dataSource = self
            pickerView.snp.makeConstraints({ (make) in
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(300)
            })
        }else{
            pickerView.isHidden = false
        }
        
    }
    
    /// 隐藏pickerView
    func isHiddenPickerView(){
        pickerView.isHidden = true
    }
    //MARK:- UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let myView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myView.textAlignment = .center
        myView.font = BigFont
        if component == 0{
            myView.text = (provinceArr[row] as! NSDictionary)["state"] as? String
        }else if component == 1{
            myView.text = (cityArr[row] as! NSDictionary)["city"] as? String
        }else{
            myView.text = areaArr[row] as? String
        }
        return myView
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return provinceArr.count
        case 1:
            return cityArr.count
        default:
            return areaArr.count
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    //MARK:- UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            cityArr = (provinceArr[row] as! NSDictionary)["cities"] as? Array<Any>
            pickerView.selectRow(0, inComponent: 1, animated: false)
            pickerView.reloadComponent(1)
            if cityArr.count != 0{
                areaArr = (cityArr[0]as! NSDictionary)["areas"] as? Array<Any>
                pickerView.selectRow(0, inComponent: 2, animated: false)
                pickerView.reloadComponent(2)
            }
        }else if component == 1{
            areaArr = (cityArr[row]as! NSDictionary)["areas"] as? Array<Any>
            pickerView.selectRow(0, inComponent: 2, animated: false)
            pickerView.reloadComponent(2)
        }
        let province = (provinceArr[pickerView.selectedRow(inComponent: 0)] as! NSDictionary)["state"]
        let city = (cityArr[pickerView.selectedRow(inComponent: 1)] as! NSDictionary)["city"]
        let district : Any
        if areaArr.count > 0 {
            district = areaArr[pickerView.selectedRow(inComponent: 2)]
        }else{
            district = ""
        }
        self.provinceLabel.text = "\(province!) \(city!) \(district)"
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return 30
    }

    //MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @available(iOS 9.0, *)
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        print(contact.familyName) //姓
        print(contact.givenName) //名
        print(contact.phoneNumbers)
        for i in contact.phoneNumbers {
            let phoneNum = i.value.stringValue //电话号码
            print(phoneNum)
            self.phoneTextField.text = phoneNum
        }
    }
    //MARK: -CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let newLocation = locations[0]
//         newLocation =  CLLocation(latitude: 39.9, longitude: 116.3)
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(newLocation, completionHandler: {(placemarks,error) in
            if let placemarks = placemarks{
                if  placemarks.count > 0{
                    let place = placemarks[0]
                    let province = place.administrativeArea ?? ""
                    let city = place.locality ?? ""
                    let district = place.subLocality ?? ""
                    self.provinceLabel.text = "\(province) \(city) \(district)"
                }

            }
            
        })
        self.locationManager.stopUpdatingLocation()
    }
    //MARK:-ABPeoplePickerNavigationControllerDelegate
    func peoplePickerNavigationController(_ peoplePicker:ABPeoplePickerNavigationController,
                                          didSelectPerson person: ABRecord) {
        //获取姓
        let lastName = ABRecordCopyValue(person, kABPersonLastNameProperty).takeRetainedValue()
            as! String
        print("选中人的姓：\(lastName)")
        
        //获取名
        let firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty).takeRetainedValue()
            as! String
        print("选中人的名：\(firstName)")
        
        //获取电话
        let phoneValues:ABMutableMultiValue? = ABRecordCopyValue(person, kABPersonPhoneProperty).takeRetainedValue()
        if phoneValues != nil {
            print("选中人电话：")
            for i in 0 ..< ABMultiValueGetCount(phoneValues){
                
                let phoneLabel = ABMultiValueCopyLabelAtIndex(phoneValues, i).takeRetainedValue()
                    as CFString;
                // 转为本地标签名（能看得懂的标签名，比如work、home）
                let localizedPhoneLabel = ABAddressBookCopyLocalizedLabel(phoneLabel).takeRetainedValue() as String
                let value = ABMultiValueCopyValueAtIndex(phoneValues, i)
                let phone = value?.takeRetainedValue() as! String
                print("\(localizedPhoneLabel):\(phone)")
                self.phoneTextField.text = phone
            }
        }
    }


}
