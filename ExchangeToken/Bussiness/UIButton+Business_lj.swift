//
//  UIButton+Business_lj.swift
//  OPTC
//
//  Created by fmkj on 2018/12/2.
//  Copyright © 2018 fmkj. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

extension UIButton{
    
    func imageWithColor(color: UIColor) -> (UIImage) {
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
        
    }
    
    func lj_configureActionStyle() {
        
        self.setBackgroundImage(self.imageWithColor(color: AppTheme.shared.secondColor!), for: .normal)
        self.setBackgroundImage(self.imageWithColor(color: AppTheme.shared.disableColor!), for: .disabled)
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(AppTheme.shared.secondColor!, for: .disabled)
        
        self.layer.cornerRadius = self.frame.height/2;
        self.layer.masksToBounds = true;
        self.backgroundColor = UIColor.clear
        
    }
    
}
