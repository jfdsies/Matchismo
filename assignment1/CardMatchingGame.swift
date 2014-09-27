//
//  File.swift
//  assignment1
//
//  Created by sora on 14-9-18.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import Foundation

let MISMATCH_PENALTY = 2
let MATCH_BOUND = 4
let COST_TO_CHOOSE = 1

class CardMatchingGame {
    
    private(set) var score = 0
    lazy var cards = [Card]()
    lazy var cardsIsSelected = [Card]()
    var matchOneCard = false
    
    init(initWithCardCound count:Int, usingDeck deck:Deck){
        for var i=0; i < count; i++ {
            if let card:Card = deck.drawRandomCard() {
                cards.append(card)
            } else {
                break;
            }
        }
    }
    
    func chooseCardAtIndex(index:Int) {
        if var card:Card = cardAtIndex(index) {
            if card.isChose {
                cardsIsSelected = [Card]()
                card.chosen = false
            } else {
                if cardsIsSelected.count < 1 {
                    cardsIsSelected.append(card)
                } else {
                    var matchScore = card.match(cardsIsSelected)
                    if matchScore > 0 {
                        score += matchScore
                        cardsIsSelected.append(card)
                        for theCard in cardsIsSelected {
                            theCard.chosen = true
                            theCard.matched = true
                        }
                        if matchOneCard {
                            cardsIsSelected = [Card]()
                        }
                    } else {
                        if cardsIsSelected.count == 1 {
                            for theCard in cardsIsSelected {
                                theCard.chosen = false
                                theCard.matched = false
                            }
                            score -= MISMATCH_PENALTY
                        }
                        cardsIsSelected = [Card]()
                        cardsIsSelected.append(card)
                    }
                }
                score -= COST_TO_CHOOSE
                card.chosen = true
            }
        }
    }
    
    func cardGameReset() {
        for card in cards {
            card.chosen = false
            card.matched = false
        }
        score = 0
        cardsIsSelected = [Card]()
    }
    
    func cardAtIndex(index:Int) -> Card? {
        return (index < cards.count) ? cards[index] : nil
    }
}