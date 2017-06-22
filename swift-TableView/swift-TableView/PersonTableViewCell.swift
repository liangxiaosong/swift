//
//  PersonTableViewCell.swift
//  swift-TableView
//
//  Created by LPPZ-User01 on 2017/6/22.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    var name:UILabel?
    var phone:UILabel?
    var subTitle:UILabel?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(person: Person) {
        self.name?.text = person.name
        self.phone?.text = person.phone
        self.subTitle?.text = person.subTitle
    }

    private func setUI(){
        self.name = UILabel.init()
        self.name?.backgroundColor = UIColor.clear
        self.name?.textColor = UIColor.black
        self.name?.textAlignment = .left
        self.name?.font = UIFont.boldSystemFont(ofSize: 14)
        self.name?.frame = CGRect(x: 10, y: 5, width: 100, height: 30)
        self.contentView.addSubview(self.name!)

        self.phone = UILabel.init()
        self.phone?.backgroundColor = UIColor.clear
        self.phone?.textColor = UIColor.black
        self.phone?.textAlignment = .left
        self.phone?.font = UIFont.boldSystemFont(ofSize: 14)
        self.phone?.frame = CGRect(x: 10, y: 40, width: 200, height: 30)
        self.contentView.addSubview(self.phone!)

        self.subTitle = UILabel.init()
        self.subTitle?.backgroundColor = UIColor.clear
        self.subTitle?.textColor = UIColor.black
        self.subTitle?.textAlignment = .left
        self.subTitle?.font = UIFont.boldSystemFont(ofSize: 14)
        self.subTitle?.frame = CGRect(x: UIScreen.main.bounds.size.width - 120, y: (self.contentView.bounds.size.height - 30)/2 , width: 100, height: 30)
        self.contentView.addSubview(self.subTitle!)
    }

}
