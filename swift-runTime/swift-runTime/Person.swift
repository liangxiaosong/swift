//
//  Person.swift
//  swift-runTime
//
//  Created by LPPZ-User01 on 2017/6/21.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

/**
    归档和解归档 必须遵循NSCoding协议
 */
class Person: NSObject,NSCoding {

    var name:String?
    //var age:Int? 基本数据类型 最好不要用可选值 在kvc赋值的情况下回造成崩溃
    var age: Int = 0
    var title:String?
    /**
     在OC中，没有绝对的私有，用运行时可以取出。
     在Swift中，有绝对的私有，用private修饰的，是无法取出的。
     */
    //重载构造函数
//    init(name: String, age:Int, title:String) {
//        self.name = name
//        self.age = age
//        self.title = title
//        super.init()
//    }

    /// `重写`父类的构造函数
    override init() {
        super.init()
    }

    //等于oc中的+方法
    class func propertyList() {
        var count: UInt32 = 0
        let prolist = class_copyPropertyList(self, &count)
        for i in 0..<Int(count) {
            guard let pro = prolist?[i],
                  let proString = property_getName(pro),//获取 `属性` 的名称C语言字符串
                  let proName = String(utf8String:proString)//转化成 String的字符串
            else {
                continue
            }
            print(proName)
        }
        //You must free the array with free().
        // 释放 C 语言的对象
        free(prolist)
    }

    //归档
    func encode(with aCoder: NSCoder) {
        var count :UInt32 = 0
        let ivar = class_copyIvarList(Person.self, &count)
        for i in 0..<Int(count) {
            guard   let iva = ivar?[i],
                let cName  = ivar_getName(iva),//获取成员变量的名称 -》 c语言字符串
                let StrName = String(utf8String:cName)////转换成String字符串
                else {
                    continue
            }
            //利用kvc 取值
            let value = self.value(forKey: StrName)
            aCoder.encode(value, forKey: StrName)
            print(value ?? "")
        }
        free(ivar)
    }

    //解档 public init?(coder aDecoder: NSCoder)
    internal required init?(coder aDecoder: NSCoder){
        super.init()
        var count :UInt32 = 0
        let ivar = class_copyIvarList(Person.self, &count)
        for i in 0..<Int(count) {
            guard   let iv = ivar?[i],
                    let cName = ivar_getName(iv),///获取成员变量的名称 -》 c语言字符串
                    let Strname = String(utf8String:cName)////转换成String字符串
                else{
                //继续下一次遍历
                continue
            }
            //进行解档取值
            let value = aDecoder.decodeObject(forKey: Strname)
            //利用kvc给属性赋值
            setValue(value, forKeyPath: Strname)
            print(value ?? "")
        }
        // 释放c 语言对象
        free(ivar)
    }


}
