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
        case .systemNotice:
            return "/user/articleData/getList"
        case .mineNotice:
            return "/user/messages"
        case .readMessage:
            return "/user/edit/message"
        case .getMyIncom:
            return "/user/yield/partnerMoney"
        case .getMyIncomList:
            return "/user/yield/getGroupList"
        case .getIncomeList:
            return "/user/yield/yieldListSteward"
        case .getIncomeListMarst:
            return "/user/yield/yieldList"
        case .getMyCanyList:
            return "/user/member/sweetList"
        case .getMyRecordList:
            return "/user/member/freeds"
        case .getMyCanyDetail:
            return "/user/wallet/getByUserIds"

        case .getAddress:
            return "/user/mank/addMan"
        case .getExchange:
            return "/user/Swap/swapList"
        case .getMyTeam:
            return "/user/member/v2/partners"
        case .setTradePassword:
            return "/user/member/getTrPwd"
        case .setLoginPassword:
            return "/user/member/findPwd"
        case .getPrivate:
            return "/user/member/getByIdPre"
        case .getSuperNote:
            return "/user/wallet/getByUserId"
        case .getSuperList:
            return "/user/candy/getCandyList"
        case .getByWalletId:
            return "/user/wallet/getByWalletId"
        case .getCoinPrice:
            return "/sendStart/coinPrice"
        case .getWalletList:
            return "/user/wallet/getList"
        case .getOpenDog:
            return "/user/wallet/startDog"
        case .getCloseDog:
            return "/user/wallet/stopDogAll"
        case .getDogList:
            return "/user/dog/memberDogList"
        case .getSign:
            return "/user/member/userSign"
        case .addDogMoney:
            return "/user/wallet/addMoney"
        case .getChart:
            return "/user/wallet/brokenChart"
        case .getWalletDetail:
            return "/user/wallet/getById"
        case .getValidateTo:
            return "/user/send/gt/ajax-validateTo"
        case .getOutWallet:
            return "/user/mention/putMoney"
        case .getPoundage:
            return "/user/mention/memtionFee"
        case .getAddressList:
            return "/user/mank/getManList"
        case .getSwapConver:
            return "/user/Swap/converOne"
        case .postExchange:
            return "/user/Swap/conversion"
        case .postTranfer:
            return "/user/mention/to/transfer"
        case .getTranferList:
            return "/user/mention/transfers"
        case .getAkaCardInfo:
            return "/user/member/cardInfo"
        case .postAkaCard:
            return "/user/member/addCard"
        case .postCardID:
            return "/user/member/upload"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMineInfo,.systemNotice,.mineNotice,.readMessage,.getMyIncom,.getMyIncomList,.getIncomeList,.getIncomeListMarst,.getMyCanyList,.getMyRecordList,.getMyCanyDetail,.getAddress,.getExchange,.getMyTeam,.setTradePassword,.setLoginPassword,.getPrivate,.getSuperNote,.getSuperList,.getByWalletId,.getCoinPrice,.getWalletList,.getCloseDog,.getOpenDog,.getDogList,.getSign,.addDogMoney,.getChart,.getWalletDetail,.getValidateTo,.getOutWallet,.getPoundage,.getAddressList,.getSwapConver,.postExchange,.postTranfer,.getTranferList,.getAkaCardInfo,.postAkaCard,.postCardID:
            return .post
        }
    }
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    
    var task: Task {
        switch self {
    case .getMineInfo,.getMyIncom,.getMyIncomList,.getMyCanyList,.getMyRecordList,.getCoinPrice,.getWalletList,.getSign,.getAkaCardInfo:
            return .requestData(ValidateManager.jsonToData(jsonDic: self.addLanguage(param: [:]))!)
        case .systemNotice(let param),.mineNotice(let param),.readMessage(let param),.getIncomeListMarst(let param),.getIncomeList(let param),.getMyCanyDetail(let param),.getAddress(let param),.getExchange(let param),.getMyTeam(let param),.setTradePassword(let param),.setLoginPassword(let param),.getPrivate(let param),.getSuperList(let param),.getSuperNote(let param),.getByWalletId(let param),.getCloseDog(let param),.getOpenDog(let param),.getDogList(let param),.addDogMoney(let param),.getChart(let param),.getWalletDetail(let param),.getValidateTo(let param),.getOutWallet(let param),.getPoundage(let param),.getAddressList(let param),.getSwapConver(let param),.postExchange(let param),.postTranfer(let param),.getTranferList(let param),.postAkaCard(let param):
            return .requestData(ValidateManager.jsonToData(jsonDic: self.addLanguage(param: param))!)
        case .postCardID(let name, let file,let file1Data):
        let formData = MultipartFormData(provider: .data(file1Data), name: name,fileName: file, mimeType: "image/png")
        return .uploadCompositeMultipart([formData], urlParameters: self.addLanguage(param: ["file":file1Data]))
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


