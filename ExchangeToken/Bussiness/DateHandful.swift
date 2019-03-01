
//
//  NDate+Handful_lj.swift
//  OPTC
//
//  Created by fmkj on 2018/12/5."yyyy-MM-dd HH:mm:ss"
//  Copyright © 2018 fmkj. All rights reserved.
//

import UIKit
import SwiftDate

class DateHandful: NSObject {
    enum DateStringType {
        case LJDateFormat_yMd ,LJDateFormat_yyMd ,LJDateFormat_yMdHm ,LJDateFormat_yMdHms ,LJDateFormat_Md_gang ,LJDateFormat_Md_zh ,LJDateFormat_yMd_gang ,LJDateFormat_yyMd_gang ,LJDateFormat_zh_MdHm ,LJDateFormat_yMdP
        
    }
    static func getDateString(dateType : DateStringType) -> String {
        switch dateType {
        case .LJDateFormat_yMd:
            return "yyyy-MM-dd"
        case .LJDateFormat_yyMd:
            return "yy-MM-dd"
            
        case .LJDateFormat_yMdHm:
            return "yyyy-MM-dd HH:mm"
            
        case .LJDateFormat_yMdHms:
            return "yyyy-MM-dd HH:mm:ss"
            
        case .LJDateFormat_Md_gang:
            return "MM/dd"
            
        case .LJDateFormat_Md_zh:
            return "MM月dd日"
            
        case .LJDateFormat_yMd_gang:
            return "yyyy/MM/dd"
            
        case .LJDateFormat_yyMd_gang:
            return "yy/MM/dd"
            
        case .LJDateFormat_zh_MdHm:
            return "MM月dd日 HH:mm"
        case .LJDateFormat_yMdP:
            return "yyyy.MM.dd"
        }
        
    }
    //日期格式化输出
    static func dateForString(dateStringType : DateStringType , date : Date? , isNeed : Bool) -> String {
        if isNeed {
            return date?.convertTo(region: Region(calendar: Calendar.autoupdatingCurrent,
                                                  zone: Zones.asiaShanghai,
                                                  locale: Locale.autoupdatingCurrent)).toFormat(getDateString(dateType: dateStringType)) ?? ""
        }
        
        return date?.toFormat(getDateString(dateType: dateStringType)) ?? ""
    }
    
    //MARK: -时间戳转时间函数
    func timeStampToString(timeStamp: Double)->String {
        //时间戳为毫秒级要 ／ 1000， 秒就不用除1000，参数带没带000
        let timeSta:TimeInterval = TimeInterval(timeStamp / 1000)
        let date = NSDate(timeIntervalSince1970: timeSta)
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy-MM-dd"
        return dfmatter.string(from: date as Date)
    }
    //MARK: -时间转时间戳函数
    func timeToTimeStamp(time: String) -> Double {
        let dfmatter = DateFormatter()
        //yyyy-MM-dd HH:mm:ss
        dfmatter.dateFormat="yyyy年MM月dd日 HH:mm:ss"
        let last = dfmatter.date(from: time)
        let timeStamp = last?.timeIntervalSince1970
        return timeStamp!
    }
    
    
}
