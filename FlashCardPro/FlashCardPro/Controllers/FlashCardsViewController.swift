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
    var count = 0
    
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
        if flashCardDeck?.flashCards.count == 0 {
            
            mainView.isHidden = true
            flashCardView.isHidden = true
            
        } else {
            flashCards = flashCardDeck?.flashCards
            
            questionTextView.text = flashCards![count].question
            answerTextView.text = flashCards![count].answer
            
            flashCardView.layer.cornerRadius = 15.0
            questionTextView.layer.cornerRadius = 15.0
            answerTextView.layer.cornerRadius = 15.0
            
        }
        
    }
    
    //MARK: IB Actions
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
        
        if count == 0 {
            return
        }else {
        count -= 1
        questionTextView.text = flashCards![count].question
        answerTextView.text = flashCards![count].answer
        }
    }
    
    
    @IBAction func rightArrowButtonTapped(_ sender: UIButton) {
        //go to next flashCard
        
        
        if count + 1 == flashCards?.count {
            return
        } else {
        count += 1
        if let flashCard = flashCards?[count] {
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

}
