//
//  ViewController.swift
//  swift_ basis(基础)
//
//  Created by LPPZ-User01 on 2017/6/8.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        var individualScores = [75, 43, 103, 87, 12]
//        var teamScore = 0
//        for score in individualScores {
//            if score > 50 {
//                teamScore += 3
//            } else {
//                teamScore += 1
//            }
//        }
//        print(teamScore)

//        var optionalString: String? = "Hello"
//        print(optionalString == nil)
//
//        var optionalName: String? = "John Appleseed"
//        var greeting = "Hello!"
//        if let name = optionalName {
//            greeting = "Hello, \(name)"
//        }
//        print(greeting)
//
//        let nickName: String? = nil
//        let fullName: String = "John Appleseed"
//        let informalGreeting = "Hi \(nickName ?? fullName)"
//        print(informalGreeting)

//        let vegetable = "pepper"
//        switch vegetable {
//        case "celery":
//            print("Add some raisins and make ants on a log.")
//        case "cucumber","watercress":
//             print("That would make a good tea sandwich.")
//        case let x where x.hasPrefix("pepper"):
//            print("Is it a spicy \(x)?")
//        default:
//             print("Everything tastes good in soup.")
//        }

//        let interestingNumbers = [
//            "Prime": [2, 3, 5, 7, 11, 13],
//            "Fibonacci": [1, 1, 2, 3, 5, 8],
//            "Square": [1, 4, 9, 16, 25],
//            ]
//        var largest = 0
//        for (kind, numbers) in interestingNumbers {
//            for number in numbers {
//                if number > largest {
//                    largest = number
//                }
//            }
//        }
//        print(largest)

        var n = 2
        while n < 100 {
            n *= 2
        }
        print(n)

        var m = 2
        repeat {
            m *= 2
        } while m < 100
        print(m)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

