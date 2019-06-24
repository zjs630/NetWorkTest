//
//  NetworkManager.swift
//  NetWorkTest
//
//  Created by 张京顺 on 2019/6/23.
//  Copyright © 2019 zjs. All rights reserved.
//

import Foundation
import Alamofire

/// 隔离Alamofire网络库
class NetworkManager: SessionManager {
    static let shared: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let sessionManager = SessionManager(configuration: configuration)
        return sessionManager
    }()
    
    /// 网络请求
    ///
    /// - Parameters:
    ///   - url: 接口路径
    ///   - method: HTTPMethod
    ///   - parameters: parameters
    ///   - encoding: ParameterEncoding
    ///   - headers: HTTPHeaders
    /// - Returns: DataRequest
    static func request(
        _ url: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil) -> DataRequest {
        let urlStr = NetHostConfig.host.appending(url)
        return NetworkManager.shared.request(urlStr, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }


}
