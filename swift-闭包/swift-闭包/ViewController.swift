//
//  ViewController.swift
//  swift-闭包
//
//  Created by LPPZ-User01 on 2017/6/19.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    逃逸闭包示例：下面的闭包被方法外的数组引用，也就意味着，这个闭包在函数执行完后还可能被调用，所以必须使用逃逸闭包，不然编译不过去
    var completionHandlers: [() -> Void] = []
    func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
    }
    // 非逃逸闭包
    func someFunctionWithNoneEscapingClosure(closure: () -> Void) {
        closure()
    }

    var x = 10


    override func viewDidLoad() {
        super.viewDidLoad()

        // 逃逸闭包
        someFunctionWithEscapingClosure {
            // 注意：逃逸闭包类必须显式的引用self，
            self.x = 100
        }
        someFunctionWithNoneEscapingClosure {
            x = 200
        }
        print("x= \(x)")// x= 200
        completionHandlers.first?()
        print("x= \(x)")// x= 100



        // 函数
//       1. print(green(person: "xiao ming", day: "4"))
//        print(green("xiaoming", day: "4"))
        //2. 
//        let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
//        print(statistics.sum)
//        print(statistics.max)
//        print(statistics.min)
        //3.函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
//        print(returnFifteen())
        //4
//        let numbers = [20, 19, 7, 12]
//        print(hasAnyMatches(list: numbers, condition:lessThanTen))


//        foo(names: "zhao","zhang","wang")


        /**
            函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包所建作用域中能得到的变量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数例子中所看到。你可以使用 {} 来创建 一个匿名闭包。使用 in 将参数和返回值类型声明与闭包函数体进行分离。
         */
//        let b1 = { (str : String) -> String in
//            return str
//        }
//        print(b1("hello word"))
//        let count = { (number : [Int]) -> Int in
//            var xxx = 0
//            for count in number {
//                xxx += count
//            }
//            return xxx
//        }
//        let b1 = count([2,3,4,5])
//        print(b1)


//        testClosure()

        var shape = Shape()
        shape.numberOfSides = 10

    }

    class Shape : ViewController{

        var numberOfSides = 0
        func simpleDescription() -> String {
            return "A shape with \(numberOfSides) sides."
        }

    }

    //以下闭包以Array的sorted函数为例
    /*
     func testClosure() {
     let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
     func backward(_ str1: String, _ str2: String) -> Bool {
     return str1 > str2
     }
     // sorted函数的参数是一个闭包，下面传了一个方法名，由此说明：嵌套函数是一个有名字但并可以捕获其封闭函数域内值的闭包
     var reversedNames = names.sorted(by: backward)
     //        print(reversedNames)
     // 普通闭包格式：(参数: 参数类型,...) -> 返回值类型 in ...
     reversedNames = names.sorted(by: {(_ str1 : String, _ str2 : String) -> Bool in return str1 > str2})
     //        print(reversedNames)
     // 根据Swift的类型推断，参数类型及参数括号可以去掉，返回值类型可以去掉
     reversedNames = names.sorted(by: {str1 , str2 in return str1 > str2})
     //         print(reversedNames)
     // 单行表达式：可以去掉return
     reversedNames = names.sorted(by: {str1,str2 in str1 > str2})
     //        print(reversedNames)
     // 使用参数名缩写：参数和in也可以去掉
     reversedNames = names.sorted(by: {$0>$1})
     //        print(reversedNames)
     // 使用运算符：因为Swift中为字符串重载了大于号小于号
     reversedNames = names.sorted(by: >)
     //        print(reversedNames)
     // 使用尾随闭包：前提是闭包必须是函数的最后一个参数
     //        reversedNames = names.sorted(){$0>$1}

     // 使用尾随闭包：闭包是函数唯一参数时，可以省掉参数括号
     reversedNames = names.sorted {$0 < $1}
     //        print(reversedNames)

     let makeIncrementByTen = makeIncrementer(forIncrement: 10)
     var ret = makeIncrementByTen
     print("ret= \(ret)")
     ret = makeIncrementByTen
     print("ret= \(ret)")// ret= 20
     ret = makeIncrementByTen
     print("ret= \(ret)")// ret= 30
     let makeIncrementBySeven = makeIncrementer(forIncrement: 7)
     ret = makeIncrementBySeven
     print("ret= \(ret)")// ret= 7

     ret = makeIncrementByTen
     print("ret= \(ret)")// ret= 40
     */
    //    }

    // 值捕获示例：下面嵌套函数incrementer本身没有参数，它却捕获了外围的参数runningTotal和amount
    func makeIncrementer(forIncrement amount : Int) -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer()
    }




    //使用 _表示不使用参数标签。
    func green(_ person: String, day:String) -> String {
        return "Hello \(person), today is \(day)."
    }
    //使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示
    func calculateStatistics(scores: [Int]) -> (min: Int, max:Int, sum:Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        return (min, max, sum)
    }

    func returnFifteen() -> Int {
        var y  = 10
        func add () {
            y += 5
        }
        add()
        return y
    }
    //函数也可以当做参数传入另一个函数。
    func hasAnyMatches(list : [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                // return 退出循环
                return true
            }
        }
        return false
    }

    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }

    //可变参数函数是指函数可以接收不固定个参数。在参数类型后面添加 … 来标记这个参数为可变参数。我们可以在函数中像访问数组一样访问可变参数
    func foo(names:String...) ->() {
        for name in names {
            print("\(name)")
        }
    }
}

