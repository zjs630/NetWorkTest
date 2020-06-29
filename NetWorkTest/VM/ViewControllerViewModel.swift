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

    var listCount: Int {
        return dataList?.count ?? 0
    }
    
    func getStudents(finishedCallback: @escaping (_ isSuccess: Bool) -> Void)  {
        let urlPathStr = "test/json.php"

        NetworkManager.requestDecodable(urlPathStr,type:ResultList<AppModel>.self) { (response) in
            if let listModel = response.value {
                self.dataList = listModel.data
                finishedCallback(true)
            } else {
                finishedCallback(false)
            }
        }

    }


}
