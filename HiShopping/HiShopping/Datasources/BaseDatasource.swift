//
//  BaseDatasource.swift
//  HiShopping
//
//  Created by 周鹏杰 on 2016/11/29.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import Alamofire


class BaseDatasource{
    //单例
    static let sharedInstance = BaseDatasource()
    //自定义alamofire会话
    lazy var alamofireManager : SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        //请求超时时间
        configuration.timeoutIntervalForRequest = 30
        return SessionManager(configuration: configuration)
    }()
    /// get请求
    ///
    /// - Parameters:
    ///   - URLString: url字符串
    ///   - parameters: 参数字典
    ///   - completionHandler: 完成回调方法
    func get(URLString: String, parameters: [String: String]? = nil,success: @escaping (_ result:Any) -> Void , failure:@escaping (_ error:Error) -> Void){
        alamofireManager.request(URLString, method: .get, parameters: parameters).responseJSON { (response) in
            guard response.result.error == nil else{
                failure(response.result.error!)
                return
            }
            if let value = response.result.value{
                success(value)
            }
        }
        
    }
    
    
    /// post请求
    ///
    /// - Parameters:
    ///   - URLString: url字符串
    ///   - parameters: 参数字典
    ///   - completionHandler: 完成回调闭包
    func post(URLString: String, parameters: [String: String]? = nil,success: @escaping (_ result:Any) -> Void , failure:@escaping (_ error:Error) -> Void) {
        alamofireManager.request(URLString, method: .post, parameters: parameters).responseJSON { (response) in
            guard response.result.error == nil else{
                failure(response.result.error!)
                return
            }
            if let value = response.result.value{
                success(value)
            }

        }
        
    }
    
    
    /// 原生的get网络请求
    ///
    /// - Parameters:
    ///   - URLString: url字符串
    ///   - parameters: 参数字典
    ///   - completionHandler: 完成回调闭包
    func  getNative(URLString: String, parameters: [String: String]? = nil ,completionHandler:@escaping (_ value:[String:Any]?,_ error:Error?) -> Void){
        //url地址
        let url = URL(string: URLString)
        //请求
        var request = URLRequest(url: url!)
        //超时时间
        request.timeoutInterval = 30
        //请求方式
        request.httpMethod = "GET"
        //请求体
        if let parameters = parameters{
            //这一步骤必须成功(失败就说明参数格式有问题)所以无需catch抛出异常
            let data = try! JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = data
        }
        //session单例
        let session = URLSession.shared
        //任务
        let task = session.dataTask(with: request){(data,response,error) in

            //error存在的直接返回
            guard error == nil else {
                completionHandler(nil,error)
                return
            }
            do{
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: [])
                completionHandler(jsonData as? [String : Any],nil)
            }catch{
                print("json未知原因解析失败")
            }
        }
        //任务启动
        task.resume()
    }

}
    

