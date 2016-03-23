//
//  ViewController.swift
//  WYSwift
//
//  Created by 张健 on 16/3/23.
//  Copyright © 2016年 张健. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    var dataArray : NSMutableArray!
    
    var mutableDic : NSMutableDictionary!
    
    var selectCellPath : NSInteger?
    
    // MARK: - VC Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "你是我的眼"

        self.initArray();
        
    }
    
     // MARK: - 数组初始化
    func initArray() {
        
        dataArray = NSMutableArray()
        
        for var i = 0; i < 20; i++ {
            
            mutableDic = NSMutableDictionary()
            
            mutableDic .setObject("false", forKey: "isClick")
            
            dataArray .addObject(mutableDic)
            
        }
        
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : myTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! myTableViewCell
        
        cell.leftButton.setTitle("点我点我", forState: UIControlState.Normal)
        
        cell.cellPath = indexPath.row
        
        cell.buttonClickBlock = {(path)-> Void in
            
            self.cancelAllSelectButtonWithCell(cell)
            
            let mtbDic = self.dataArray[path]
            
            if mtbDic.objectForKey("isClick")!.isEqualToString("false"){
                
                for var i = 0; i < self.dataArray.count; i++ {
                    
                    mtbDic .setObject(path == self.selectCellPath ? "false" : "true", forKey: "isClick")
                    
                    cell.setChecked(!(path == self.selectCellPath))
                }

            }else{
                
                mtbDic.setObject("false", forKey: "isClick")
                
                cell.setChecked(false)
            }
            
            
            self.selectCellPath = path == self.selectCellPath ? -1 : path
        }
        
        (self.dataArray[indexPath.row] as! NSMutableDictionary).setObject((self.dataArray[indexPath.row] as! NSMutableDictionary).objectForKey("isClick")!.isEqualToString("false") ? "false" : "true", forKey: "isClick")
        
        cell.setChecked((self.dataArray[indexPath.row] as! NSMutableDictionary).objectForKey("isClick")!.isEqualToString("false") ? false : true)

        return cell
    }

    // MARK: - 取消全部选择按钮状态
    func cancelAllSelectButtonWithCell(cell : myTableViewCell) {
        
        for var i = 0; i < dataArray.count; i++ {
            
            let mtbDic = dataArray[i]
            
            mtbDic .setObject("false", forKey: "isClick")
            
            cell.setChecked(true)
            
            myTableView .reloadData()
            
        }
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

