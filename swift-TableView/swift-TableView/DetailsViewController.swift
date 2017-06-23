//
//  DetailsViewController.swift
//  swift-TableView
//
//  Created by LPPZ-User01 on 2017/6/23.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

let DetailsCellID = "DetailsTableViewCellId"

class DetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var person:Person?
    var tableView:UITableView?
    var name:String?
    var phone:String?
    var subTitle:String?

    var completionCallBlock:(() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "详情"

        //创建UI
        setUI()
        let item = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(activeRight))
        self.navigationItem.rightBarButtonItem = item
    }

    func activeRight() {
        /**
            这写的很垃圾，最好是自定义一个model然后修改model里的三个属性直接 = person
            这主要练习tableView的使用个cell的自定义，闭包的回调
         */
        if self.name != nil {
            self.person?.name = self.name
        }
        if self.phone != nil {
            self.person?.phone = self.phone
        }
        if self.subTitle != nil {
            self.person?.subTitle = self.subTitle
        }
        self.completionCallBlock?()
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUI() {
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailsTableViewCell.classForCoder(), forCellReuseIdentifier: DetailsCellID)
        self.tableView = tableView
        self.view.addSubview(tableView)
    }

    //MARK tableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: DetailsCellID, for: indexPath) as! DetailsTableViewCell
        if cell == nil {
            cell = DetailsTableViewCell(style: .default, reuseIdentifier: DetailsCellID)
        }
        cell.setModel(person: self.person!, index: indexPath.row)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.changeTitle = { (tag:Int , title:String) in
            switch tag {
            case 0:
                self.phone = title
                break
            case 1:
                self.name = title
                break
            case 2:
                self.subTitle = title
                break
            default:
                break
            }
        }
        return cell
    }


}
