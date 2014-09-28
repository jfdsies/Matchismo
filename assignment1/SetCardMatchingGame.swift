//
//  SetCardMatchingGame.swift
//  assignment1
//
//  Created by sora on 14-9-27.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import Foundation

let SET_MISMATCH_PENALTY = 2
let SET_MATCH_BOUND = 10
let SET_COST_TO_CHOOSE = 1

class SetCardMatchingGame {
    private(set) var score = 0
    lazy var cards = [SetCard]()
    var cardsIsSelected = [Int]()
    lazy var playingSetCard = PlayingSetCard()
    
    init(initWithCardCount count:Int, usingDeck deck:SetDeck) {
        for var i=0; i < count; i++ {
            if var card:SetCard = deck.drawRandomCard() {
                cards.append(card)
            } else {
                break
            }
        }
    }
    
    func chooseCardAtIndex(index:Int) {
        if var cardIndex:Int = cardAtIndex(index) {
            if cards[cardIndex].isChoose {
                cardsIsSelected = [Int]()
                cards[cardIndex].isChoose = false
            } else {
                cards[cardIndex].isChoose = true
                cardsIsSelected.append(index)
                var matchScore = 0
                if cardsIsSelected.count >= 3 {
                    matchScore = playingSetCard.matchSetCard(&cards, index: cardsIsSelected)
                    if matchScore > 0 {
                        score += SET_MATCH_BOUND
                    } else {
                        score -= SET_MISMATCH_PENALTY
                    }
                    for i in cardsIsSelected {
                        if matchScore > 0 {
                            cards[i].isChoose = true
                        } else {
                            cards[i].isChoose = false
                        }
                    }
                    cardsIsSelected = [Int]()
                }
            }
            score -= SET_COST_TO_CHOOSE
        }
    }
    
    func cardAtIndex(index:Int) -> Int? {
        return (index < cards.count) ? index : nil
    }
}