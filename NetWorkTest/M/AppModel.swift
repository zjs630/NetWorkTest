//
//  UserModel.swift
//  NetWorkTest
//
//  Created by 张京顺 on 2019/6/23.
//  Copyright © 2019 zjs. All rights reserved.
//

import Foundation
struct AppModel: Codable {
    /*
     注： Model中的key，在json中必须要有对应的key，否则Data转model失败
     keyNotFound(CodingKeys(stringValue: "aid", intValue: nil)
     如果不想用json中的key，可以在enum CodingKeys中，自定义key，需要设置key的对应关系。
     */
    var appID: UInt
    /// app名称
    var name: String
    /// app图标
    var appIcon: String
    /// 描述
    //var desc: String
    
    /// 自定义需要编解码的key
    enum CodingKeys : String, CodingKey {
        case appID = "id" //将json数据的"id"key跟Model的"appID"对应起来
        case name
        /* swift 4.1 新增
         JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase
         // 会自动将app_icon转成appIcon
         */
        case appIcon

    }
    /* 服务器返回的json
     {"id": 1, "name": "一号管家", "app_icon": "...","desc":"..."}
     */
}

struct Result<T: Codable>: Codable {
    var code: UInt
    var message: String
    var data: [T]
}
