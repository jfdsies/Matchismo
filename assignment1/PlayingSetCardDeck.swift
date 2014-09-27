//
//  PlayingSetCardDeck.swift
//  assignment1
//
//  Created by sora on 14-9-27.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import Foundation

class PlayingSetCardDeck: SetDeck {
    override init() {
        super.init()
        
        let playingSetCard = PlayingSetCard()
        for color in playingSetCard.colorString {
            for number in playingSetCard.numberString {
                for shape in playingSetCard.shapeString {
                    var card = SetCard(number: number, color: color, shape: shape)
                    addCard(card)
                }
            }
        }
    }
}