    //
    //  StringSizeManager.swift
    //  OPTC
    //
    //  Created by fmkj on 2018/12/3.
    //  Copyright © 2018 fmkj. All rights reserved.
    //
    
    import UIKit
    
    extension String {
        //根据宽度设置字符串的高度
        func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
            let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
            let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
            
            return boundingBox.height
        }
        func widthWithConstrainedheight(width: CGFloat, font: UIFont) -> CGFloat {
            let constraintRect = CGSize(width:  .greatestFiniteMagnitude, height: width)
            let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
            
            return boundingBox.width
        }

        var localized: String {
            return localized(withComment: "")
        }
        
        func localized(withComment:String) -> String {
            return  NSLocalizedString(self, comment: withComment)
        }
        
        
    }
    extension NSAttributedString {
        //根据kk宽度设置字符串的高度
        func heightWithConstrainedWidth(width: CGFloat) -> CGFloat {
            let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
            
            return boundingBox.height
        }
        //根据kk高度设置字符串的宽度
        
        func widthWithConstrainedHeight(height: CGFloat) -> CGFloat {
            let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
            
            return boundingBox.width
        }
    }
