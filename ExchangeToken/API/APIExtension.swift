//
//  MoyaApi.swift
//  OPTC
//
//  Created by fmkj on 2018/12/10.
//  Copyright © 2018 fmkj. All rights reserved.
//

import Foundation
import Moya
import Result

extension API : TargetType  {
    var baseURL: URL {
        return URL.init(string: BaseUrl)!
    }
    
    var path: String {
        switch self {
        case .getMineInfo:
            return "/user/member/info"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMineInfo:
            return .post
        }
    }
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    
    var task: Task {
        switch self {
    case .getMineInfo:
            return .requestData(ValidateManager.jsonToData(jsonDic: self.addLanguage(param: param))!)
        }
    }
    func addLanguage(param : Dictionary<String , Any>) -> Dictionary<String, Any> {
        var dictionary = param
        dictionary["language"] = UserDefaults.standard.integer(forKey: LanguageKey)
        dictionary["token"] = UserDefaults.standard.string(forKey: "mytoken")
        dictionary["sessionId"] = UserDefaults.standard.string(forKey: "mysessionId")
        return dictionary
    }
    
    var headers: [String : String]? {
        
        let params = [
            "Content-Type":"application/json",
        ];
        return params
        
    }
}
// MARK: - 设置请求超时时间
let requestClosure = { (endpoint: Endpoint, done: @escaping MoyaProvider<API>.RequestResultClosure) in
    do {
        var request: URLRequest = try endpoint.urlRequest()
        request.timeoutInterval = 60    //设置请求超时时间
        done(.success(request))
    } catch  {
        print("错误了 \(error)")
    }
}
let myNetworkPlugin = NetworkActivityPlugin { (state,target) in
    if state == .began {
        //        SwiftSpinner.show("Connecting...")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        ToastHander.showNetLoading()
    } else {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        ToastHander.hideActivityToast()
    }
}


