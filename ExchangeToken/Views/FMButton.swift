//
//  FMButton.swift
//  Tocos
//
//  Created by luan on 2018/11/9.
//  Copyright © 2018 luan. All rights reserved.
//

import UIKit
import SwifterSwift
class FMButton: UIButton {

    var padding: CGFloat = 2.5 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = self.titleLabel?.text?.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                         right: -((titleSize?.width ?? 0) * 2 + padding))
        
    }
}

