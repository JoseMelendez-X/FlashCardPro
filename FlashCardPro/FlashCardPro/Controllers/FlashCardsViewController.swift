//
//  FlashCardsViewController.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/3/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import UIKit
import RealmSwift

class FlashCardsViewController: UIViewController {

    //MARK: - Properties
    var flashCardDeck: FlashCardDeck?
    var flashCards: List<FlashCard>?
    var isAnswerViewFaceUp = true
    var cardNumber = 0
    let realm = try! Realm()
    
    //MARK: - IB Outlets
    @IBOutlet weak var emptyDataView: UIView!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var questionAnswerLabel: UILabel!
    @IBOutlet weak var flashCardView: UIView!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerTextView: UITextView!

    
    //MARK: Lifecycle
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showFlashCards()

    }
    
    //MARK: IB Actions

    @IBAction func deleteFlashCardButtonTapped(_ sender: UIBarButtonItem) {
        
            do {
                try realm.write {
                    //delete flashCard from database
                    realm.delete((flashCardDeck?.flashCards[cardNumber])!)
                    
                    if cardNumber != 0 {
                        cardNumber -= 1
                    }
                    
                    showFlashCards()
                }
            } catch {
                print(error.localizedDescription)
            }
    }
    
    @IBAction func flipButtonTapped(_ sender: UIButton) {
        
        isAnswerViewFaceUp = !isAnswerViewFaceUp
        
        if isAnswerViewFaceUp {
              UIView.transition(from: answerView, to: questionView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            
                questionAnswerLabel.text = "Question"
        } else {
            
            UIView.transition(from: questionView, to: answerView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            
                questionAnswerLabel.text = "Answer"

        }
      
    }
    @IBAction func leftArrowButtonTapped(_ sender: UIButton) {
        
        if cardNumber == 0 {
            return
        }else {
        cardNumber -= 1
            print(cardNumber)
        questionTextView.text = flashCards![cardNumber].question
        answerTextView.text = flashCards![cardNumber].answer
        }
    }
    
    
    @IBAction func rightArrowButtonTapped(_ sender: UIButton) {
        //go to next flashCard
        if cardNumber + 1 == flashCards?.count {
            return
        } else {
        cardNumber += 1
            print(cardNumber)

        if let flashCard = flashCards?[cardNumber] {
            questionTextView.text = flashCard.question
            answerTextView.text = flashCard.answer
        }
    }
}
    
    
   
    //MARK: - Functions
    
    //Pass flashCard object to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateNewFlashCardVC" {
            let destinationVC = segue.destination as! CreateNewFlashCardViewController
            destinationVC.flashCardDeck = flashCardDeck
        }
    }
    
    //checks to see if there are flash cards in the deck
    func showFlashCards() {
        
        if flashCardDeck?.flashCards.count == 0 {
            
            mainView.isHidden = true
            flashCardView.isHidden = true
            
        } else {
            
            flashCardView.isHidden = false
            mainView.isHidden = false
            
            flashCards = flashCardDeck?.flashCards
            
            questionTextView.text = flashCards![cardNumber].question
            answerTextView.text = flashCards![cardNumber].answer
            
            flashCardView.layer.cornerRadius = 15.0
            questionTextView.layer.cornerRadius = 15.0
            answerTextView.layer.cornerRadius = 15.0
            
        }
        
    }

}
