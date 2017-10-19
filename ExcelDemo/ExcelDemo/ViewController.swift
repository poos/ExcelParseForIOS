//
//  ViewController.swift
//  ExcelDemo
//
//  Created by molangwu on 2017/8/17.
//  Copyright © 2017年 molangwu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LAWExcelParserDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func parserAction(_ sender: Any) {
        
        guard let path = Bundle.main.path(forResource: "test3", ofType: "xlsx") else {
            print("文件没找到")
            return
        }
//        if path is UIView {
//            <#code#>
//        }
       LAWExcelTool.shareInstance().delegate = self
        
        LAWExcelTool.shareInstance().parserExcel(withPath: path)
        
    }
    
    //LAWExcelParserDelegate
    func parser(_ parser: LAWExcelTool!, success responseObj: Any!) {
        let arr : NSArray = responseObj as! NSArray;
        for obj in arr {
            if obj is ZContent {
                let objc : ZContent = obj as! ZContent
                print(objc.keyName, objc.value)
            }
        }
    }
    

}

