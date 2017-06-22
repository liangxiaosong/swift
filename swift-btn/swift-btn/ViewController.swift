//
//  ViewController.swift
//  swift-btn
//
//  Created by LPPZ-User01 on 2017/6/13.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        button 的基本应用
        setBtn()
    }

    func setBtn() {
        /** 按钮类型
         case custom // no button type 普通
         @available(iOS 7.0, *)
         case system // standard system button 前面不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
         case detailDisclosure 前面带“!”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         case infoLight 为感叹号“!”圆形按钮
         case infoDark 为感叹号“!”圆形按钮
         case contactAdd 前面带“+”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         */
        //创建一个类型为contactAdd的按钮
        let button:UIButton = UIButton(type:.custom)
        //设置按钮的位置和大小
        button.frame = CGRect(x:10, y:150,width:100,height:30)
        //舍设置按钮的文字
        button.setTitle("普通按钮", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.2522242983, blue: 0.213428576, alpha: 1), for: .normal)
        //button.setTitle("触摸状态", for: .highlighted)
        //button.setTitle("禁用状态", for: .disabled)
        //设置按钮阴影颜色
        button.setTitleShadowColor(UIColor.green, for: .normal)
        //改变图片，但改后的图片是按钮的默认色：蓝色， 丢失了图片的原色
//        button.setImage(UIImage(named:""), for: .normal)

        // 改变图片 保证图片不失真
//        let buttonImage = UIImage(named:"")?.withRenderingMode(.alwaysOriginal)
//        button.setImage(buttonImage, for: .normal)
        //使触摸模式下按钮也不会变暗（半透明）
//        button.adjustsImageWhenHighlighted = false
//        //使禁用模式下按钮也不会变暗（半透明）
//        button.adjustsImageWhenDisabled = false

        // button的处理事件
        /**
         常用的触摸事件类型：
         TouchDown：单点触摸按下事件，点触屏幕
         TouchDownRepeat：多点触摸按下事件，点触计数大于1，按下第2、3或第4根手指的时候
         TouchDragInside：触摸在控件内拖动时
         TouchDragOutside：触摸在控件外拖动时
         TouchDragEnter：触摸从控件之外拖动到内部时
         TouchDragExit：触摸从控件内部拖动到外部时
         TouchUpInside：在控件之内触摸并抬起事件
         TouchUpOutside：在控件之外触摸抬起事件
         TouchCancel：触摸取消事件，即一次触摸因为放上太多手指而被取消，或者电话打断
         */
        button .addTarget(self, action: #selector(action1(button:)), for:.touchUpInside)
        button.tag = 10000
        self.view.addSubview(button)
    }

    func action1(button:UIButton) {
        //! 强行解包 不安全
        // ?? 相当于oc中的三目运算符 优先级高
        print("按钮事件:\(button.title(for: .normal) ?? "")")
        let str:String =  button.title(for: .normal)!

        if str == "按钮" {
            print("按钮相等")
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

