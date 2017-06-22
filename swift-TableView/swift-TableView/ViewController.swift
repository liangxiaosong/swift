//
//  ViewController.swift
//  swift-TableView
//
//  Created by LPPZ-User01 on 2017/6/22.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

let cellID = "tableViewCell"


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView?
    //联系人数组 实例化
    var personList = [Person]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "tableView的练习和自定义cell"

        let tableView = UITableView(frame: view.frame, style: UITableViewStyle.plain)
        tableView.register(PersonTableViewCell.classForCoder(), forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
        self.view.addSubview(tableView)


        loadData { (list) in
            self.personList += list
            self.tableView?.reloadData()
        }

    }
    /**
     什么是逃逸闭包（Escaping Closure）

     首先你需要理解什么是逃逸闭包。它的定义非常简单而且易于理解。如果一个闭包被作为一个参数传递给一个函数，并且在函数return之后才被唤起执行，那么这个闭包是逃逸闭包。并且这个闭包的参数是可以“逃出”这个函数体外的。理解了这个定义，这个逃逸闭包是不是就很好理解了呢？

     */
    //@escaping 逃逸闭包
    func loadData(completion:@escaping (_ list:[Person])->()) -> () {
        DispatchQueue.global().async { 
            print("模拟网络请求的时候加载数据的延迟")
            //睡2秒
            Thread.sleep(forTimeInterval: 1)

            var arrayM = [Person]()
            for i in 0 ..< 20 {
                let p = Person()
                p.name = "李四\(i)"
                p.phone = "1860\(arc4random_uniform(10000000))"
                p.subTitle = "boss"
                arrayM.append(p)
            }
            //回到主线程
            DispatchQueue.main.async(execute: { 
                completion(arrayM)
            })
        }
    }

    //tableView的代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personList.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 获得cell
        //as！强制类型类型转换 如果转换失败会报 runtime 运行错误。
        //as? 如果转换不成功的时候便会返回一个 nil 对象
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PersonTableViewCell
        if cell == nil {
            cell = PersonTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        cell.setData(person: self.personList[indexPath.row])
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell

    }
    //编辑操作
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.personList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }

}

