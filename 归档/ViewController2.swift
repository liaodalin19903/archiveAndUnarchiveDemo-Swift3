//
//  ViewController2.swift
//  归档
//
//  Created by 优谱德 on 2016/11/11.
//  Copyright © 2016年 youpude. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    let ContactFilePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].appending("/userModel.data")
    
    var userDic: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func initUI() {
        
        
    }
    
    @IBAction func archveModel(_ sender: AnyObject) {
        
        let dic = [
            "username":"liao",
            "password":123456
        ] as [String : Any]
        
        let user = UserModel.initUserModelWithDic(dic: dic)
        
        let dic2 = [
            "type" : 1
        ]
        
        user.insertData(dic: dic2)
        
        print("archive之前\(user)")
        
        let b_suc:Bool = NSKeyedArchiver.archiveRootObject(user, toFile: ContactFilePath)
        if b_suc {
            
            print("归档模型成功")
        }else {
            print("归档模型失败")
        }
        
    }
    
    @IBAction func unarchveModel(_ sender: AnyObject) {
        
        // 这里要用到 解档方法
        NSKeyedUnarchiver.unarchiveObject(withFile: ContactFilePath)
        
        var contactArr:UserModel?
        if(contactArr == nil){
            
            print("从归档中提取")
            contactArr = NSKeyedUnarchiver.unarchiveObject(withFile: ContactFilePath) as? UserModel
            print((contactArr?.username)! + " " + String(describing: contactArr!.type))
            
            if(contactArr == nil){
                print("归档中没有，创建数组")
                self.userDic = UserModel.init()
                
            }
            
        }
    }
    
    

}
