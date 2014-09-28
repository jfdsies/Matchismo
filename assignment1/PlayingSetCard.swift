//
//  PlayingSetCard.swift
//  assignment1
//
//  Created by sora on 14-9-27.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import Foundation

class PlayingSetCard {
    var numberString = ["1️⃣","2️⃣","3️⃣"]
    var colorString = ["🚰","🆑","🚼"]
    var shapeString = ["🌽","🍉","🍋"]
    
    func matchSetCard(inout cards:[SetCard], index:[Int]) -> Int {
        var score = 0
        if index.count == 3 {
            var card1 = cards[index[0]]
            var card2 = cards[index[1]]
            var card3 = cards[index[2]]
            if threeValIsMatch(card1.number, s2: card2.number, s3: card3.number) &&
                threeValIsMatch(card1.color, s2: card2.color, s3: card3.color) &&
                threeValIsMatch(card1.shape, s2: card2.shape, s3: card3.shape){
                score = 1
            }
        }
        return score
    }
    
    func threeValIsMatch(s1:String, s2:String, s3:String) -> Bool {
        if (s1 != s2 && s1 != s3 && s2 != s3) ||
            (s1 == s2 && s1 == s3 && s2 == s3) {
                return true
        }
        return false
    }
}