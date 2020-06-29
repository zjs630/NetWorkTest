//
//  UserModel.swift
//  NetWorkTest
//
//  Created by 张京顺 on 2019/6/23.
//  Copyright © 2019 zjs. All rights reserved.
//

import Foundation
struct AppModel: Decodable {

    /// appID
    var appId: UInt
    /// app名称
    var name: String
    /// app图标
    var appIcon: String
    /// 描述
    //var desc: String
    
    /* 服务器返回的json
     {"app_id": 1, "name": "一号管家", "app_icon": "...","desc":"..."}
     */
}

struct ResultList<T: Decodable>: Decodable {
    var code: UInt
    var message: String
    var data: [T]
}

struct ResultDic<T: Decodable>: Decodable {
    var code: UInt
    var message: String
    var data: T
}
