//
//  ListViewController.swift
//  NetWorkTest
//
//  Created by 张京顺 on 2019/6/23.
//  Copyright © 2019 zjs. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ListViewController: UITableViewController {

    let vm = ViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AppCell.self, forCellReuseIdentifier: "MyReuseId")
        loadData()
    }

    private func loadData() {
        vm.getStudents { (isSuccess) in
            self.tableView.reloadData()
        }
    }

    deinit {
        print(#function)
    }
}

// MARK: - UITableViewDelegate
extension ListViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.dataList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - UITableViewDataSource
extension ListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyReuseId", for: indexPath) as? AppCell

        cell?.model = vm.dataList?[indexPath.row]
        return cell!
    }

}

