

//
//  ViewHead.swift
//  OPTC
//
//  Created by fmkj on 2018/12/22.
//  Copyright © 2018 fmkj. All rights reserved.
//

import UIKit
import SnapKit
class ViewHead: NSObject {
    static func addView(title:String , color : UIColor)->UIView{
        let view = UIView.init()
        let label = UILabel.init()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(label)
        view.backgroundColor = color
        label.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(20)
            make.centerY.equalTo(view)
        }
        return view
    }
    static func addHeadView(title:String , color : UIColor , titleColor:UIColor)->UIView{
        let view = UIView.init()
        let label = UILabel.init()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(label)
        view.backgroundColor = color
        label.textColor = titleColor
        label.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(20)
            make.centerY.equalTo(view)
        }
        return view
    }

}
//MARK 提现 转账 转入 记录
enum TypeForInOrOut {
    case transferRecord
    case chargeMoneyrRecord
    case mentionMoneyRecord
}
