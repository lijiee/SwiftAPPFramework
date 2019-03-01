//
//  UIView+Handful_lj.swift
//  OPTC
//
//  Created by fmkj on 2018/12/2.
//  Copyright © 2018 fmkj. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
//view任意位置添加边框线（实线，虚线）

public struct UIRectSide : OptionSet {
    
    public let rawValue: Int
    public static let left = UIRectSide(rawValue: 1 << 0)
    public static let top = UIRectSide(rawValue: 1 << 1)
    public static let right = UIRectSide(rawValue: 1 << 2)
    public static let bottom = UIRectSide(rawValue: 1 << 3)
    public static let all: UIRectSide = [.top, .right, .left, .bottom]
    public init(rawValue: Int) {
        self.rawValue = rawValue;
    }
}
extension UIView {
    //为view 添加点击事件
    
    func addTapForView() ->(Observable<UITapGestureRecognizer>){
        let ges = UITapGestureRecognizer()
        self.addGestureRecognizer(ges)
        
        return ges.rx.event.throttle(1.5, latest: true, scheduler: MainScheduler.instance)
        
        
    }
    
    
    
    
}

extension UIImage{
    
    /// 更改图片颜色
    public func imageWithTintColor(color : UIColor) -> UIImage{
        UIGraphicsBeginImageContext(self.size)
        color.setFill()
        let bounds = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIRectFill(bounds)
        self.draw(in: bounds, blendMode: CGBlendMode.destinationIn, alpha: 1.0)
        
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
}

