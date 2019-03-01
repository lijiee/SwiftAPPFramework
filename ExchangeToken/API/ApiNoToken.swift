
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
        case .noLoginGetCode:
            return "/user/send/gt/ajax-validateOutIn"

        case .registerMnmonic:
            return "/user/login/registerOneNew"
        case .registerGetMnmonic:
            return "/user/login/getCoinList"
        case .register:
            return "/user/login/registerNew"
        case .forgetGetCode:
            return "/user/send/gt/ajax-validate"
        case .forgetPassWord:
            return "/user/login/findPwd"
        case .configs:
            return "/sys/configs"
        case .getVersion:
            return "/sys/version"
        case .banners:
            return "/sys/banners"
        case .configForArea:
            return "/sys/areas"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login ,  .noLoginGetCode ,.registerMnmonic ,.registerGetMnmonic,.register,.forgetGetCode,.forgetPassWord,.configs,.banners:
            return .post
        case .getVersion:
            return .post
        case .configForArea:
            return .get
    }
    }
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    
    var task: Task {
        switch self {
        case .login(let param) , .noLoginGetCode(let param) ,.registerMnmonic(let param),.registerGetMnmonic(let param),.register(let param),.forgetGetCode(let param),.forgetPassWord(let param),.configs(let param):
            return .requestData(ValidateManager.jsonToData(jsonDic: self.addLanguage(param: param))!)
            
        case .banners:
            return .requestData(ValidateManager.jsonToData(jsonDic: self.addLanguage(param: [:]))!)
        case .getVersion:
            return .requestData(ValidateManager.jsonToData(jsonDic: self.addLanguage(param: ["type":"1"]))!)
        case .configForArea:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)

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

