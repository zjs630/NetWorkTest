//
//  NetHostConfig.swift
//  NetWorkTest
//
//  Created by 张京顺 on 2019/6/23.
//  Copyright © 2019 zjs. All rights reserved.
//

import Foundation

struct NetHostConfig {
    #if DEBUG // DEBUG模式开发用，可以改为任何环境
    
//    static var host = "https://ix86.win:8081/"
    static var host = "http://localhost/"

    #else // 线上环境
    
    static var host = "https://ix86.win:8081/"
    
    #endif

}
