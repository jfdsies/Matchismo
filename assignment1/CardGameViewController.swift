//
//  CardGameViewController.swift
//  assignment1
//
//  Created by sora on 14-9-16.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import UIKit

class CardGameViewController: UIViewController {
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameModelSegment: UISegmentedControl!

    @IBAction func touchCardButton(sender: AnyObject) {
        if let chosenButtonIndex = find(cardButtons, sender as UIButton) {
            game?.chooseCardAtIndex(chosenButtonIndex)
            updateUI()
        }
        for var i=0; i<gameModelSegment.numberOfSegments; i++ {
            gameModelSegment.setEnabled(false, forSegmentAtIndex: i)
        }
    }
    @IBAction func reStart() {
        var gameModel = false
        if let state = game?.matchOneCard {
             gameModel = state
        }
        game = nil
        game = CardMatchingGame(initWithCardCound: cardButtons.count, usingDeck: PlayingCardDeck())
        game?.matchOneCard = gameModel
        var cardname = ""
        if let matchOneCard = game?.matchOneCard {
            if matchOneCard {
                cardname = "One"
            } else {
                cardname = "More"
            }
        }
        for var i=0; i<gameModelSegment.numberOfSegments; i++ {
            gameModelSegment.setEnabled(true, forSegmentAtIndex: i)
            if gameModelSegment.titleForSegmentAtIndex(i) == cardname {
                gameModelSegment.selectedSegmentIndex = i
            }
        }
        updateUI()
    }
    @IBAction func gameModel(sender: AnyObject) {
        var model = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        if model == "One" {
            game?.matchOneCard = true
        } else {
            game?.matchOneCard = false
        }
    }
    
    var flipsCount = 0
    var deck:PlayingCardDeck?
    var game:CardMatchingGame?
    
    func updateUI() {
        for cardButton in cardButtons {
            if let cardButtonIndex = find(cardButtons, cardButton) {
                var card = game!.cardAtIndex(cardButtonIndex)! as Card
                cardButton.setTitle(titleForCard(card), forState: UIControlState.Normal)
                cardButton.setBackgroundImage(backgroundImageForCard(card), forState: UIControlState.Normal)
                cardButton.enabled = !card.isMatched
            }
        }
        scoreLabel.text = "Score: \(game!.score)"
    }
    
    func titleForCard(card:Card) -> String {
        return card.isChose ? card.contents : ""
    }
    func backgroundImageForCard(card:Card) -> UIImage {
        return UIImage(named: card.isChose ? "blank card" : "cardback")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        deck = PlayingCardDeck()
        game = CardMatchingGame(initWithCardCound: cardButtons.count, usingDeck: PlayingCardDeck())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
