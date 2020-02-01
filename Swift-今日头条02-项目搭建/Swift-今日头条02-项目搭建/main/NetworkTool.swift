//
//  NetworkTool.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/1/31.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import HandyJSON

protocol NetworkToolProtocol {
    //我的界面的cell的数据
    static func loadMyCellData(completionHandler:@escaping (_ sections : [[MyCellModel]]) -> ())
    
    //我的关注的数据
    static func loadMyConcern()
}

extension NetworkToolProtocol{
    static func loadMyCellData(completionHandler:@escaping (_ sections : [[MyCellModel]]) -> ()){
        let url = baseURL + "/user/tab/tabs/?"
        let params = ["device_id" : deviceID]
        Alamofire.request(url,parameters: params).responseJSON(queue: .global(), options: .allowFragments) { (response : DataResponse) in
            
            
            guard response.result.isSuccess else{
                //网络信息错误
                
                return
            }
            if let value = response.result.value{
               let json = JSON(value)
                guard json["message"] == "success" else{
                    return
                }
                
                if let data = json["data"].dictionary {
                    //1.得到一个sections的数组
                    if let sections = data["sections"]!.array{
                        //2.创建一个可变数组
                        var sectionArray = [AnyObject]()
                        //3.遍历数组sections，sections数组里的每一个元素也是一个数组
                        for itemArray in sections{
                            //4.创建一个可变数组，用来存储section数组里的每一个元素数组
                            var itemsMutableArray = [MyCellModel]()
                            //5.item其实是数组里的一个元素，这个元素通常是指一个{}包含的一个字典
                            for item in itemArray.arrayObject! {
                                let myCellModel = MyCellModel.deserialize(from: item as? NSDictionary)
                                itemsMutableArray.append(myCellModel!)
                            }
                            sectionArray.append(itemsMutableArray as AnyObject)
                        }
                        
                        completionHandler(sectionArray as! [[MyCellModel]])
                    }
                }
            }
        }
    }
    
    //我的关注的数据
    static func loadMyConcern(){
        
    }
}

struct NetworkTool : NetworkToolProtocol {
    
}
