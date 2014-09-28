//
//  SetCard.swift
//  assignment1
//
//  Created by sora on 14-9-27.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import Foundation

struct SetCard {
    init(number:String, color:String, shape:String){
        self.number = number
        self.color  = color
        self.shape  = shape
    }
    
    func content() -> String {
        return "\(number)\(shape)\(color)"
    }
    
    var number = ""
    var color  = ""
    var shape  = ""
    
    var isChoose = false
    var isMatch  = false
}