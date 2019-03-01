//
//  AlertManager.swift
//  OPTC
//
//  Created by fmkj on 2018/12/1.
//  Copyright © 2018 fmkj. All rights reserved.
//

import Foundation
import SDCAlertView

class AlertManager: NSObject {
    
    @objc
    static func showAlertWithTitle(title:String ,content:String,style : AlertControllerStyle ,sureHander:@escaping ((AlertAction) -> Void),cancelHander : @escaping ((AlertAction) -> Void)) {
        showAlertWithTextField(title: title, content: content, style: style, textFieldAction: nil, sureHander: sureHander, cancelHander: cancelHander)
    }
    static func showAlertWithTextField(title:String ,content:String,style : AlertControllerStyle ,textFieldAction : ((UITextField) -> Void)?,sureHander:@escaping ((AlertAction) -> Void),cancelHander : @escaping ((AlertAction) -> Void)){
        let alert = AlertController(title: title, message: content, preferredStyle: style)
        if textFieldAction != nil{
            alert.addTextField(withHandler: textFieldAction)
        }
        
        alert.addAction(AlertAction(title: "确定".localized, style: .normal, handler: sureHander))
        alert.addAction(AlertAction(title: "取消".localized, style: .destructive, handler: cancelHander))
        alert.present()
    }
    static func showAlertWithMnmonic(title:String ,content:String,style : AlertControllerStyle ,sureHander:@escaping ((AlertAction) -> Void)) {
        let alert = AlertController(title: title, message: content, preferredStyle: style)
        alert.addAction(AlertAction(title: "确定".localized, style: .normal, handler: sureHander))
        alert.present()

    }

    static func showAlertWithView(title : String,content : String,style:AlertControllerStyle,view : UIView,sureHander:@escaping ((AlertAction) -> Void),cancelHander : @escaping ((AlertAction) -> Void)){
        let alert = AlertController(title: title, message: content, preferredStyle: style)
        view.translatesAutoresizingMaskIntoConstraints = false
        alert.contentView.addSubview(view)
        view.centerXAnchor.constraint(equalTo:  alert.contentView.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo:  alert.contentView.centerYAnchor).isActive = true
        view.topAnchor.constraint(equalTo:  alert.contentView.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo:  alert.contentView.leadingAnchor).isActive = true
        alert.addAction(AlertAction(title: "确定".localized, style: .normal, handler: sureHander))
        alert.addAction(AlertAction(title: "取消".localized, style: .destructive, handler: cancelHander))
        alert.present()
    }
    
    static func showChangeLanguseView(title : String, style:AlertControllerStyle,ChiHander : @escaping ((AlertAction) -> Void),EnHander : @escaping ((AlertAction) -> Void),KoHander : @escaping ((AlertAction) -> Void),EsHander : @escaping ((AlertAction) -> Void),JaHander : @escaping ((AlertAction) -> Void),cancelHander : @escaping ((AlertAction) -> Void)){
        let alert = AlertController(title: title, message: nil, preferredStyle: style)
        alert.addAction(AlertAction(title: "取消".localized, style: .destructive, handler: cancelHander))
        alert.addAction(AlertAction(title: "中文".localized, style: .normal, handler: ChiHander))
        alert.addAction(AlertAction(title: "英语".localized, style: .normal, handler: EnHander))
        alert.addAction(AlertAction(title: "韩语".localized, style: .normal, handler: KoHander))
        alert.addAction(AlertAction(title: "西班牙".localized, style: .normal, handler: EsHander))
        alert.addAction(AlertAction(title: "日语".localized, style: .normal, handler: JaHander))


        alert.present()
        
    }
    
    static func showChossePhotoView(title : String, style:AlertControllerStyle,EnHander : @escaping ((AlertAction) -> Void),ChiHander : @escaping ((AlertAction) -> Void),cancelHander : @escaping ((AlertAction) -> Void)){
        let alert = AlertController(title: title, message: nil, preferredStyle: style)
        alert.addAction(AlertAction(title: "取消".localized, style: .destructive, handler: cancelHander))
        alert.addAction(AlertAction(title: "拍照".localized, style: .normal, handler: EnHander))
        alert.addAction(AlertAction(title: "从相册选择".localized, style: .normal, handler: ChiHander))
        
        alert.present()
        
    }

    
}
