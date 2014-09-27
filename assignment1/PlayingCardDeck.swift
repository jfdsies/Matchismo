//
//  PlayingCardDeck.swift
//  assignment1
//
//  Created by sora on 14-9-15.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import Foundation

class PlayingCardDeck: Deck {
    override init() {
        super.init()
        
        let playingCard = PlayingCard()
        for suit in playingCard.validSuits {
            for var rank = 1; rank <= playingCard.maxRank(); rank++ {
                var card = PlayingCard()
                card.rankSet = rank
                card.suitSet = suit as NSString
                addCard(card)
            }
        }
    }
}