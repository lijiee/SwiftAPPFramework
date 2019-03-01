//
//  LanguageManager.swift
//  Traber
//
//  Created by luan on 2017/4/29.
//  Copyright © 2017年 luan. All rights reserved.
//

import UIKit

let LanguageSaveKey = "ChooseLanguage"
let LanguageKey = "Language"

class LanguageManager: NSObject {
    
    class func setupCurrentLanguage() {
        var currentLanguage = UserDefaults.standard.object(forKey: LanguageSaveKey)
        if currentLanguage == nil {
            currentLanguage = "zh-Hans"
            UserDefaults.standard.set(currentLanguage, forKey: LanguageSaveKey)
            UserDefaults.standard.set("1", forKey: LanguageKey)
            UserDefaults.standard.synchronize()
        }
        Bundle.setLanguage(currentLanguage as? String)
    }
    
    class func currentLanguageString() -> String {
        return UserDefaults.standard.object(forKey: LanguageSaveKey) as! String
    }
    
    class func saveLanguage(languageString: String) {
        //1中文、2英语、3韩语、4西班牙、5日语
        UserDefaults.standard.set(languageString, forKey: LanguageSaveKey)
        if languageString == "zh-Hans" {
            UserDefaults.standard.set("1", forKey: LanguageKey)
        }else if languageString == "en" {
            UserDefaults.standard.set("2", forKey: LanguageKey)
        }else if languageString == "ko" {
            UserDefaults.standard.set("3", forKey: LanguageKey)
        }else if languageString == "es" {
            UserDefaults.standard.set("4", forKey: LanguageKey)
        }else if languageString == "ja" {
            UserDefaults.standard.set("5", forKey: LanguageKey)
        }
        UserDefaults.standard.synchronize()
        Bundle.setLanguage(languageString)
    }
    
}

