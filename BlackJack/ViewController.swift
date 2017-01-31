//
//  ViewController.swift
//  BlackJack
//
//  Created by Mohamed Ayadi on 1/23/17.
//  Copyright © 2017 Mohamed Ayadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardsStackView: UIStackView!
 
    @IBOutlet var playerCards: [UILabel]!
    @IBOutlet weak var playerCardsResult: UILabel!
    
    @IBOutlet weak var standButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        standButton.isHidden = true
        hitButton.isHidden   = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func standButtonPressed(_ sender: Any) {
    }
    
    @IBAction func hitButtonPressed(_ sender: Any) {
        let card = UILabel()
        //I should fix the card text alligment to center.
        card.text = String(randomCardGenerator())
        playerCards.append(card)
        self.cardsStackView.addArrangedSubview(card)
        displayPlayersCardsResult()
        
    }

    
    @IBAction func startButton(_ sender: Any) {
        playerCards[0].text = String(randomCardGenerator())
        playerCards[1].text = String(randomCardGenerator())
        
        displayPlayersCardsResult()
        
        //I can use fan out button in this case.
        standButton.isHidden = false
        hitButton.isHidden   = false
    }
    
    //generate random card between 1 and 10 than retun that number back.
    func randomCardGenerator() -> Int{
        return Int(arc4random() % 10 + 1)
    }
    
    //Display the results of the player current cards.
    func displayPlayersCardsResult(){
        var result = 0
        for card in playerCards{
            result = result + Int(card.text!)!
        }
        playerCardsResult.text = String(result)
    }
}

