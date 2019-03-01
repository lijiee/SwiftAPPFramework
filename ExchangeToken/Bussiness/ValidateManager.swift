
//
//  ValidateManager.swift
//  OPTC
//
//  Created by fmkj on 2018/12/3.
//  Copyright © 2018 fmkj. All rights reserved.
//

import UIKit
typealias InputClosureType = (Int) -> Void   //定义闭包类型（特定的函数类型函数类型）

class ValidateManager: NSObject {
   static func stringToForFloatOrInt(string : String) -> String {
        
        let floatString = string.float() ?? 0
//    if floatString > Int.max.float {
//        return  ValidateManager.quxiaoshudianhoudeling(testNumber: String(format:"%.6f",floor((floatString)*100)/100))
//
//    }
//        let intString = Int(string.float() ?? 0)
//        if floatString == intString.float{
//            return "\(intString)"
//
//        }else{
            return  ValidateManager.quxiaoshudianhoudeling(testNumber: String(format:"%.6f",floatString))

//        }
    }
    static func FloatToString(float : Float) -> String {
//        if float > Int.max.float {
            return  ValidateManager.quxiaoshudianhoudeling(testNumber: String(format:"%.6f",float))
//        }
//
//        let intFloat = Int(float)
//        if float == intFloat.float{
//            return "\(intFloat)"
//        }else{
//            return ValidateManager.quxiaoshudianhoudeling(testNumber: String(format:"%.6f",float))
//
//        }
    }
    static func FloatToStringPe(string : String) -> String {
        let floatString = string.float()!*100
//        if floatString > Int.max.float {
//         return String(format:"%.2f",floatString
//        }
////        let intString = Int(string.float()!*100 )
//        var str = ""
////        if floatString == intString.float{
////            str = "\(intString)"
////        }else{
//            str = ValidateManager.quxiaoshudianhoudeling(testNumber: String(format:"%.2f",floatString))
////        }
        return String(format:"%.2f",floatString)
    }
    static func ToStringPe(float : Float) -> String {
//        if float > Int.max.float {
//            return ValidateManager.quxiaoshudianhoudeling(testNumber: String(format:"%.6f",float))
//        }
//        let intString = Int(float)
//        var str = ""
//        if float == intString.float{
//            str = "\(intString)"
//        }else{
//            str = ValidateManager.quxiaoshudianhoudeling(testNumber: String(format:"%.6f",float))
//        }
        return ValidateManager.quxiaoshudianhoudeling(testNumber: String(format:"%.6f",float))
    }

    static func quxiaoshudianhoudeling(testNumber:String) -> String{
        var outNumber = testNumber
        var i = 1
        if testNumber.contains("."){
            while i < testNumber.count{
                if outNumber.hasSuffix("0"){
                    outNumber.remove(at: outNumber.index(before: outNumber.endIndex))
                    i = i + 1
                }else{
                    break
                }
            }
            if outNumber.hasSuffix("."){
                outNumber.remove(at: outNumber.index(before: outNumber.endIndex))
            }
            return outNumber
        }
        else{
            return testNumber
        }
    }

    static func checkEmailOrPhone(content : String) -> Bool {
        if content.contains("@") {
            return validateEmail(email: content)
        }else{
            return isPhoneNumber(phoneNumber:content)
        }
    }
    
    
    //验证邮箱
    static func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if emailTest.evaluate(with: email) == true {
            return true
        }else{
            ToastHander .showToastWithContentOnly(content: "请输入正确的邮箱".localized)
            return false
        }
    }
    static func checkNameOrEmail(content:String ,emClosure:@escaping InputClosureType,phone:@escaping InputClosureType)->Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        

        if emailTest.evaluate(with: content) == true {
            emClosure(0)
            return true
        }else if content.count > 0{
            phone(1)
            return true

        }else{
            ToastHander .showToastWithContentOnly(content: "请输入正确的邮箱或手机号".localized)
            return false

        }
    }
    static func checkNameOrEmailForKF(content:String ,emClosure:@escaping InputClosureType,phone:@escaping InputClosureType)->Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        let mobile = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        
        if emailTest.evaluate(with: content) == true {
            emClosure(0)
            return true
        }else if (regexMobile.evaluate(with: content) == true){
            phone(1)
            return true
            
        }else{
            return false
            
        }
    }

    
    //验证手机号
    static func isPhoneNumber(phoneNumber:String) -> Bool {
        if phoneNumber.count > 0 {
            return true
        }else
        {            ToastHander .showToastWithContentOnly(content: "请输入正确的手机号".localized)
            
            return false
        }
    }
    static func isUserNameRuler(password:String) -> Bool {
        if password.count > 0{
            return true
        }else
        {            ToastHander .showToastWithContentOnly(content: "请输入用户名".localized)
            
            return false
        }
    }
    static func isUserName(password:String) -> Bool {
        if password.count > 0{
            return true
        }else
        {            ToastHander .showToastWithContentOnly(content: "请输入对方用户名/账号".localized)
            
            return false
        }
    }
    static func isPrivteUserName(password:String) -> Bool {
        if password.count > 0{
            return true
        }else
        {            ToastHander .showToastWithContentOnly(content: "请先输入私钥".localized)
            
            return false
        }
    }
    static func isSelectType(password:String) -> Bool {
        if password.count > 0{
            return true
        }else
        {            ToastHander .showToastWithContentOnly(content: "请先选择密码类型".localized)
            
            return false
        }
    }

    static func isSelectCurrency(currency : String) -> Bool {
        
        
        if currency.count > 0{
            return true
        }else
        {            ToastHander .showToastWithContentOnly(content: "请先选择币种".localized)
            
            return false
        }

        
    }

    static func isAddress(password:String) -> Bool {
        if password.count > 0{
            return true
        }else
        {            ToastHander .showToastWithContentOnly(content: "请输入地址".localized)
            
            return false
        }
    }
    static func isName(name : String) -> Bool{
        if name.count > 0{
            return true
        }else{
            ToastHander.showToastWithContentOnly(content: "请输入姓名".localized)
            return false
        }
    }
    static func isTag(password:String) -> Bool {
        if password.count > 0{
            return true
        }else
        {            ToastHander .showToastWithContentOnly(content: "请输入标签".localized)
            
            return false
        }
    }
    
    
    
    
    
    //密码正则  6-8位字母和数字组合
    static func isPasswordRuler(password:String) -> Bool {
        let passwordRegex = "^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}"
        let passwordTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if passwordTest.evaluate(with: password) == true {
            return true
        }else{
            ToastHander .showToastWithContentOnly(content: "密码不是8-16位的数字和字母".localized)
            return false
        }
    }
    static func isOriginalPasswordRuler(password:String) -> Bool {
        let passwordRegex = "^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}"
        let passwordTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if passwordTest.evaluate(with: password) == true {
            return true
        }else{
            ToastHander .showToastWithContentOnly(content: "请输入原密码".localized)
            return false
        }
    }

    static func isTradePasswordRuler(password:String) -> Bool {
        let passwordRegex = "^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}"
        let passwordTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if passwordTest.evaluate(with: password) == true {
            return true
        }else{
            ToastHander .showToastWithContentOnly(content: "交易密码不是8-16位的数字和字母".localized)
            return false
        }
    }

    static func isPasswordEqual(password:String,newpassword:String) -> Bool {
        if password == newpassword {
            return true
        }else
        {            ToastHander .showToastWithContentOnly(content: "两次密码输入不一致".localized)
            
            return false
        }
    }
    static func isPasswordEqualTradePssword(password:String,newpassword:String) -> Bool {
        if password == newpassword {
            ToastHander .showToastWithContentOnly(content: "登录密码和交易密码不能相同".localized)
            return false
        }else
        {
            
            return true
        }
    }

    static func isCodeRuler(password:String) -> Bool {
        if password.count == 6 {
            return true
        }else
        {            ToastHander .showToastWithContentOnly(content: "验证码输入不正确".localized)
            
            return false
        }
    }
    static func isIntviateCodeRuler(password:String) -> Bool {
        let emailRegex = "^[0-9]+$"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if emailTest.evaluate(with: password) == true {
            return true
        }else{
            ToastHander .showToastWithContentOnly(content: "请输入正确的邀请码".localized)
            return false
        }
        
    }
    static func isFriendCodeRuler(password:String) -> Bool {
        if password.count > 0 {
            return true
        }else{
            ToastHander .showToastWithContentOnly(content: "请输入好友账户".localized)
            return false
        }
        
    }

    static func isValidateNumber(numberStr: String) -> Bool {
        let scan: Scanner = Scanner(string: numberStr)
        
        var val:Float = 0
        if numberStr.float() == 0 {
            ToastHander .showToastWithContentOnly(content: "请输入正确的金额".localized)
            return false

        }
        if scan.scanFloat(&val) && scan.isAtEnd {
            return true

        }else{
            ToastHander .showToastWithContentOnly(content: "请输入正确的金额".localized)
            return false

        }
            
    }
    
    
    static func areaCodeAt(code: String) -> Bool {
        var dic: [String: String] = [:]
        dic["11"] = "北京"
        dic["12"] = "天津"
        dic["13"] = "河北"
        dic["14"] = "山西"
        dic["15"] = "内蒙古"
        dic["21"] = "辽宁"
        dic["22"] = "吉林"
        dic["23"] = "黑龙江"
        dic["31"] = "上海"
        dic["32"] = "江苏"
        dic["33"] = "浙江"
        dic["34"] = "安徽"
        dic["35"] = "福建"
        dic["36"] = "江西"
        dic["37"] = "山东"
        dic["41"] = "河南"
        dic["42"] = "湖北"
        dic["43"] = "湖南"
        dic["44"] = "广东"
        dic["45"] = "广西"
        dic["46"] = "海南"
        dic["50"] = "重庆"
        dic["51"] = "四川"
        dic["52"] = "贵州"
        dic["53"] = "云南"
        dic["54"] = "西藏"
        dic["61"] = "陕西"
        dic["62"] = "甘肃"
        dic["63"] = "青海"
        dic["64"] = "宁夏"
        dic["65"] = "新疆"
        dic["71"] = "台湾"
        dic["81"] = "香港"
        dic["82"] = "澳门"
        dic["91"] = "国外"
        if (dic[code] == nil) {
            return false;
        }
        return true;
    }
    //验证身份证号
    static func checkIsIdentityCard(_ identityCard: String) -> Bool {
        //判断是否为空
        if identityCard.count <= 0 {
            return false
        }
        //判断是否是18位，末尾是否是x
        let regex2: String = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let identityCardPredicate = NSPredicate(format: "SELF MATCHES %@", regex2)
        if !identityCardPredicate.evaluate(with: identityCard) {
            return false
        }
        //判断生日是否合法
        let range = NSRange(location: 6, length: 8)
        let datestr: String = (identityCard as NSString).substring(with: range)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        if formatter.date(from: datestr) == nil {
            return false
        }
        //判断校验位
        if  identityCard.count == 18 {
            let idCardWi: [String] = ["7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2"]
            //将前17位加权因子保存在数组里
            let idCardY: [String] = ["1", "0", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            var idCardWiSum: Int = 0
            //用来保存前17位各自乖以加权因子后的总和
            for i in 0..<17 {
                idCardWiSum += Int((identityCard as NSString).substring(with: NSRange(location: i, length: 1)))! * Int(idCardWi[i])!
            }
            let idCardMod: Int = idCardWiSum % 11
            //计算出校验码所在数组的位置
            
            
            let index = identityCard.index(identityCard.startIndex, offsetBy: 2)
            
            let idCardLast: String = String(identityCard.prefix(upTo: index))
            
            if ValidateManager.areaCodeAt(code: String(idCardLast)) == false{
                
                return false
            }

            //得到最后一位身份证号码
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if idCardMod == 2 {
                if identityCard.last == "X" ||  identityCard.last == "x" {
                    return true
                } else {
                    return false
                }
            } else {
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if (idCardLast as NSString).integerValue == Int(idCardY[idCardMod]) {
                    return true
                } else {
                    return false
                }
            }
        }
        return false
    }
    
    
   static func add(leftS:String, rightS:String) -> String{
        var left = leftS
        var right = rightS
        for _ in 0..<left.count{
            if left.hasPrefix("0") && !left.hasPrefix("0."){
                left.remove(at: left.startIndex)
            }else{
                break
            }
        }
        for _ in 0..<right.count{
            if right.hasPrefix("0") && !right.hasPrefix("0."){
                right.remove(at: right.startIndex)
            }else{
                break
            }
        }
        var resultstr = String()
        
        var leftstr = [String]()
        var rightstr = [String]()
        //将数字分割成小数部分以及整数部分
        //Separated the number into decimal part and integer part
        if left.contains("."){
            leftstr = left.components(separatedBy: ".")
        }else{
            leftstr = [left]
        }
        if right.contains("."){
            rightstr = right.components(separatedBy: ".")
        }else{
            rightstr = [right]
        }
        //处理小数部分    Deal the decimal number.
        //小数状态0代表左右都有小数部分，1代表左边有小数右边没，2代表右边有小数左边没，3代表两边都没有小数
        /**
         *  0:Either left number and right number both have the decimal part
         *  1:Only left number has the decimal part
         *  2:Only right number has the decimal part
         *  3:Both sides do not have the decimal part.
         */
        let decimalStatu = leftstr.count == 2 && rightstr.count == 2 ? 0 : (leftstr.count == 1 && rightstr.count == 1 ? 3 : leftstr.count == 2 && rightstr.count != 2 ? 1 : 2)
        var decimalCanPlus1 = false//The value show the decimal part will full to integer part.一个显示小数位相加后是否可以使整数加1的状态值
        switch decimalStatu {
        case 0:
            resultstr.append(contentsOf: ".")
            let leftIsLonger = leftstr[1] > rightstr[1]
            var pstrlong = [Int]()
            var pstrshort = [Int]()
            for char in (leftIsLonger ? leftstr[1] : rightstr[1]){
                pstrlong.insert(Int(String(char))!, at: 0)
            }
            for char in (!leftIsLonger ? leftstr[1] : rightstr[1]){
                pstrshort.insert(Int(String(char))!, at: 0)
            }
            for index in pstrshort.count..<pstrlong.count{
                resultstr.insert(Character(String(pstrlong[index])), at: resultstr.index(resultstr.startIndex, offsetBy: -1))
            }
            for index in 0..<pstrshort.count{
                //如果小数可以进位，则末位加1.只加一次
                //If decimal part can full to integer part,integer last number plus 1,only plus once.
                var curResult = pstrlong[index] + pstrshort[index] + (decimalCanPlus1 ? 1 : 0)
                if curResult >= 10{
                    curResult -= 10
                    decimalCanPlus1 = true
                }else{
                    decimalCanPlus1 = false
                }
                resultstr.insert(Character(String(pstrlong[index])), at: resultstr.index(resultstr.startIndex, offsetBy: -1))
            }
            
        case 1:
            resultstr.append(contentsOf: ".")
            for curNum in leftstr[1]{
                resultstr.append(curNum)
            }
        case 2:
            resultstr.append(contentsOf: ".")
            for curNum in rightstr[1]{
                resultstr.append(curNum)
            }
        case 3:
            break
        default:
            fatalError("decimalStatu can not detect two numbers statu")
        }
        //处理整数部分    Deal with the integer part
        var leftarray = [Int]()
        for char in leftstr[0]{
            leftarray.insert(Int(String(char))!, at: 0)
        }
        var rightarray = [Int]()
        for char in rightstr[0]{
            rightarray.insert(Int(String(char))!, at: 0)
        }
        //较短数的数位
        //The shorter number's count
        let minCount = leftarray.count>rightarray.count ? rightarray.count : leftarray.count
        //数字相加后是否会进十的状态值
        //After plusing , if the result greater than 10,this value turns true.
        var isGreaterThanTen = false
        for index in 0..<minCount{
            var curResult = leftarray[index] + rightarray[index] + (isGreaterThanTen ? 1 : 0) + (decimalCanPlus1 ? 1 : 0)
            isGreaterThanTen = curResult >= 10
            decimalCanPlus1 = false
            if isGreaterThanTen{curResult -= 10}
            resultstr.insert(Character(String(curResult)), at: resultstr.startIndex)
        }
        //指定较长的数，来完成短数位后的运算
        //Continue calculate the value after finished the shortnumber dealing.
        let longArray = leftarray.count>rightarray.count ? leftarray : rightarray
        for index in minCount..<(longArray.count){
            var curResult = longArray[index]
            if isGreaterThanTen{
                curResult += 1
                isGreaterThanTen = curResult >= 10
                if isGreaterThanTen{
                    curResult -= 10
                }
            }
            resultstr.insert(Character(String(curResult)), at: resultstr.startIndex)
        }
        //如果计算完毕后，仍会进十，则在首位加1
        //if finished all the calculates,the result still can carrybit,then add 1 to the first position.
        if isGreaterThanTen{
            resultstr.insert("1", at: resultstr.startIndex)
        }
        return resultstr
    }
    //大数乘法，需要调用到大数加法，若使用请把大数加法同时复制过去
   static func mul(leftstr:String, rightstr:String) -> String{
    
        var left = leftstr
        var right = rightstr
    
        for _ in 0..<left.count{
            if left.hasPrefix("0") && !left.hasPrefix("0."){
                left.remove(at: left.startIndex)
            }else{
                break
            }
        }
        for _ in 0..<right.count{
            if right.hasPrefix("0") && !right.hasPrefix("0."){
                right.remove(at:right.startIndex)
            }else{
                break
            }
        }
        
        
        var resultstr = String()
        //获取小数位数
        //get how many number of the decimal part.
        var leftCount = 0
        var rightCount = 0
        if let leftIndex = left.firstIndex(of: ".")?.encodedOffset{
            leftCount = leftIndex.distance(to: left.endIndex.encodedOffset) - 1
        }
        if let rightIndex = right.firstIndex(of:".")?.encodedOffset{
            rightCount = rightIndex.distance(to: right.endIndex.encodedOffset) - 1
        }
        let pCount = leftCount + rightCount
        //移除小数点并添加到数组
        //remove the point(.) and add the number to array
        let leftStr = left.replacingOccurrences(of: ".", with: "")
        let rightStr = right.replacingOccurrences(of: ".", with: "")
        var longArray = [Int]()
        var shortArray = [Int]()
        let resultArray = NSMutableArray()
        for char in (leftStr.count >= right.count ? leftStr : rightStr){
            if Int(String(char)) == nil{
                return "0"
            }
            longArray.insert(Int(String(char))!, at: 0)
        }
        for char in (leftStr.count < right.count ? leftStr : rightStr){
            if Int(String(char)) == nil{
                return "0"
            }

            shortArray.insert(Int(String(char))!, at: 0)
        }
        //进行逐位乘法运算
        //multiply number one by one.Like 1,234 * 12 = 1,234 * 1 * 10 + 1,234 * 2
        for shortIndex in 0..<shortArray.count{
            var tempCarry = 0
            var tempArray = [Int]()
            var tempStr = ""
            //每位运算都在最后一位添加0
            //Add 0 to last position when calculating.Like 1,234 * 1 * 10 = 12,340 * 1
            for _ in 0..<shortIndex{
                tempArray.append(0)
                tempStr.insert(Character("0"), at: tempStr.startIndex)
            }
            for longIndex in 0..<longArray.count{
                var curResult = shortArray[shortIndex] * longArray[longIndex] + tempCarry
                tempCarry = curResult/10
                curResult = curResult%10
                tempArray.append(curResult)
                tempStr.insert(Character("\(curResult)"), at: tempStr.startIndex)
            }
            if tempCarry != 0{
                tempArray.append(tempCarry)
                tempStr.insert(Character("\(tempCarry)"), at: tempStr.startIndex)
            }
            resultArray.add(tempStr)
        }
        //将乘法之后的结果相加起来
        //Add all the multiply result
        resultstr = resultArray[0] as! String
        for index in 1..<resultArray.count{
            resultstr = ValidateManager.add(leftS: resultstr, rightS: (resultArray[index] as! String))
        }
    
        if pCount != 0{
            if pCount>resultstr.count{
                for _ in 0...(pCount - resultstr.count){
                resultstr.insert("0", at: resultstr.startIndex)
                }
            }
            
            resultstr.insert(".", at: resultstr.index(resultstr.endIndex, offsetBy: -pCount))
        }
        for _ in resultstr{
            if resultstr.hasPrefix("0") && resultstr.count != 1{
                resultstr = String(resultstr.suffix(from: resultstr.index(resultstr.startIndex, offsetBy: 1)))
            }else{
                break
            }
        }
        if resultstr.hasPrefix("."){
            resultstr.insert("0", at: resultstr.startIndex)
        }
    if resultstr.count - (resultstr.firstIndex(of: ".")?.encodedOffset ?? 0) > 3 {
        let index = resultstr.index(resultstr.firstIndex(of: ".")!, offsetBy: 3)

        return String(resultstr.prefix(upTo: index))
    }
    return resultstr

    }
    static func jsonToDictionary(jsonString:String) -> Dictionary<String, Any> {
        if (jsonString == "") {
            print("is not a valid json object")
            return [:]
        }
        //利用自带的json库转换成Data
        let data = jsonString.data(using: String.Encoding.utf8)
        let dict = try? JSONSerialization.jsonObject(with: data ?? Data.init(), options: .mutableContainers)
        //Data转换成String打印输出
        //输出json字符串
        
        if dict != nil {
            print("Json Str:\(dict ?? [:])")

            return dict as! Dictionary<String, Any>
        }
        return [:]
    }
    static func jsonToData(jsonDic:Dictionary<String, Any>) -> Data? {
        if (!JSONSerialization.isValidJSONObject(jsonDic)) {
            print("is not a valid json object")
            return nil
        }
        //利用自带的json库转换成Data
        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
        let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
        //Data转换成String打印输出
        let str = String(data:data!, encoding: String.Encoding.utf8)
        //输出json字符串
        print("Json Str:\(str ?? "")")
        return data
    }
    
    static func jsonToString(jsonDic:Dictionary<String, Any>) -> String? {
        if (!JSONSerialization.isValidJSONObject(jsonDic)) {
            print("is not a valid json object")
            return nil
        }
        //利用自带的json库转换成Data
        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
        let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
        //Data转换成String打印输出
        let str = String(data:data!, encoding: String.Encoding.utf8)
        //输出json字符串
        print("Json Str:\(str ?? "")")
        return str
    }
    


}
