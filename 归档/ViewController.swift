//
//  ViewController.swift
//  归档
//
//  Created by 优谱德 on 2016/11/11.
//  Copyright © 2016年 youpude. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    // 创建一个全局路径，即要保存到闪存的位置
    let ContactFilePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].appending("/contacts.data")
    
    var contactArr:NSMutableArray?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initUI()
    }
    
    
    func initUI() {
    
        
        //let ContactFilePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.DocumentDirectory, FileManager.SearchPathDomainMask.UserDomainMask, true [0].stringByAppendingPathComponent("contacts.data")
        
        
        
        
        // 保存数组
        //
        
        
    }
    
    
    @IBAction func archveAction(_ sender: AnyObject) {
     
        // 归档
        
        contactArr = ["a", "b", 1]
        
        NSKeyedArchiver.archiveRootObject(self.contactArr!, toFile: ContactFilePath)
        
    }


    @IBAction func unArchveAction(_ sender: AnyObject) {
        // 从归档中读取给数组，如果第一次读取无数据，则实例化数组
        
        // 这里要用到 解档方法
        NSKeyedUnarchiver.unarchiveObject(withFile: ContactFilePath)
        
        var contactArr:NSMutableArray?
        if(contactArr == nil){
            
            print("从归档中提取")
            contactArr = NSKeyedUnarchiver.unarchiveObject(withFile: ContactFilePath) as! NSMutableArray!
            print(contactArr)
            
            if(contactArr == nil){
                print("归档中没有，创建数组")
                self.contactArr = NSMutableArray()
                
            }
            
        }
    }
}

