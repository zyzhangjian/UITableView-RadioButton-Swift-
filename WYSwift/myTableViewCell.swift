//
//  myTableViewCell.swift
//  WYSwift
//
//  Created by 张健 on 16/3/23.
//  Copyright © 2016年 张健. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var leftButton: UIButton!
    
    var cellPath : NSInteger!
    
    var buttonClickBlock:((NSInteger)->(Void))?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.leftButton.addTarget(self, action: "leftButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
    }

    
    func leftButtonClick() {
        
        if buttonClickBlock != nil {
            
            buttonClickBlock!(cellPath)
            
        }
    }
    
    func setChecked(isChecked : Bool){
        
        leftButton.backgroundColor = isChecked ? UIColor.redColor() : UIColor.grayColor()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
