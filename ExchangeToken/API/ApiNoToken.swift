
//
//  ApiNoToken.swift
//  OPTC
//
//  Created by fmkj on 2018/12/21.
//  Copyright © 2018 fmkj. All rights reserved.
//

import Foundation
import Moya

extension ApiNoToken : TargetType  {
    
    var baseURL: URL {
        return URL.init(string: BaseUrl)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/user/login/loginHz"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login :
            return .post
    }
    }
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    
    var task: Task {
        switch self {
        case .login(let param) :
            return .requestData(ValidateManager.jsonToData(jsonDic: self.addLanguage(param: param))!)
            

    }
    }
    func addLanguage(param : Dictionary<String , Any>) -> Dictionary<String, Any> {
        var dictionary = param
        dictionary["language"] = UserDefaults.standard.integer(forKey: LanguageKey)
        return dictionary
    }
    var headers: [String : String]? {
        return [
            "Content-Type":"application/json",
        ];
        
    }
}

