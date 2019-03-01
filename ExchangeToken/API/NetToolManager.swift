//
//  NetToolManager.swift
//  OPTC
//
//  Created by fmkj on 2018/12/1.
//  Copyright © 2018 fmkj. All rights reserved.
//

import Foundation
import Moya
//不需要添加Token
let provider = MoyaProvider<ApiNoToken>(requestClosure: requestClosure,plugins: [myNetworkPlugin])
//需要添加Token
let providerToken = MoyaProvider<API>(requestClosure: requestClosure,plugins: [myNetworkPlugin])

let providerTokenNo = MoyaProvider<API>(requestClosure: requestClosure,plugins: [])
