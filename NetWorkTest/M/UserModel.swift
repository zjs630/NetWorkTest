//
//  UserModel.swift
//  NetWorkTest
//
//  Created by 张京顺 on 2019/6/23.
//  Copyright © 2019 zjs. All rights reserved.
//

import Foundation
struct UserModel: Codable {
    var uid: UInt
    var name: String
    var icon: String
}

struct Result<T: Codable>: Codable {
    var code: UInt
    var message: String
    var data: [T]
}
