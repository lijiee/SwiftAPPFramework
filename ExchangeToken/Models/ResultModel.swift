//
//  ResultModel.swift
//  OPTC
//
//  Created by fmkj on 2018/12/19.
//  Copyright © 2018 fmkj. All rights reserved.
//

import UIKit
import ObjectMapper
import Result
import Moya
import RxSwift
class ResultModel: BaseModel  {
    var code : String?
    var message : String?
    
    
    override func mapping(map: Map) {
        code <- map["code"]
        message <- map["description"]
        
    }
}
class SubResultModel: ResultModel {
    var detail : String?
    override func mapping(map: Map) {
        code <- map["code"]
        message <- map["description"]
        detail <- map["detail"]
    }
}
enum RestError: Error, LocalizedError {
    
    case `default`(ResultModel)
    
    var errorDescription: String? {
        switch self {
        case .default(let result):
            return result.message
        }
    }
}

extension ResultModel {
    func validate<S: ResultModel>() throws -> S {
        if code == "200" {
            return self as! S
        } else {
            
            throw RestError.default(self)
            
            
        }
    }
}

extension Observable where E: ResultModel {
    func validate() -> Observable<E> {
        return flatMap({ Observable.just(try $0.validate()) })
    }
    
    func showToastWhenFailured(`in` view: UIView? = UIApplication.shared.keyWindow) -> Observable<E> {
        return self.do(onError: { (error) in
            ToastHander.showToastWithContentOnly(content: error.localizedDescription)
        })
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, ElementType: ResultModel {
    func validate() -> Single<ElementType> {
        return flatMap({ Single.just(try $0.validate()) })
    }
    
    func showToastWhenFailured(`in` view: UIView? = UIApplication.shared.keyWindow) -> Single<ElementType> {
        return self.do(onError: { (error) in
            if error._code != 6 {//自己取消的不提示
                ToastHander.showToastWithContentOnly(content: error.localizedDescription)
            }
        })
    }
}

protocol RestIndicatorDiming {
    var needDisplay: Bool { get }
}


final class ObjectWrapper<T: Mappable>: ResultModel {
    
    var detail: T?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        detail <- map["detail"]
    }
}

final class ArrayWrapper<T: Mappable>: ResultModel {
    
    var detail: [T]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        detail <- map["detail"]
    }
    
}
