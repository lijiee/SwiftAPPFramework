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
    case systemNotice(param:[String : Any]) //系统公告
    case mineNotice(param:[String : Any]) //我的消息
    case readMessage(param:[String : Any])//设置已读
    case getMyIncom()//获取我的收益
    case getMyIncomList()//获取我的收益列表arst
    case getIncomeList(param:[String : Any])//获取超级节点和管理奖励
    case getIncomeListMarst(param:[String : Any])//获取超级节点和管理奖励
    case getMyCanyList//获取我的糖果列表
    case getMyRecordList//获取我的收益记录列表
    case getMyCanyDetail(param:[String : Any])//获取糖果详情
    case getAddress(param : [String : Any])//获取添加地址
    case getExchange(param : [String : Any])//获取兑换记录
    case getMyTeam(param : [String : Any])//获取我的团队
    case setTradePassword(param : [String : Any])//设置交易密码
    case setLoginPassword(param : [String : Any])   //修改登录密码
    case getPrivate(param:[String : Any])//获取私钥
    case getSuperNote(param : [String : Any])//获取超级节点
    case getSuperList(param:[String : Any])//获取超级节点列表
    case getByWalletId(param:[String : Any])//获取钱包id
    case getCoinPrice //获取行情
    case getWalletList//获取钱包列表
    case getOpenDog(param : [String : Any])//开启智慧小蚂蚁
    case getCloseDog(param : [String : Any])//关闭智慧小蚂蚁
    case getDogList(param : [String : Any])//获取智慧小蚂蚁列表
    case addDogMoney(param : [String : Any])//添加金额
    case getSign //签到
    case getChart(param : [String : Any])//获取曲线图
    case getWalletDetail(param : [String : Any])//获取转入详情
    case getValidateTo(param : [String : Any])//获取极验
    case getOutWallet(param : [String : Any])//转出
    case getPoundage(param:[String : Any])//获取手续费
    case getAddressList(param : [String : Any])//获取地址列表
    case getSwapConver(param : [String : Any])//获取兑换详情
    case postExchange(param : [String : Any])//提交兑换
    case postTranfer(param : [String : Any])//转账给好友
    case getTranferList(param : [String : Any])//转账列表
    case getAkaCardInfo//获取万事达卡信息
    case postAkaCard(param : [String : Any])//发送卡片信息
    case postCardID(name:String,file:String,file1Data:Data) //上传图片
    

}

enum ApiNoToken {
    //登录注册模块
    case login(param:[String : Any])//登录
    case noLoginGetCode(param:[String : Any])//获取验证码
    case registerMnmonic(param:[String : Any])//注册获取助记词
    case registerGetMnmonic(param:[String : Any])//获取错乱的助记词
    case register(param:[String : Any])//注册
    case forgetGetCode(param:[String : Any])//找回密码获取验证码
    case forgetPassWord(param : [String : Any])//找回密码
    case configs(param : [String : Any])//配置宏
    case getVersion//版本更新
    case banners //轮播图
    case configForArea //获取地区
    
}
