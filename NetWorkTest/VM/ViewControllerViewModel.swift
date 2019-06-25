//
//  ViewControllerViewModel.swift
//  NetWorkTest
//
//  Created by 张京顺 on 2019/6/23.
//  Copyright © 2019 zjs. All rights reserved.
//

import Foundation
class ViewControllerViewModel {
    var dataList: [AppModel]?
    
    func getStudents(finishedCallback: @escaping (_ isSuccess: Bool) -> Void)  {
        let urlStr = "test/json.php"
        
        NetworkManager.request(urlStr).responseData { (response) in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let model = try decoder.decode(Result<AppModel>.self , from: data)
                    print(model)
                    self.dataList = model.data
                    finishedCallback(true)
                } catch {
                    print(error)
                }
            }
            finishedCallback(false)
        }
    }
}
