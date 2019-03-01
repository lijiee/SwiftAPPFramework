//
//  BaseModel.swift
//  OPTC
//
//  Created by fmkj on 2018/12/20.
//  Copyright © 2018 fmkj. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseModel: NSObject ,Mappable {
    required override init() {}
    required init?(map: Map) {
        super.init()
    }
    func mapping(map: Map) {
        
    }
    
    
}
