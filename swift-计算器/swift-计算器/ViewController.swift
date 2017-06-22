//
//  ViewController.swift
//  swift-计算器
//
//  Created by LPPZ-User01 on 2017/6/20.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberText1:UITextField?
    var numberText2:UITextField?
    var numberText3:UITextField?


    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }

    func createUI() {
        let textFile1 = UITextField(frame:CGRect(x:20, y:100, width:100, height:30))
        textFile1.text = "0"
        textFile1.borderStyle = .roundedRect
        view.addSubview(textFile1)

        let pushLabel = UILabel(frame:CGRect(x:130,y:100, width:30,height:30))
        pushLabel.text = "+"
        pushLabel.textAlignment = .center
        view.addSubview(pushLabel)

        let textFile2 = UITextField(frame:CGRect(x:170, y:100, width:100, height:30))
        textFile2.text = "0"
        textFile2.borderStyle = .roundedRect
        view.addSubview(textFile2)

        let equalLabel = UILabel(frame:CGRect(x:280,y:100, width:30,height:30))
        equalLabel.text = "="
        equalLabel.textColor = UIColor.blue
        equalLabel.textAlignment = .center
        view.addSubview(equalLabel)

        let addTextFile = UITextField(frame:CGRect(x:320,y:100,width:100,height:30))
        addTextFile.text = "0"
        addTextFile.borderStyle = .roundedRect
        view.addSubview(addTextFile)
        numberText1 = textFile1
        numberText2 = textFile2
        numberText3 = addTextFile

        let btn = UIButton()
        btn.center = view.center
        btn.setTitle("计算", for: UIControlState(rawValue:0))
        btn.setTitleColor(UIColor.blue, for: UIControlState(rawValue:0))
        btn.sizeToFit()
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(calc), for: .touchUpInside)

    }

    func calc()  {
        guard let num1 = Int(numberText1?.text ?? ""),
            let num2 = Int(numberText2?.text ?? "") else {
                print("必须都输入数字")
                return
        }
        numberText3?.text = "\(num1 + num2)"
    }


}

