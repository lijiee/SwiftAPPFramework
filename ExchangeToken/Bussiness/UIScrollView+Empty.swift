//
//  UIScrollView+Empty.swift
//  OPTC
//
//  Created by fmkj on 2018/12/4.
//  Copyright © 2018 fmkj. All rights reserved.
//

import Foundation
import UIKit
import EmptyPage
import RxCocoa
import RxSwift

extension UIScrollView{
    //没有刷新的
    func addNoRefrshEmptyData(title : String?,content : String?){
        // 获取标准样式
        if (AppTheme.shared.reachable?.isReachable)!{
            let view = EmptyPageForCustom.initFromNib
            view.imageView.isHidden = true
            view.label.text = title
            view.btn2.isHidden = true
            view.label2.text = content
//            view.backgroundColor = self.backgroundColor
            view.frame = self.frame

            self.setEmpty(view:view.mix() )
        }else{
            let view = EmptyPageForCustom.initFromNib
            view.imageView.isHidden = true
            view.label.text = "请检查您的网络连接".localized
            view.btn2.isHidden = true
            view.label2.text = ""
//            view.backgroundColor = self.backgroundColor
            view.frame = self.frame
            
            self.setEmpty(view:view.mix() )
        }
    }
    //有刷新的
    func addRefrshEmptyData(title : String?,content : String?,image : UIImage?, block: @escaping (()->())) {
        let view = EmptyPageForCustom.initFromNib
//        view.backgroundColor = self.backgroundColor
        
        if (AppTheme.shared.reachable?.isReachable)!{
            
            if image != nil {
                view.imageView.image = image
            }
            view.imageView.isHidden = image != nil
            view.frame = self.frame

            view.label.text = title
            view.label2.text = content
            view.btn2.setTitle("点击刷新".localized, for: .normal)
            view.block = block
        }else{
            if image != nil {
                view.imageView.image = image
            }
            view.imageView.isHidden = image != nil
            view.label.text = "请检查您的网络连接".localized
            view.btn2.isHidden = true
            view.label2.text = ""
        }
        self.setEmpty(view:view.mix() )
        
    }
    
    
    
    
}
