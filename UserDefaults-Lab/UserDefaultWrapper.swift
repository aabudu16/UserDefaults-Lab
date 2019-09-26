//
//  UserDefaultWrapper.swift
//  UserDefaults-Lab
//
//  Created by Mr Wonderful on 9/24/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation

struct UserDefaultWrapper {
    
    static let shared = UserDefaultWrapper()
    
    private let userName = "userName"
    private let userSign = "sign"
    private let birthDate = "date"
    private let userHorsocope = "horsocope"
    
    
    func getName()->String?{
        return UserDefaults.standard.value(forKey: userName) as? String
    }
    
    func getSign()->String?{
        return UserDefaults.standard.value(forKey: userSign) as? String
    }
    
    func getDate()->String?{
        return UserDefaults.standard.value(forKey: birthDate) as? String
    }
    
    func getHorsocope()->String?{
        return UserDefaults.standard.value(forKey: userHorsocope) as? String
    }
    
    func store(name:String){
       UserDefaults.standard.set(name, forKey: userName)
    }
    
    func store(sign:String){
        UserDefaults.standard.set(sign, forKey: userSign)
    }
    
    func store(date:String){
        UserDefaults.standard.set(date, forKey: birthDate)
    }
    
    func store(horsocope:String){
        UserDefaults.standard.set(horsocope, forKey: userHorsocope)
    }
    
    
}
