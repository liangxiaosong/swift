//
//  ViewController.swift
//  swift-runTime
//
//  Created by LPPZ-User01 on 2017/6/21.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let p = Person(name: "张三", age: 26, title: "ios 程序员")
        //Optional("张三") 26 Optional("ios 程序员")
        // ?? 消除 Optional
        print("\(p.name ?? "") \(p.age) \( p.title ?? "")")
        Person.propertyList()
        */
        let p  = Person()
        p.name = "lxs"
        p.age = 20
        p.title = "ios"

        //文件路径的判断 防止多次重复的归档
        let fileManager = FileManager.default
        let filePath:String = Path
        let exist = fileManager.fileExists(atPath: filePath)
        if !exist {
             NSKeyedArchiver.archiveRootObject(p, toFile: Path)
        }else {
            print(Path)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //as！强制类型类型转换 如果转换失败会报 runtime 运行错误。
        //as? 如果转换不成功的时候便会返回一个 nil 对象
        guard let p = NSKeyedUnarchiver.unarchiveObject(withFile: Path) as? Person
            else {
            return
        }
        print("\(p.name ?? "")")
    }

    var Path: String{
        /**
         oc: NSDocumentDirectory 是指程序中对应的Documents路径，而NSDocumentionDirectory对应于程序中的Library/Documentation路径，这个路径是没有读写权限的，所以看不到文件生成。
         swift: documentDirectory 是指程序中对应的Documents路径，而documentationDirectory对应于程序中的Library/Documentation路径，这个路径是没有读写权限的，所以看不到文件生成。
         */
//        let path = NSSearchPathForDirectoriesInDomains(.documentationDirectory, .userDomainMask, true).last
         let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        return (path! as NSString).appendingPathComponent("account.plist")
    }

}

