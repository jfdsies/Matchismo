//
//  SetDeck.swift
//  assignment1
//
//  Created by sora on 14-9-27.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import Foundation

class SetDeck {
    var cards = [SetCard]()
    
    func addCard(card:SetCard,atTop:Bool) {
        if atTop {
            cards.insert(card, atIndex: 0)
        } else {
            cards.append(card)
        }
    }
    
    func addCard(card:SetCard) {
        addCard(card, atTop: false)
    }
    
    func drawRandomCard() -> SetCard? {
        if cards.count > 0 {
            var randomCard:SetCard?
            
            var index = Int(arc4random()) % cards.count
            
            randomCard = cards[index]
            cards.removeAtIndex(index)
            
            return randomCard
        }
        return nil
    }
}