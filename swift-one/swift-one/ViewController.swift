//
//  ViewController.swift
//  swift-one
//
//  Created by LPPZ-User01 on 2017/3/14.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //常量
        var myVariable = 42
        myVariable = 50
        let myConstans = 42



        let implicitInteger = 70
        let implicitDouble = 70.0
        let explicitDouble: Double = 70


        let explicitFloat: Float = 70.0



        let label = "the width is"
        let width = 94
        let widthLabel = label + String(width)

        print(widthLabel)


        let apples = 3
        let oranges = 5
        //还有一种更简单的方式把值转换成String类型：在圆括号中写值，并在圆括号中的开始处插入反斜杠“\”。这就是我们熟悉的字符串插值表达式。
        let appleSummary = "i have \(apples) apples ."
        let fruitSummary = "I have \(apples + oranges) pieces of fruit."
        print(fruitSummary,appleSummary)
        //在值的类型后面加上问号（？）以标记该值为可选类型
//        let optionalInt: Int ?= 9
//        let actualInt: Int = optionalInt!


        //使用方括号 [] 来创建数组和字典，并使用下标或者键（key）来访问元素。最后一个元素后面允许有个逗号
        var shoppingList = ["catfish","water","tuplips","blue paint"]
        shoppingList[1] = "bottle of water"
        print(shoppingList[1])
        var occupations = [
            "Malcolm": "Captain",
            "Kaylee": "Mechanic",
        ]
        occupations["Jayne"] = "Public Relations"
        print(occupations["Jayne"])

        //要创建一个空数组或者字典，使用初始化语法
        let emptyArray = [String]()
        let emptyDictionary = [String:Float]()

        //如果类型信息可以被推断出来，你可以用 [] 和 [:] 来创建空数组和空字典——就像你声明变量或者给函数传参数的时候一样。
        shoppingList = []
        occupations = [:]


        let individualScoes = [75, 43, 103, 87, 12]
        var tempScoes = 0
        for score in individualScoes {
            if score > 50 {
                tempScoes += 3
            }else {
                tempScoes += 1
            }
        }
        print(tempScoes)


        var optionalString: String? = "hello"
        print(optionalString == nil)

        var optionalName: String? = "john Appleeed"
        var greeting = "Hello"
        if let name = optionalName {
            greeting = "Hello, \(name)"
            print(greeting)
        }
        //?? 相当于oc的三目运算符
        let nickName: String? = "made"
        let fullName:String? = "John Appleseed"
        let informalGreeting = "hi \(nickName ?? fullName)"
        print(informalGreeting)

        //hasSuffix 字符串是否以指定的后缀结束
        let vegetable = "red pepper"
        switch vegetable {
        case  "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
        }

        let interestingNumbers = [
                "Prime": [2, 3, 5, 7, 11, 13],
                "Fibonacci": [1, 1, 2, 3, 5, 8],
                "Square": [1, 4, 9, 16, 25],
        ]
        var largest = 0
        //kind Fibonacci(key)
//        字典是一个无序的集合
        for (kind,numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number
                }
            }
        }
        print(largest)


        var n = 2
        while n < 100 {
            n = n * 2
            print(n)
        }
        print(n)

        //保证能至少循环一次
        var m = 2
        repeat {
            m = m * 2
        } while m < 100
        print(m)

        //使用 ..< 创建的范围不包含上界，如果想包含的话需要使用...
        var total = 0
        for i in 0..<4 {
            total += i
            print(total,i)
        }
        print(total)

        let str = greet(person: "liagxaiosong", on: "2017/3/14")
        print(str)


    }
    func greet (person:String, on day:String) -> String {
        return "hello word + \(person) + \(day)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

