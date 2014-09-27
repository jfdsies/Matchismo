//
//  PlayingCard.swift
//  assignment1
//
//  Created by sora on 14-9-15.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import Foundation

class PlayingCard: Card {
    
    var rankStrings:NSArray = ["?","A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    var validSuits:NSArray = ["♠️","♥️","♣️","♦️"]
    var rank = NSInteger()
    var suit = NSString()
    
    var suitSet:NSString{
        get{
            return self.suit
        }
        set{
            if validSuits.containsObject(newValue) {
                self.suit = newValue
            }
        }
    }
    
    override var contents:NSString {
        get{
            return rankStrings[rank].stringByAppendingString(suit)
        }
    }
    
    override func match(otherCards: [Card]) -> Int {
        var score = 0
        
        if otherCards.count >= 1 {
            var otherCard:PlayingCard = otherCards.first as PlayingCard
            if otherCard.rank == rank {
                score = 4 * otherCards.count
            } else if otherCard.suit.isEqualToString(suit) {
                score = 1 * otherCards.count
            }
        }
        
        return score
    }
    
    var rankSet:NSInteger{
        get{
            return self.rank
        }
        set{
            if newValue <= maxRank() {
                self.rank = newValue
            }
        }
    }
    
    func maxRank() -> NSInteger {
        return rankStrings.count - 1
    }
}