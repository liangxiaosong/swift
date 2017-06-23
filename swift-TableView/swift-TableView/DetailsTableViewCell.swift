//
//  DetailsTableViewCell.swift
//  swift-TableView
//
//  Created by LPPZ-User01 on 2017/6/23.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell,UITextFieldDelegate {

    var textFieid:UITextField?
    var changeTitle:((_ tag : Int,_ title:String) ->Void)?


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }

    func setModel(person:Person,index:Int) {
        switch index {
        case 0:
            self.textFieid?.text = person.phone
            self.textFieid?.keyboardType = .phonePad
            self.textFieid?.placeholder = "请输入联系电话"
            self.textFieid?.tag = 0
            break
        case 1:
            self.textFieid?.text = person.name
            self.textFieid?.keyboardType = .default
            self.textFieid?.placeholder = "请输入姓名"
            self.textFieid?.tag = 1
            break
        case 2:
            self.textFieid?.text = person.subTitle
            self.textFieid?.keyboardType = .default
            self.textFieid?.placeholder = "请输入关系"
            self.textFieid?.tag = 2
            break
        default:
            self.textFieid?.keyboardType = .default
            self.textFieid?.placeholder = "我也不知道了"
            break
        }
    }

    func setUI() {
        self.textFieid = UITextField.init(frame: CGRect(x: 10, y: 5, width: self.contentView.bounds.size.width - 20, height: self.contentView.bounds.size.height - 10))
        self.textFieid?.font = UIFont.systemFont(ofSize: 14)
        self.textFieid?.textAlignment = .left
        self.textFieid?.borderStyle = .roundedRect
        self.textFieid?.clearButtonMode = .whileEditing
        self.textFieid?.delegate = self
        self.contentView.addSubview(self.textFieid!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //这有问题，返回的数据不一致，尝试用RXSwift做数据传递

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        changeTitle!(textField.tag,textField.text!)
        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        changeTitle!(textField.tag,textField.text!)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        changeTitle!(textField.tag,textField.text!)
        return true
    }


}
