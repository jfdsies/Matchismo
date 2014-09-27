//
//  SetCardMatchingGame.swift
//  assignment1
//
//  Created by sora on 14-9-27.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import Foundation

let SET_MISMATCH_PENALTY = 2
let SET_MATCH_BOUND = 4
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
        if var card:SetCard = cardAtIndex(index) {
            if card.isChoose {
                cardsIsSelected = [Int]()
                card.isChoose = false
            } else {
                card.isChoose = true
                cardsIsSelected.append(index)
                var matchScore = 0
                if cardsIsSelected.count >= 3 {
                    matchScore = playingSetCard.matchSetCard(&cards, index: cardsIsSelected)
                    for i in cardsIsSelected {
                        if matchScore > 0 {
                            cards[i].isChoose = true
                            cards[i].isMatch = true
                            score += SET_MATCH_BOUND
                        } else {
                            cards[i].isChoose = false
                            cards[i].isMatch = false
                            score -= SET_MISMATCH_PENALTY
                        }
                    }
                    cardsIsSelected = [Int]()
                }
            }
            score -= SET_COST_TO_CHOOSE
        }
    }
    
    func cardAtIndex(index:Int) -> SetCard? {
        return (index < cards.count) ? cards[index] : nil
    }
}