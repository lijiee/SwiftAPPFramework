//
//  PlaceholderColor.swift
//  OPTC
//
//  Created by fmkj on 2018/12/10.
//  Copyright © 2018 fmkj. All rights reserved.
//

import UIKit
extension UITextField {
    //MARK:-设置暂位文字的颜色
    @IBInspectable var placeholderColor:UIColor {
        get{
            let color =   self.value(forKeyPath: "_placeholderLabel.textColor")
            if(color == nil){
                return UIColor.white;
            }
            return color as! UIColor;
        }
        set{
            self.setValue(newValue, forKeyPath: "_placeholderLabel.textColor")
        }
    }
    @IBInspectable var placeholderLine : Int {
        get{
            let count = self.value(forKeyPath: "_placeholderLabel.numberOfLines")
            if count == nil {
                return 0
            }
            return count as! Int
        }
        set {
            self.setValue(newValue, forKeyPath: "_placeholderLabel.numberOfLines")

        }
        
    }

}
