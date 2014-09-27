//
//  Deck.swift
//  assignment1
//
//  Created by sora on 14-9-15.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import UIKit

class Deck {
    
    var cards = NSMutableArray()
    
    func addCard(card:Card, atTop:Bool) {
        if atTop {
            cards.insertObject(card, atIndex: 0)
        } else {
            cards.addObject(card)
        }
    }
    
    func addCard(card:Card) {
        addCard(card, atTop: false)
    }
    
    func drawRandomCard() -> Card? {
        if cards.count > 0 {
            var randomCard:Card?
            
            var index = Int(arc4random()) % cards.count
            
            randomCard = cards[index] as? Card
            cards.removeObjectAtIndex(index)
            
            return randomCard
        }
        return nil
    }
}
