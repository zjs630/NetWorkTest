//
//  AppCell.swift
//  NetWorkTest
//
//  Created by 张京顺 on 2019/6/23.
//  Copyright © 2019 zjs. All rights reserved.
//

import UIKit
import Kingfisher
class AppCell: UITableViewCell {

    var iconImageView = UIImageView()
    var nameLabel: UILabel = UILabel()

    var model: UserModel?  {
        didSet {
            nameLabel.text = model?.name
            let url = URL(string: model?.icon ?? "")
            iconImageView.kf.setImage(with: url)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AppCell {
    private func setupUI() {
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let viewDic = ["iconImageView":iconImageView,"nameLabel":nameLabel]
        let hc = NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[iconImageView(60)]-15-[nameLabel]-15-|", options: [], metrics: nil, views: viewDic)
        contentView.addConstraints(hc)
        let vc = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[iconImageView]-10-|", options: [], metrics: nil, views: viewDic)
        contentView.addConstraints(vc)
        let vc2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[nameLabel]-0-|", options: [], metrics: nil, views: viewDic)
        contentView.addConstraints(vc2)
        
    }
}
