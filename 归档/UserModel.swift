//
//  UserModel.swift
//  归档
//
//  Created by 优谱德 on 2016/11/11.
//  Copyright © 2016年 youpude. All rights reserved.
//

import UIKit

class UserModel: NSObject,NSCoding {

    var username:String = ""
    var password: NSInteger = 0
    
    var type: Int = -1
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        
        username = (aDecoder.decodeObject(forKey: "username") as! NSString) as String
        password = aDecoder.decodeInteger(forKey: "password")
        type = aDecoder.decodeInteger(forKey: "type")
    }
    
    override init() {
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(username, forKey: "username")
        aCoder.encode(password, forKey: "password")
        aCoder.encode(type, forKey: "type")
    }
    
    /* methods */
    
    class func initUserModelWithDic(dic:[String:Any]) -> UserModel {
        
        let userModel: UserModel = UserModel.init()
        userModel.username = dic["username"] as! String 
        userModel.password = dic["password"] as! NSInteger
        
        return userModel
    }
    
    func insertData(dic:[String:Any]) {
        
        self.type = dic["type"] as! Int
    }
    
    
    
}


