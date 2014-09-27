//
//  Card.swift
//  assignment1
//
//  Created by sora on 14-9-15.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import UIKit

class Card {
    
    var contents:NSString{
        get{
            return ""
        }
    }
    var chosen = false
    var matched = false
    
    var isChose:Bool {
        get{
            return chosen
        }
    }
    var isMatched:Bool {
        get{
            return matched
        }
    }
    
    func match(otherCards:[Card]) -> Int {
        var score = 0
        
        for card in otherCards {
            if card.contents == contents {
                score = 1
            }
        }
        
        return score
    }
}
