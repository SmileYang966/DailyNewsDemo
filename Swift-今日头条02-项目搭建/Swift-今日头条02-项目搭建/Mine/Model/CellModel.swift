//
//  MyCellModel.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/1/31.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import Foundation
import HandyJSON
import SwiftyJSON

struct MyCellModel : HandyJSON{
    var text : String = ""
    var grey_text : String = ""
    var url : String = ""
    var key : String = ""
    var tip_new : Int = 0
}

struct MyConcernModel : HandyJSON{
    var name : String?
    var url : String?
    var total_count : String?
    var description : String?
    var time : String?
    var type : String?
    var icon : String?
    
    var userid : String?
    var is_verify : Bool?
    var media_id : Int?
    var tips : Bool?
    var id : Int?
    var user_auth_info : String?
    //字符串转化为UserAuthInfo类型的数据结构
    var userAuthInfo : UserAuthInfo?{
        return UserAuthInfo.deserialize(from: user_auth_info)
    }
}

struct UserAuthInfo : HandyJSON{
    var auth_type : Int?
    var auth_info : String?
}
