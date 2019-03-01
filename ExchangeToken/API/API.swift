//
//  API.swift
//  OPTC
//
//  Created by fmkj on 2018/12/1.
//  Copyright © 2018 fmkj. All rights reserved.
//

import Foundation
import Moya

enum API {
    //我的模块
    case getMineInfo() //获取我的信息
    

}

enum ApiNoToken {
    //登录注册模块
    case login(param:[String : Any])//登录
    
}
