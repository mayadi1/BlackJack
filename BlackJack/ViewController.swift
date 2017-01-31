//
//  ViewController.swift
//  BlackJack
//
//  Created by Mohamed Ayadi on 1/23/17.
//  Copyright © 2017 Mohamed Ayadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerCardsImage = [UIImageView]()
    
    @IBOutlet weak var cardsStackView: UIStackView!
 
    @IBOutlet weak var playerCardsResult: UILabel!
    
    @IBOutlet weak var standButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
    
    var cardResult = 0
    
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
        let cardNumber = randomCardGenerator()
        let cardImage = UIImageView()
        //I should fix the card text alligment to center.
        cardImage.image = UIImage(named: String(cardNumber))
        playerCardsImage.append(cardImage)
        self.cardsStackView.addArrangedSubview(cardImage)
        self.cardResult = self.cardResult + cardNumber
        displayPlayersCardsResult()
    }

    
    @IBAction func startButton(_ sender: Any) {
       self.cardResult = 0
        for view in self.playerCardsImage{
        self.cardsStackView.removeArrangedSubview(view)
        }
        playerCardsImage.removeAll()

        self.cardsStackView.reloadInputViews()
        let card1 = randomCardGenerator()
        let card2 = randomCardGenerator()
        let cardImage1 = UIImageView()
        let cardImage2 = UIImageView()
       
        cardImage1.image = UIImage(named: String(card1))
        cardImage2.image = UIImage(named: String(card2))
        playerCardsImage.append(cardImage1)
        playerCardsImage.append(cardImage2)
        self.cardsStackView.addArrangedSubview(cardImage1)
        self.cardsStackView.addArrangedSubview(cardImage2)

        self.cardResult = card1 + card2
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
        playerCardsResult.text = String(self.cardResult)
    }
}

