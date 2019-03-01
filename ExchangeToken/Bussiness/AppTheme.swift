//
//  AppTheme.swift
//  OPTC
//
//  Created by fmkj on 2018/12/2.
//  Copyright © 2018 fmkj. All rights reserved.
//

import UIKit
import Alamofire
import SwifterSwift
class AppTheme: NSObject {
    static let shared = AppTheme()
    public var reachable: NetworkReachabilityManager?
    
    var themeColor : UIColor?
    var secondColor : UIColor?
    var disableColor : UIColor?
    
    func setUpColor(themeColor : UIColor,secondColor : UIColor,disableColor : UIColor) {
        self.themeColor = themeColor
        self.secondColor = secondColor
        self.disableColor = disableColor
        setupNavigationBarTintColor(navBarTintColor: themeColor, toolBarTintColor: secondColor)
        setupNetworkReachable()
        
    }
    func setupNavigationBarTintColor(navBarTintColor : UIColor ,toolBarTintColor : UIColor){
        
        //导航栏返回按钮颜色
        UINavigationBar.appearance().tintColor = secondColor
        //导航栏背景颜色
        UINavigationBar.appearance().barTintColor = themeColor
        //导航栏字体设置
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor :secondColor as Any, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: secondColor as Any], for: UIControl.State.normal)
        //设置tabber颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.init(hexString: "CCCCCC") as Any], for: .normal)
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor :secondColor as Any], for: .selected)
        
    }
    func setupNetworkReachable() {
        ///监视网络变化
        reachable = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
        let listener = { (status: NetworkReachabilityManager.NetworkReachabilityStatus) in
            var networkStatus = false
            switch status {
                
            case .notReachable:
                networkStatus = false
                
            case .unknown :
                networkStatus = false
                
            case .reachable(.ethernetOrWiFi):
                networkStatus = true
                
            case .reachable(.wwan):
                networkStatus = true
            }
            if networkStatus == false {
                ToastHander.showToastWithContentOnly(content: "没有网络".localized)
            }
        }
        reachable?.listener = listener
        reachable?.startListening()
    }
    
    // MARK: 销毁
    deinit {
        reachable?.stopListening()
    }
    
    
}
