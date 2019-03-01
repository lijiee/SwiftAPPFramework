//
//  ToastManager.swift
//  OPTC
//
//  Created by fmkj on 2018/12/2.
//  Copyright © 2018 fmkj. All rights reserved.
//

import UIKit
import Toast_Swift
import SwifterSwift
class ToastHander: NSObject {
    static var time : TimeInterval = 1.5;
    
    
    static func showToastWithContent(content : String? ,title : String?, image : UIImage? , style : ToastPosition ,view : UIView){
        
        view.makeToast(content!, duration:time, position: style, title: title, image: image)
    }
    static func showToastWithContentOnly(content : String? ){
        if let view = SwifterSwift.keyWindow{
            self.showToastWithContent(content: content!, title: nil, image: nil, style: .center, view: view)
        }
        
        
    }
    
    static func showNetLoading(){
        if let view = SwifterSwift.keyWindow{
            view.makeToastActivity(.center)
        }
    }
    
    
    static func hideAllToast(){
        if let view = SwifterSwift.keyWindow{
            view.hideAllToasts()
        }
        
        
    }
    static func hideActivityToast(){
        if let view = SwifterSwift.keyWindow{
            view.hideToastActivity()
        }
        
        
    }
    
    
}
