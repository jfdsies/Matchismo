//
//  SetCardGameViewController.swift
//  assignment1
//
//  Created by sora on 27/9/14.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import UIKit

class SetCardGameViewController: UIViewController {

    @IBOutlet var cardsButton: [UIButton]!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBAction func touchCardButton(sender: AnyObject) {
        if let buttonIndex = find(cardsButton, sender as UIButton) {
            game?.chooseCardAtIndex(buttonIndex)
            updateUI()
        }
    }
    @IBAction func reStart(sender: AnyObject) {
        deck = nil
        game = nil
        deck = PlayingSetCardDeck()
        game = SetCardMatchingGame(initWithCardCount: cardsButton.count, usingDeck: deck!)
        updateUI()
    }
    
    var deck:PlayingSetCardDeck?
    var game:SetCardMatchingGame?
    
    func updateUI(){
        for button in cardsButton {
            if let buttonIndex = find(cardsButton, button) {
                if let cardIndex = game?.cardAtIndex(buttonIndex) {
                    if let card = game?.cards[cardIndex] {
                        button.setTitle(titleForCard(card), forState: UIControlState.Normal)
                        button.setBackgroundImage(backgroundImageForCard(card), forState: UIControlState.Normal)
                        button.enabled = !card.isMatch
                    }
                }
            }
        }
        if let score = game?.score {
            ScoreLabel.text = "Score: \(score)"
        } else {
            ScoreLabel.text = "Score: 0"
        }
    }
    func titleForCard(card:SetCard) -> String {
        return card.isChoose ? "" : card.content()
    }
    func backgroundImageForCard(card:SetCard) -> UIImage {
        return UIImage(named: card.isChoose ? "cardback" : "blank card")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        deck = PlayingSetCardDeck()
        game = SetCardMatchingGame(initWithCardCount: cardsButton.count, usingDeck: deck!)
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "analyze" {
            if var controler = segue.destinationViewController as? AnalyzeViewController {
                if let score = game?.score {
                    controler.result = score
                }
            }
        }
    }
}
