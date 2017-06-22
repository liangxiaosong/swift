//
//  ViewController.swift
//  swift-GCD
//
//  Created by LPPZ-User01 on 2017/6/19.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        loadData { (result) in
//            print(result)
//        }

//        struct Profile {
//            func getPreferredLanguages() -> String {
//                return NSLocale.preferredLanguages.reduce(""){ result , item in
//                    return result + item
//                }
//            }
//        }
//
//        let profile = Profile()
//        print(profile.getPreferredLanguages())
//        struct Profile {
//            let preferredLanguages : String = {
//                return NSLocale.preferredLanguages.reduce(""){ result, item in
//
//                    return result + item
//                    
//                }
//                
//            }()
//        }
//        let profile = Profile()
//        print(profile.preferredLanguages)

//        struct Profile {
//            let settings: (preferredLanguage: String, showPhoto: Bool) = {
//
//                let preferredLanguages : String = {
//
//                    return NSLocale.preferredLanguages.reduce(""){ result, item in
//
//                        return result + item
//
//                    }
//
//                }()
//
//                let showPhoto = UserDefaults.standard.bool(forKey: "showPhoto")
//                
//                return (preferredLanguages, showPhoto)
//                
//            }()
//            
//        }

//        struct Profile {
//            let settings: (preferredLanguage: String, showPhoto: Bool) = {
//                let preferredLanguages : String = {
//                    return NSLocale.preferredLanguages.reduce("") { result, item in
//                        return result + item
//                    }
//                }()
//                let showPhoto = UserDefaults.standard.bool(forKey: "showPhoto")
//                return (preferredLanguages, showPhoto)
//            }()
//
//        }
//
//
//        let profile = Profile()
//        print(profile.settings.preferredLanguage)
//        print(profile.settings.showPhoto)
        synchronized(lock: self, closure: closure)

    }

    //这有问题
//    func delay(seconds: TimeInterval, closure: ()->()) -> () {
//        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC))
//            dispatch_after(time, dispatch_get_main_queue()){
//                print("\(time)")
//                closure()
//        }
//    }

//    func delay(seconds: TimeInterval, closure: @escaping ()->()) {
//
//        let time = dispatch_time(DispatchTime.now().rawValue, Int64(seconds * Double(NSEC_PER_SEC)))
//        dispatch_after(time, dispatch_get_main_queue()) {
//            print("🕑")
//            closure()
//        }
//    }

    //swfit GCD的线程锁
    func synchronized(lock: AnyObject, closure: () -> ()) {
        objc_sync_enter(lock)
        closure()
        objc_sync_exit(lock)
    }

    var closure = {
        print("干点啥")
    }


    func loadData(completion: @escaping  (_ result: [String])-> ()) -> () {
        DispatchQueue.global().async {
            print("耗时操作 \(Thread.current)")
            //模拟数据请求的时间间隔
            Thread.sleep(forTimeInterval: 1.0)
            //获得结果
            let json = ["头条","推荐"]

            DispatchQueue.main.async {
                print("主线程刷新UI \(Thread.current)")
                //回调 ->执行 闭包（通过参数传递函数）
                completion(json)
            }

        }
    }


}

